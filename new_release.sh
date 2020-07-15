#!/bin/sh

description=$1
gbranch nexe-build
git pull
latest_tag=$(git describe --abbrev=0)
echo $latest_tag > LAST_RELEASE.txt
npm run build
chmod +x BrowserGap.js
gpush patch "New release"
latest_tag=$(git describe --abbrev=0)
grel release -u dosyago -r BrowserGap --tag $latest_tag --name "New release" --description '"'"$description"'"'
grel upload -u dosyago -r BrowserGap --tag $latest_tag --name "BrowserGap.exe" --file BrowserGap.exe
grel upload -u dosyago -r BrowserGap --tag $latest_tag --name "BrowserGap.macos" --file BrowserGap.macos
grel upload -u dosyago -r BrowserGap --tag $latest_tag --name "BrowserGap.linux" --file BrowserGap.nix
grel upload -u dosyago -r BrowserGap --tag $latest_tag --name "BrowserGap.linx32" --file BrowserGap.nix32
grel upload -u dosyago -r BrowserGap --tag $latest_tag --name "BrowserGap.win32.exe" --file BrowserGap.win32.exe



