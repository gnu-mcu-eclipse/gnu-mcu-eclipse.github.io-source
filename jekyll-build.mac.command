#! /bin/bash

cd "$(dirname "$0")"

site="../gnu-mcu-eclipse.github.io.git"

export PATH="$HOME/.local/homebrew/jekyll/bin":$PATH
bundle exec jekyll build --destination "${site}"

export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# Validate images and links (internal & external).
#  bundle exec htmlproofer \
#     --url-ignore="/uk.farnell.com/,/shields.io/"  \
#     "${site}"

echo
echo "Done"
