---
title: Introducing pblog
date: Mon, 04 Jul 2022
---

This article is a *living document*. It will always have the most up-to-date information on getting started with `pblog`.

**Last Updated**: July 27, 2022

---

Although this project was already [announced](/blog/pblog-launch.html) a couple days ago, I thought it might be best to actually breakdown `pblog` into greater detail.

Enough chit-chat, let's get into it!

### Main Goal

The entire purpose of `pblog` is to be as bare-bones as possible, while still maintaining a pleasant writing workflow. Users write their posts and pages in Markdown - *pblog* handles everything else:

- Posts and pages generated via Pandoc with minimal CSS
- RSS feed at `feed.xml`
- Generated blog listing at `blog/index.html`
- Browser-styled XML (in supported browsers)

### Site Structure

After you've cloned the [official pblog repo on sourcehut](https://git.btxx.org/pblog), the next thing you should do is edit the main `_config.sh` file in the root directory. This will give you a better understanding of how everything is built.

Once generated, *pblog* structures the final website files as such:

```shell
_output/
    |__blog/
        |__index.html
        |__blog-post-example.html
    |__media/
    |__feed.xml
    |__index.html
    |__rss.xsl
    |__style.css
```

This structure is completely customizable by simply editing the `_config.sh` file (if you so desire).

### Headers and Footers

By default `pblog` will add the header and footer includes to every individual post and page. To edit these, simply open the `_header.html` and `_footer.html` files respectively.

**Important**: To avoid rendering issues DO NOT remove the included `article` opening and closing tags within those files. Everything else you can edit, remove, etc.

### Posts and Pages

Posts and pages are written via Markdown inside the `posts` and `pages` folders respectively.

Individual posts require the following headers (take note of the date format):

```yaml
---
title: Blog Title
date: Mon, 04 Jul 2022
---
```

while individual pages only require a `title`:

```yaml
---
title: Page Title
---
```

This makes for an easier switch over from other SSG platforms like Jekyll or Hugo.

### The Build Process

The main variables at the top of the `pblog.sh` file need to edited with your own details before generating your website. Those variables are fairly self-explanatory and simple to edit.

All you need to do now is run `make` (or `make serve` if you're looking to test locally) and you're done. Your website should now be fully generated inside the include `_output` directory. For quick reference:

1. *pblog* converts your Markdown posts into two variations of HTML
    - One is used specifically for rendering itself inside the RSS feed
    - The other is used for linking in a browser
2. Next, *pblog* converts your Markdown pages into HTML
3. All of these generated HTML files are then moved to the `_output` folder

*pblog* is also smart enough to automatically generate a main blog list directory for you. This `index.html` file is placed inside the `_output/blog` folder on build. You can see an example of the blog list [on this very website](/blog).

### Uploading to the WWW

Those with more experience will probably lean towards using a utility like `rsync` to sync the contents of their `_output` folder with their web server. For those with less experience, I recommend using something like [Netlify Drop](https://app.netlify.com/drop) to make things as friction-less as possible.

### Wrapping Up

There isn't much else to say. `pblog` is as static or flexible as you chose it to be. If you have any ideas on how to improve things or come across any bugs, please [open a ticket or PR on the official repo](https://git.sr.ht/~bt/pblog).

Thanks and happy blogging with *pblog*!
