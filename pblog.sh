#!/bin/sh

source _config.sh

###################################################################################
# !WARNING!
# You probably don't need to tweak anything below this line. Edit at your own risk!
###################################################################################

# Create the $OUTPUT directory if it does not exist yet
if [ ! -d "$OUTPUT" ]; then
    mkdir -p $OUTPUT
fi

if [[ $TOC = true ]]
  then
    TOC_TOGGLE="--toc";
  else
    TOC_TOGGLE="";
fi

if [[ $SYNTAX = true ]]
  then
    SYNTAX_TOGGLE="";
  else
    SYNTAX_TOGGLE="--no-highlight";
fi

# Create the web browser-focused HTML versions for all posts
for i in $POSTS; do pandoc --css=../style.css --ascii --metadata lang="$HTML_LANG" $TOC_TOGGLE $SYNTAX_TOGGLE --wrap=none -A _footer.html -B _header.html -s $i -o ${i%.*}.html; done;

rsync $POSTS_DIR*.html $OUTPUT$WEB_HTML;
rm $POSTS_DIR*.html

# Create the web browser-focused HTML versions for all pages
# for i in $PAGES; do pandoc --css=style.css --ascii --metadata lang="$HTML_LANG" $TOC_TOGGLE $SYNTAX_TOGGLE --wrap=none -A _footer.html -B _header.html -s $i -o ${i%.*}.html; done;

# rsync $PAGES_DIR*.html $OUTPUT;
# rm $PAGES_DIR*.html

# Copy XSLT, stylesheet, and media files
rsync index.html $OUTPUT;
rsync rss.xsl $OUTPUT;
rsync style.css $OUTPUT;
rsync -r media $OUTPUT;

# Remove the default blog index to avoid pulling into the XML feed
if [ -f "$OUTPUT$WEB_HTML/index.html" ]; then
    rm $OUTPUT"$WEB_HTML"index.html
fi

echo "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<?xml-stylesheet href=\"rss.xsl\" type=\"text/xsl\"?>
<rss version=\"2.0\">
  <channel>
    <title>$TITLE</title>
    <link>$DOMAIN</link>
    <description>$DESCRIPTION</description>
    <copyright>$COPYRIGHT</copyright>
    <ttl>$TTL</ttl>";

for file in $OUTPUT$WEB_HTML*; do

POST_DATE=$(sed -n 's|^<p class="date">\([^<]*\)</p>$|\1|p' $file)
POST_TITLE=$(sed -n 's|^<h1 class="title">\([^<]*\)</h1>$|\1|p' $file)
POST_CONTENT=$(sed -n '/<article>/,/<\/article>/p' $file | sed -e '1s/.*<article>//' -e '$s/<\/article>.*//')

echo "<item>
  <pubDate>$POST_DATE $TIME</pubDate>
  <category>$CAT_DATE</category>
  <title>$POST_TITLE</title>
  <link>$DOMAIN/$WEB_HTML$(basename ${file})</link>
  <description><![CDATA[$POST_CONTENT]]></description>
  <author>$AUTHOR</author>
  <guid>$DOMAIN/$WEB_HTML$(basename ${file})</guid>
  </item>";
done

echo "  </channel>
</rss>";
