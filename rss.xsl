<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <xsl:output method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8" indent="yes" />
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
                border-bottom: 1px solid lightgrey;
                margin-bottom: 0;
                padding-bottom: 0.5em;
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
                  margin-top: 1em;
                  overflow: hidden;
                  white-space: nowrap;
                  width: 16ch;
              }
            </style>
        </head>

        <body>
            <header>
                <h1><xsl:value-of select="/rss/channel/title" /></h1>
                <p>
                  <i><xsl:value-of select="/rss/channel/description" /></i>
                </p>
            </header>
            <xsl:for-each select="/rss/channel/item">
                <xsl:sort select="category" order="descending" />
                  <span class="date">
                    <xsl:value-of select="pubDate" />
                  </span>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="link" />
                    </xsl:attribute>
                    <span>
                      <xsl:value-of select="title" />
                    </span>
                </xsl:element>
            </xsl:for-each>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>