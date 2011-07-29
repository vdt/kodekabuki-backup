--- 
layout: default
title: Stupid software design decisions - Timeout-based dialog boxes
tags: []

type: regular

---
The more [tag]software[/tag] I use, the more I realise how many stupid design decisions we (software engineers) make when writing software. And instead of just grumbling about it alone in front of my computer which unfortunately cannot yet understand whatever I'm saying to it (if it ever becomes intelligent enough to understand human speech, it probably will be intelligent enough to stop listening to whatever I say to it anyways), I've decided to post them to my blog where some humans can give them a few eyeballs!
So here comes the first one - I recently bought a 19" LCD panel and I use it as a secondary display along with my laptop's screen. My laptop has an Intel [tag]i915[/tag] chipset, and Intel has a pretty good [tag]driver[/tag] which lets you set up dual-display quite easily (screenshot below).

<img align="middle" alt="Intel GMA driver screenshot" title="Intel GMA driver screenshot" src="http://i60.photobucket.com/albums/h35/mallipeddi/intel_GMA_driver_options.jpg" />

<strong>The [tag]bug[/tag]</strong>

Although the driver works nicely. It has a really stupid bug. The problem with it is everytime I make a change to any of the settings in that [tag]dialog box[/tag] shown above and apply them, the computer goes into a small period of extremely high [tag]CPU[/tag] usage - this is understandable because it has to re-render the two screens according to the new settings. And because it is engaged in a CPU-intensive task currently, the mouse pointer changes into a "sandclock" just as it normally would in Windows.

Here comes the stupid part...

Immediately after I click the "Apply" button, the driver displays a "15 second timeout window" asking me to choose whether the new setup is OK or not. If I do not click anything within the 15 seconds that I have been given, it reverts back to the old settings. The funny thing is, I cannot press anything before the 15 sec timeout because my computer is busy applying the changes! And here starts the madness - I bestow all my hope upon the operating system's context switching algorithm and do a rapid burst of clicks with my mouse (sometimes breaking the barriers of human reflexes) in the hope of my mouse clicks actually getting noticed. I win sometimes, and I lose sometimes!

<strong>The fix</strong>

A simple fix to this problem would be to just ask the user to either press the "Y" or "N" key to accept the new settings or to reject it respectively. Because (as I understand it) the whole philosophy behind sticking in a '15 sec [tag]timeout[/tag] window' in there is to prevent a situation where the new settings were improper and nothing got rendered and as a result the user would not be in a position to see, point and click the "[tag]Cancel[/tag]" button. The point is the user is trying to fix his display, and accepting input in a manner which directly depends on his display working properly is very stupid in the first place. Accepting confirmation from the keyboard would solve all the problems here!

Hopefully someone from [tag]Intel[/tag] is reading this...
