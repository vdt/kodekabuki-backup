--- 
layout: default
title: "Recipe: encrypt/decrypt clipboard contents on OS X"
tags: []

type: regular

---
I've started using the following whenever I need to store sensitive stuff in Evernote/Dropbox/GMail/etc.

<pre><code>
encrypt_aes128() {
    pbpaste | openssl enc -e -aes128 -base64 -pass "pass:$1" | pbcopy
}
decrypt_aes128() {
    pbpaste | openssl enc -d -aes128 -base64 -pass "pass:$1" | pbcopy
}
</code></pre>
