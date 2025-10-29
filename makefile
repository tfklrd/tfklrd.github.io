.DEFAULT: build

.PHONY: build
build:
	bash pblog.sh > _output/feed.xml
	xsltproc _output/feed.xml > _output/blog/index.html

serve: build
	python3 -m http.server --directory _output/

clean:
	rm -rf _output/*
