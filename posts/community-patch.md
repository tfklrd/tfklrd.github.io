---
title: 'First Community Patch & Tweaks'
date: Fri, 15 Jul 2022
---

`pblog` has received its first community patch! By "community" I mean someone other than myself has helped make this blog generator even better. So special thanks to [Matthew Graybosch](https://matthewgraybosch.com/) for contributing to this humble project and patching in some solid quality of life improvements.

This is why open source is great: smarter people can help fix your mashed-up spaghetti code!

### The Changes

1. Both pages and posts now generated *Table of Contents* by default
    - You have the ability to disable this site-wide in the `pblog` config
2. Ability to disable Pandoc generated syntax highlighting
3. `xsltproc` will now generate HTML5 and include the RSS feed description under the title
    - See it live on the [main RSS XML feed](/feed.xml)
4. New metadata variable (`HTML_LANG`) in the `pblog.sh` config
5. Generated pages and posts now have "Table of Contents" by default
    - This can be disabled in individual files with `toc: false`
6. Cleaned up redundant find statements

### Some Features Left Behind...

Also suggested in this patch was the addition of more advanced image manipulation via `ImageMagick`. This additional feature was pretty great from my testing but I felt as though adding an extra dependency and *slightly* more complex settings to `pblog` was moving things further from simplicity.

**BUT** - that doesn't mean you can't take this great feature with you!

### Introducing "Tweaks"

I feel that `pblog` should always remain as simple as possible at the core. Let people get something up-and-running with the least amount of friction as possible. But I know that some users might want to squeeze just a *little* bit more out of it. This is where the new **Tweaks** section comes in.

Feel free to check out the [official Tweaks page](/tweaks.html) and don't be afraid to add your own by opening a patch-set!

That's all for now, thanks for reading!

-- Brad