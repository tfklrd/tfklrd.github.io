.DEFAULT: build

.PHONY: build
build:
	bash pblog.sh > feed.xml
	rsync feed.xml public;
	rm feed.xml
	xsltproc rss.xsl public/feed.xml > public/blog/index.html

serve: build
	python3 -m http.server --directory public/

clean:
	rm -rf public
