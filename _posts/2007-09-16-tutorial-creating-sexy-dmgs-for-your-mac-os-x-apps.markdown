--- 
layout: default
title: "Tutorial: Creating sexy DMGs for your Mac OS X apps"
tags: 
- tutorial
- apple
- mac
- osx
- dmg
- app
- package
- installer
- software
type: regular

---
<p>You've probably seen a window like the one below open up in Finder when you tried to install an app in Mac OS X by double-clicking the DMG file. I'm going to teach you how to do it yourself (it is ridiculously simple once you know how to do it!).</p>

<p><div style="margin-left: 40px;"><a title="firefox-dmg.png" href="http://s60.photobucket.com/albums/h35/mallipeddi/?action=view&amp;current=firefox-dmg.png"><img src="http://i60.photobucket.com/albums/h35/mallipeddi/firefox-dmg.png" border="0" /></a>
</div></p>

<p>Follow these steps:
<ol><li>Open Disk Utility. Create an empty DMG image of a sufficiently large size. Don't worry we'll compress the DMG later. Leave Encryption to None, and Format settings to R/W.</li><li>Open the newly-created DMG file in Finder.</li><li>Now lets customize the look-n-feel of the DMG window in Finder. Right-click and select "Show View Options". 
</li><li>In "View Options" window, select "This Window Only" (very important; otherwise you would end up changing the view options for all your Finder windows).</li><li>Create a hidden folder in the root directory of the mounted DMG. Just open up a Terminal and change directory to /Volumes/&lt;your_dmg_file&gt; and then create a hidden folder for your background image (eg: /Volumes/your_dmg_file/.background/)</li><li>Put your background image inside this newly created hidden .background folder.</li><li>In the View Options window, select the background image. Typically the hidden .background folder won't show up in the Browse window. Just type Cmd-Shift-G and navigate to "/Volumes/your_dmg_file/.background/" and select your background image.</li><li>Now position your app files (binary, help file, README.txt, symbolic link to Applications folder) in the window on top of your background image. Remember to disable "Align to Grid" in the View Options window. Otherwise your icons won't sit where you want them to.</li><li>Customize icons: customize the icons for your app files, the mounted DMG in the sidebar.
</li><li>You might have noticed that normally when you open the DMGs for other apps, they open in a separate Finder window which doesn't have the sidebar, and the toolbar. In order to achieve this, you need to use this shareware app: <a href="http://autoopen.nibfile.com/">AutoOpen</a>. I'll let you read their Help file to figure out the rest.</li><li>Now eject the DMG.</li><li>Lets compress this DMG and also make it read-only. Open the DMG again in Disk Utility. Click on Convert. You can figure out the rest.</li><li>Open up the newly-created compressed DMG. It should open in a separate Window. The window size maybe a bit off compared to your background image. Don't worry. Just re-size your window. Eject DMG. And mount DMG again. Now the window size should be just perfect!</li><li>That's it!</li></ol>
</p>

<p>
Look at what I achieved by following the exact same steps:
</p>

<p>
<div style="margin-left: 40px;"><a title="Wireless@SG Finder Beta" href="http://www.flickr.com/photos/41059471@N00/1388020876/"><img src="http://static.flickr.com/1014/1388020876_48157f52a0_d.jpg" border="0" /></a></div>
</p>
