---
title: pblog
toc: false
---

<img style="max-width:300px;" src="/media/pbj.svg" alt="Peanut butter sandwich">

## Pandoc static blog generator

`pblog` comes packed with an incredible list of features:

- 5-second configuration
- Write all your posts and pages in Markdown
- Valid RSS 2.0 feed (customized design too!)

and it also *doesn't* ship with a lot of other features:

- No advanced template layouts
- No themes
- No categories / tagging systems
- No comments
- No auto rebuilds for local testing

But you can add these things yourself with a little know-how and patience! The goal of `pblog` is to remain as bare-bones as possible, so these "extras" are left out intentionally.

## Live Demo

This very website is a live demo! Mind blowing, right? Take a look at the [automated blog list](/blog) to see some blog posts.

## Requirements

#### On MacOS / BSD Systems

- [rsync](https://linux.die.net/man/1/rsync)
- [coreutils](https://www.gnu.org/software/coreutils/)
- [xsltproc](http://xmlsoft.org/xslt/xsltproc.html)
- [Pandoc](https://pandoc.org/installing.html)

#### On Linux

- [rsync](https://linux.die.net/man/1/rsync)
- [xsltproc](http://xmlsoft.org/xslt/xsltproc.html)
- [Pandoc](https://pandoc.org/installing.html)

## Getting Started

1. Clone the project repo: [https://git.btxx.org/pblog](https://git.btxx.org/pblog)
2. Edit the variables inside the `_config.sh` file
3. **!! Pay close attention to the `OS` variable to set your correct operating system !!**
4. Edit the posts in `posts` and pages in `pages` to your own
5. Run `make` from the root directory
6. Upload the contents of the `_output` folder to your server
7. Profit!!!

For a more in-depth look, take a look at the article [Introducing pblog](/blog/pblog-intro.html)

## Base Settings

#### Table of Contents

By default `pblog` ships with TOC (Table of Contents) enabled. You can disable this on each individual page or post by editing the `TOC `variable in `pblog.sh` to `false`:

```yaml
TOC: false
```

#### Code Highlighting

`pblog` uses the standard syntax highlighting provided with Pandoc. To disable this, set the `SYNTAX` variable to `false` in `pblog.sh`:

```yaml
SYNTAX: false
```

## Extras

- Add all media files (images, videos, etc.) under the `media` folder
- Customize the look of your blog by editing the included `style.css`
- Looking for fancier *image manipulation*? Take a look at [this detailed post to get setup](/tweaks.html)

You can share your **pblog** websites by emailing me at the address listed below and I'll add them here.

brad at bt {dot} ht

## Websites Using `pblog`

- [pblog.btxx.org](https://pblog.btxx.org) (this site!)
- [ng5p.com](https://www.ng5p.com)
