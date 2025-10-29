---
title: Includes, rsync and Variables - Oh My!
date: Fri, 08 Jul 2022
---

Even though `pblog` was just launched a week ago, it has since been updated with some nice quality-of-life improvements.

### Default "header" &amp; "footer" Includes

A new variable was added to the main `pblog.sh` configuration file called `INC_HEAD_FOOT`. By default this is set to `true` and simply pulls in two HTML files:

- `_header.html`: all content within is placed directly after the opening `body` tag
- `_footer.html`: all content within is placed directly before the closing `body` tag

These includes are added to every outputted file from inside both the `posts` and `pages` directories on build.

### Syncing Changes with rsync

Although it adds another dependency to the project, I believe utilizing `rsync` for the generated files is far better then nuking the directory from orbit each time. This also provides a cleaner experience for users syncing their `_output` directory with their web server of choice.

### On the Horizon...

My plan was to also tackle the issue of "auto rebuilds" when running `pblog` locally. This became more of a headache than I initially estimated - so it was dropped from this patch. My hope is to get something up-and-running in the near future, while avoiding the inclusion of yet another major dependency. Anyone more experienced than myself in the ways of "auto rebuilds" is free to open a patch if they so desire!

Thanks for your interest in these minor updates!

P.S. Don't forget - if your website runs on `pblog` be sure to reach out and get it featured on the [homepage](/)!
