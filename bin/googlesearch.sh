#!/usr/bin/zsh

QUERY=$(echo $1 | nkf -wMQ | tr = % | tr -d "\n")
BASEURL="https://encrypted.google.com/search?ie=ja&hl=ja&q="

URL="$BASEURL$QUERY"

echo "$URL"
w3m "$URL"

