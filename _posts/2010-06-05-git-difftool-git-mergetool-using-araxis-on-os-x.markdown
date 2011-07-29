--- 
layout: default
title: git-difftool & git-mergetool - using Araxis on OS X
tags: []

type: regular

---
We use GitHub at [work](http://www.zumodrive.com) for all projects. One of the things I've always missed while using git is the ability to see 2 files side-by-side when I view diffs. The minimal context that you get when you do `git diff | mate` is just not enough sometimes. I discovered a solution to this today.

Git supports external diff-tool and merge-tools. In fact, there's a [git-difftool](http://www.kernel.org/pub/software/scm/git/docs/git-difftool.html) and a [git-mergetool](http://www.kernel.org/pub/software/scm/git/docs/git-mergetool.html) command just for this purpose. You can plug-n-play any common diff/merge viewer tool with git via these two commands. OS X ships with a decent diff/merge tool - `FileMerge aka opendiff` but it didn't work that well. So I got myself a copy of [Araxis Merge](http://www.araxis.com/merge_mac/index.html) for the Mac. 

Once you instruct git to use a difftool, you can just do something like `git difftool topic-branch-X..master` in the shell, and git will open up Araxis Merge with the 2 files. Similarly with the mergetool, after you do a `git merge` and end up with a bunch of conflicts, you can type `git mergetool` to resolve these conflicts from inside Araxis Merge.

Here's the configuration that I'd to do to get git to use Araxis as the difftool and the mergetool (there's lots of info about this on StackOverflow which is how I got started). 

Save the following into a file called `araxisgitdifftool.sh`:

<script src="http://gist.github.com/425783.js?file=araxisgitdifftool.sh"></script>

Append the following to your `~/.gitconfig`:

<script src="http://gist.github.com/425783.js?file=gistfile1.cfg"></script>

I'm still not completely happy with this. Araxis opens up each changed file in a separate window which means if a lot of files changed in a diff, it'll open up lots of windows. Thankfully it's quite fast and very responsive compared to File Merge but still worries me when I've to view diffs with lots of changed files.
