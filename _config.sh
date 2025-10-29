#!/bin/sh

# Site specific settings
###################################################################################
DOMAIN="https://tfklrd.github.io/"
TITLE="tfklrd"
DESCRIPTION="nobody on the internet"
COPYRIGHT="Copyright 2022,  tfklrd"
AUTHOR="tfklrd"
OS="Linux" # "Linux" for Linux, "BSD" for BSD Systems (including MacOS)
HTML_LANG="en_US" # Your document (HTML) language setting

# Blog structure settings (most users should use these defaults)
###################################################################################
TOC=true
SYNTAX=true
PAGES_DIR="pages/"
POSTS_DIR="posts/"
PAGES=$(find $PAGES_DIR -type f)
POSTS=$(find $POSTS_DIR -type f)
WEB_HTML="blog/"
OUTPUT="public/"
TIME="01:00:00 EST"
TTL="60"
