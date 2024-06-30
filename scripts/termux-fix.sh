#!/data/data/com.termux/files/usr/bin/bash

MASON_PACKAGES=$HOME/.local/share/nvim/mason/packages
USR_PATH=/data/data/com.termux/files/usr/bin

# --- Rust ---

apt install rust-analyzer
cp \
	$USR_PATH/rust-analyzer \
	$MASON_PACKAGES/rust-analyzer/rust-analyzer-aarch64-unknown-linux-gnu

# --- Lua ---

apt install lua-language-server
cp \
	$PREFIX/share/lua-language-server/bin/lua-language-server \
	$MASON_PACKAGES/lua-language-server/libexec/bin/lua-language-server

apt install stylua
cp \
	$USR_PATH/stylua \
	$MASON_PACKAGES/stylua/stylua

# --- Web ---

# fix biome lsp error
# you need to build biome youself,
BIOME_BIN=$(which biome)
cp $BIOME_BIN \
	$MASON_PACKAGES/biome/node_modules/.bin/biome
