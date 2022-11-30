#!/bin/bash
# Include API KEY (safe way)

source ~/.config/api_keys.sh

content = 'Anime'
page = 1

while [$page -le 10]
do 
  curl -s "GET https://wallhaven.cc/api/v1/search?q=$content&page=$page" | jq '.data[].path' | xargs -I{} wget {} -P ~/Mega/wallpapers 
  page = $(( $page + 1 ))
