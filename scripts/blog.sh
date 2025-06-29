#!/usr/bin/env bash

# Basically ripped from the lug website sitemap code
# See the lugatuic.github.io repo
# lugatuic.github.io/scripts/sitemap.sh

# Newline seperated markdown link embeds.
# [link](name)\n[link](name)\n ...
LINKS=""

# For every file in the blog folder
for file in content/*.md; do
  TMP=""
  TITLE=""

  # Extract title from file
  TMP=$(awk '/title: /{if(++i>1)exit} i' $file)
  # Remove metadata tag
  TITLE=${TMP##title: }
  # Remove potential --- from header metadata
  TITLE=${TITLE%---}
  TITLE=${TITLE#---}

  # Determine Target File Name
  # Strip old directory
  TARGET=${file##*/}
  # Strip .md extension
  TARGET=${TARGET%*.md}
  # Reformat!
  TARGET=blog/$TARGET.html

  printf -v LINKS "%s [%s](%s) \n" "$LINKS" "$TITLE" "$TARGET"
done

pandoc -s --template blog-template.html --metadata-file metadata.yml -o blog.html <<<"${LINKS}"
