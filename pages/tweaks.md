---
title: Tweaks
toc: true
---

## Tweaks Explained

"Tweaks" are extra features that are not packaged within the default `pblog` project. If you have your own tweaks you would like to include, be sure to [open a patch](mailto:pblog@patches.btxx.org).

---

<br>

## Magick Images

#### by: [Matthew Graybosch](https://matthewgraybosch.com)

This tweak gives you the ability to automatically convert PNG and JPG images to WEBP and AVIF files when used with the `picture` HTML element.

**Requirements**:

- Download and install [ImageMagick](https://imagemagick.org/script/download.php)

Then change your base `makefile` to reflect the following:

```bash
.SUFFIXES: .png .jpg .webp .avif

.jpg.webp:
    magick -quality 80 "$<" "$@"

.jpg.avif:
    magick -quality 80 "$<" "$@"

.png.webp:
    magick -quality 80 "$<" "$@"

.png.avif:
    magick -quality 80 "$<" "$@"

JPEGS!=find media/ -name '*.jpg'
PNGS!=find media/ -name '*.png'

JPEG_WEBP=${JPEGS:.jpg=.webp}
JPEG_AVIF=${JPEGS:.jpg=.avif}

PNG_WEBP=${PNGS:.png=.webp}
PNG_AVIF=${PNGS:.png=.avif}

.DEFAULT: build

.PHONY: build
build: $(JPEG_WEBP) $(JPEG_AVIF) $(PNG_WEBP) $(PNG_AVIF)
    bash pblog.sh > _output/feed.xml
    xsltproc _output/feed.xml | tail -n +2 > _output/blog/index.html

serve: build
    python3 -m http.server --directory _output/

clean:
    rm _output/* rss/* $(JPEG_WEBP) $(JPEG_AVIF) $(PNG_WEBP) $(PNG_AVIF)
```

That's it. Enjoy!

---

<br>

## Hiding Table of Contents "Heading"

#### by [Bradley Taunt](https://tdarb.org)

By default the include *Table of Contents* displays a title and styled section. To disable this, simply edit the `style.css` file and comment out or delete the following:

```css
#TOC {
    border: 1px solid;
    position: relative;
}
#TOC:before {
    border-bottom: 1px solid;
    content: 'Table of Contents';
    display: block;
    font-weight: bold;
    padding: 5px;
    position: relative;
}
```

---

<br>

## Adding navigation to blog index and RSS feed

In order to include any main navigation (or other custom elements for that matter) on the main blog index page and RSS `feed.xml`, simply edit the `rss.xml` file in the root directory. Be sure to add your elements / content inside the `body` tag near the bottom of the page.
