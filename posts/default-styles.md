---
title: New Default Styling and 2x Faster!
date: Wed, 27 Jul 2022
---

If it wasn't already obvious, this project has received a minor styling overhaul. But looks weren't the only thing updated with this latest patch.

The total build process time is now *two times faster*! 

Keep reading for more details.

## The Default "Theme"

The styling changes aren't anything ground breaking. They simply center the main content and add a little more visual separation of the content and backdrop. Again, you can customize `pblog` as you see fit, but having a sane default is always nice.

## New Config Setup

Since updates and performance fixes might continue to come through in the future, I didn't want to make users play around with their default configuration every single time. Now, all main configuration is handled in the new `_config.sh` file.

```sh
#!/bin/sh

# Site specific settings
###################################################################################
DOMAIN="https://pblog.bt.ht"
TITLE="pblog"
DESCRIPTION="Pandoc static blog generator"
COPYRIGHT="Copyright 2022, Bradley Taunt"
AUTHOR="brad@bt.ht (Bradley Taunt)"
OS="Linux" # "Linux" for Linux, "BSD" for BSD Systems (including MacOS)
HTML_LANG="en_US" # Your document (HTML) language setting

# Blog structure settings (most users should use these defaults)
###################################################################################
TOC=true
SYNTAX=true
PAGES_DIR="pages/"
POSTS_DIR="posts/"
PAGES=$(find $PAGES_DIR -type f)
POSTS=$(find $POSTS_DIR -type f)
WEB_HTML="blog/"
OUTPUT="_output/"
TIME="01:00:00 EST"
TTL="60"
```

Feels cleaner already, right?

## Cutting the Build Time in Half

I must give big kudos to [Matthew Graybosch](https://matthewgraybosch.com) for inspiring this pretty big improvement. After some discussion over emails we both agreed that it seemed overkill to render the blog content twice (once for the XML feed itself and then again for all posts listed under `blog`). Performance wasn't the initial goal when I first launched this project, but now that the dust has settled it seemed appropriate to go back and fix some things.

`pblog` now only needs to render the blog posts found in the `posts` directory *once*. It still produces semantic XML and keeps the webview versions of the articles looking solid. Overall I'm pretty happy with this *little* improvement - it should pretty noticeable on projects rendering many posts.

## Far From Perfect

This project is still very much in it's infancy. So if you notice something odd or broken in your own testing, please don't hesitate to open a patch or simply bring up the issue!

Thanks for reading,

-- Brad