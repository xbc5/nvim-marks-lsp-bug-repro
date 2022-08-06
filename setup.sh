#!/bin/bash

echo "cloning packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

set -e

bin="/tmp"
img="https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage"
chksum="https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage.sha256sum"

mkdir -p "$bin"
cd "$bin"

echo "fetching neovim.."
curl -fsSLO --tlsv1.3 "$img" || { echo "$msg"; exit 1; }
echo 'fetching checksum..'
curl -fsSLO --tlsv1.3 "$chksum"
sha256sum -c nvim.appimage.sha256sum

[[ -f "nvim" ]] && rm -f nvim
rm nvim.appimage.sha256sum
mv nvim.appimage nvim
chmod u+x nvim

echo done!
