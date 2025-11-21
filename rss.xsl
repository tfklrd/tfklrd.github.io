<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <xsl:output method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en_US" xml:lang="en_US">
        <head>
            <title>
                <xsl:value-of select="/rss/channel/title" />
            </title>
            <meta name="description">
            <xsl:attribute name="content">
                <xsl:value-of select="/rss/channel/description" />
            </xsl:attribute>
            </meta>
            <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1" />
            <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no" />
            <link rel="stylesheet" href="../style.css" />
            <style>
              header {
                max-width: 80ch;
                margin-bottom: 0;
                padding-bottom: 0em;
              }
              header h1 {
                margin: 0;
              }
              header p {
                margin: 0 0 0.5em;
              }
              .date {
                  display: block;
                  font-family: monospace;
                  margin-bottom: 2em;
                  overflow: hidden;
                  white-space: nowrap;
                  width: 16ch;
              }
            </style>
        </head>

        <body>
            <nav class="links">
    			<a href="/">Home</a>
    			<a href="/blog">Blog</a>
			</nav>
            <article>
            <header class="main">
                <h1 class="title"><xsl:value-of select="/rss/channel/title" /></h1>
                <div class="sub"><xsl:value-of select="/rss/channel/description" /></div>
            </header>
            <xsl:for-each select="/rss/channel/item">
                <xsl:sort select="category" order="descending" />
                <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="link" />
                    </xsl:attribute>
                    <span>
                      <xsl:value-of select="title" />
                    </span>
                </xsl:element>
                <span class="date">
                  <xsl:value-of select="pubDate" />
                </span>
            </xsl:for-each>
        	</article>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>
