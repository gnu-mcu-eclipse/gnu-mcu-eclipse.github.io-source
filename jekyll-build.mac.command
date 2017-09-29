#! /bin/bash

cd "$(dirname "$0")"

site="../gnu-mcu-eclipse.github.io.git"

export PATH="$HOME/opt/homebrew-jekyll/bin":$PATH
bundle exec jekyll build --destination "${site}"

export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# Validate images and links (internal & external).
 bundle exec htmlproofer \
    --url-ignore=""  \
    "${site}"

echo
echo "Done"
