.DEFAULT: build

.PHONY: build
build:
	bash pblog.sh > public/feed.xml
	xsltproc public/feed.xml > public/blog/index.html

serve: build
	python3 -m http.server --directory public/

clean:
	rm -rf public/*
