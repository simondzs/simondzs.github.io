#! /bin/bash
# Builds every post from Markdown to HTML. Run from anywhere.
#
# To write a new post:
#   1. Copy starter.md to posts/<short-name>/index.md and write the post there.
#      Put any images in the same folder and link them as ![Caption](figure.png).
#   2. Run this script: ./posts/build.sh
#   3. Add an entry under "Media" in index.html that links to /posts/<short-name>/
#
# The post is then live at https://simondzs.github.io/posts/<short-name>/

cd "$(dirname "$0")"
for src in */index.md; do
  [ -e "$src" ] || continue
  out="${src%.md}.html"
  pandoc "$src" -f markdown -t html5 -s --template=template.html --mathjax -o "$out"
  echo "Built $out"
done
