--- 
layout: default
title: "Valve: re-engineering game engines for the latest multi-core machines"
tags: []

type: regular

---
<p>Game engine pipeline <strong>before optimizing</strong> for multi-core:</p>
<blockquote>
    <ol>
        <li>Build world lists (background, scenery, etc.)</li>
        <li>Build object lists (players, nonplayer characters, items)</li>
        <li>Graphical simulation (particles, ropes, sprites)</li>
        <li>Update animations (such as skeletal animation used for character movement)</li>
        <li>Compute shadows</li>
        <li>Draw (send display commands to the graphics card)</li>
    </ol>
</blockquote>
<p>Game engine pipeline <strong>after optimizing</strong> for multi-core:</p>
<blockquote>
    <ol>
        <li>Construct scene rendering lists for multiple scenes in parallel (world, water reflections, and TV monitors)</li>
        <li>Overlap graphics simulations</li>
        <li>Compute character skeletal transformations for all characters in all scenes in parallel</li>
        <li>Compute shadows for all characters in parallel</li>
        <li>Allow multiple threads to draw in parallel (this required a rewrite of the graphics libraries that live directly above Direct3D)</li>
    </ol>
</blockquote>
<p><strong>Game development economics</strong></p>
<blockquote>
    <p>Gabe mentioned that even if a<strong> million people</strong> upgrade to quad-core CPUs in a year (which Valve believes is not beyond the realm of possibility given its hardware surveys) those <strong>numbers weren't enough to pay</strong> for putting a box in retail stores that would require this hardware for best performance.</p>
</blockquote>
<p><a href="http://arstechnica.com/articles/paedia/cpu/valve-multicore.ars">Read more</a> about how Valve is re-engineering their existing game engines to take advantage of the multi-core machines that people are buying these days.</p>
<p><small>Tags: <a rel="tag" href="http://technorati.com/tag/valve">valve</a>, <a rel="tag" href="http://technorati.com/tag/half-life">half-life</a>, <a rel="tag" href="http://technorati.com/tag/computer+game">computer game</a>, <a rel="tag" href="http://technorati.com/tag/quad-core">quad-core</a>, <a rel="tag" href="http://technorati.com/tag/dual-core">dual-core</a>, <a rel="tag" href="http://technorati.com/tag/intel">intel</a>, <a rel="tag" href="http://technorati.com/tag/parallel">parallel</a>, <a rel="tag" href="http://technorati.com/tag/multithreading">multithreading</a></small></p>

