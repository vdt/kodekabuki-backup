#!/usr/bin/env ruby

# Script to import tumblr posts into local markdown posts ready to be consumed by Jekyll.
# Inspired by New Bamboo's post http://blog.new-bamboo.co.uk/2009/2/20/migrating-from-mephisto-to-jekyll
# Supports post types: regular, quote, link, photo, video and audio
# Saves local copies of images

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'mime/types'
require 'fileutils'
require 'pathname'
require 'date'
require 'yaml'

# Configuration
TUMBLR_DOMAIN =   "http://mallipeddi.tumblr.com"
WRITE_DIRECTORY = "_posts"
IMAGE_DIRECTORY = "_images"
LAYOUT = "default"

Dir.mkdir WRITE_DIRECTORY unless File.directory? WRITE_DIRECTORY
Dir.mkdir IMAGE_DIRECTORY unless File.directory? IMAGE_DIRECTORY

# follow 3xx redirection
def fetch(uri_str, limit = 10)
  raise ArgumentError, 'HTTP redirect too deep' if limit == 0
  uri = URI.parse(uri_str)
  puts "Fetching #{uri} -- #{limit}"
  response = Net::HTTP.get_response(uri)
  yield case response
  when Net::HTTPSuccess     then response
  when Net::HTTPRedirection then fetch(response['location'], limit - 1) { |resp| resp }
  else
    response.error!
  end
end

# save a local copy of a tumblr-hosted image and return the relative uri
def fetch_img(uri_str) 

  uri = URI.parse(uri_str)

  fetch(uri_str) do |resp|
    mime_type = MIME::Types[resp["content-type"]].first

    # build our local image path
    path = "#{uri.host}#{uri.path}"

    # rewrite extension
    extension = mime_type.extensions.first
    extension = extension == "jpeg" ? "jpg" : extension
    path = "#{path.chomp(File.extname(path))}.#{extension}"

    print "Image: #{uri_str} --> #{path}\n"

    local_path = "#{IMAGE_DIRECTORY}/#{path}"
    FileUtils.mkdir_p Pathname.new(local_path).dirname
    open(local_path, "wb") { |file| file.write(resp.body) }

    return "/images/#{path}"
  end
end

# Tumblr api only returns 50 posts per call
post_offset = 0
posts_returned = -1
while posts_returned != 0

  path = TUMBLR_DOMAIN + "/api/read?num=50&filter=none&start=#{post_offset}"

  # Connect to Tumblr and read the API source
  fetch(path) do |resp|
    xml = resp.body
    doc = Nokogiri::XML.parse(xml)
    posts = doc.css("post")
    posts_returned = posts.count
    post_offset += posts.count
    posts.each do |post_tag|

      # Gather data about each post 
      date = Date.parse(post_tag.attributes["date"].content)
      id = post_tag.css("@id").first.content
      slug_tag = post_tag.css("slug").first
      slug = slug_tag.nil? ? nil : slug_tag.content
      type = post_tag.attributes["type"].content
      tags = post_tag.css("tag").map{|t| t.content }
      title = nil
      body = nil

      if type == "regular"    
        title_tag = post_tag.css("regular-title").first
        title = title_tag.nil? ? nil : title_tag.content
        body = post_tag.css("regular-body").first.content
      elsif type == "quote"    
        text = post_tag.css("quote-text").first.content
        source = post_tag.css("quote-source").first.content
        body = "> #{text}" + "\n\n" + source
      elsif type == "link"
        text_tag = post_tag.css("link-text").first
        text = text_tag.nil? ? nil : text_tag.content
        link = post_tag.css("link-url").first.content
        text = link if text.nil?
        body = "<a href=\"#{link}\">#{text}</a>"
        desc_tag = post_tag.css("link-description").first
        if desc_tag != nil
          body << "\n\n#{desc_tag.content}"
        end
      elsif type == "photo"
        body = ""  

        photoset_tag = post_tag.css("photoset").first
        if photoset_tag.nil?
          body += "<img src=\"#{post_tag.css("photo-url").first.content}\" />"
        else
          post_tag.css("photo").each do |photo_tag|
            body += "<img src=\"#{photo_tag.css("photo-url").first.content}\" />"
          end
        end
        text = post_tag.css("photo-caption").first.content
        body += "\n\n#{text}" 
      elsif type == "video"
        caption_tag = post_tag.css("video-caption").first 
        if caption_tag != nil
          text = caption_tag.content
        end
        body = post_tag.css("video-source").first.content
      elsif type == "audio"
        caption_tag = post_tag.css("audio-caption").first 
        text = caption_tag.nil? ? nil : caption_tag.content
        body = post_tag.css("audio-player").first.content
      else
        print "ERROR: Post type not supported\n"
        next
      end

      if !title && !text
        print "ERROR: Post title and text are nil: #{id}\n"
        print "#{doc}"
        next
      end

      # title defaults
      title ||= text
      title = title.gsub(/<.*?>/,'') # strip stuff which conflicts with yaml parsing

      # create the slug if necessary and build a _post filename
      slug = "#{title.gsub(/(\s|[^a-zA-Z0-9])/,"-").gsub(/-+/,'-').gsub(/-$/,'').downcase}" if slug.nil?
      slug = slug[0,150] if slug.length > 150
      filename = "#{date.strftime("%Y-%m-%d")}-#{slug}.markdown"

      # if there's no post, we give up.
      if !body
        next
      end

      tagcode = ""
      if tags.size > 0
        tagcode = "tags:\n"
        for t in tags
          tagcode << "  - #{t}\n"
        end
      end

      title = "#{title[0,85]}..." if title.length > 85
      yaml_front_matter = {
        "title" => title,
        "layout" => LAYOUT,
        "tags" => tags,
        "type" => type
      }.to_yaml
      jekyll_post = <<-EOPOST
#{yaml_front_matter}
---
#{body}
EOPOST

      # Write files
      fname = "#{WRITE_DIRECTORY}/#{filename}"
      unless File.exists?(fname)
        File.open(fname, "w") do |f|
          f.write(jekyll_post)
        end
        puts "Created #{filename}"
      end
    end
  end
end

puts "Done."

status = `git status`
if (status =~ /nothing to commit/)
  puts "Nothing to do."
else
  if system("git commit -a -m \"snapshot: #{Time.now.to_s}\" && git push -u origin master")
    puts "Updated."
  else
    puts "Failed."
  end
end