#!/usr/bin/env bash
set -euo pipefail

OS=$(uname -s)   # Darwin or Linux
HAS_BREW=false
command -v brew &>/dev/null && HAS_BREW=true

ok()  { echo "  [ok]  $1"; }
ins() { echo "  [+]   installing $1 ($2)..."; }
warn(){ echo "  [!]   $1"; }

# ── rust / cargo ─────────────────────────────────────────────────────────────
# Required by blink.cmp v2 to compile its native fuzzy library

install_rust() {
  if command -v cargo &>/dev/null; then ok "cargo (rust)"; return; fi
  ins "rust" "rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  # shellcheck source=/dev/null
  source "$HOME/.cargo/env"
}

# ── npm ───────────────────────────────────────────────────────────────────────

npm_install() {
  local pkg=$1 cmd=${2:-$1}
  if command -v "$cmd" &>/dev/null; then ok "$cmd"
  else ins "$pkg" npm; npm install -g "$pkg"
  fi
}

# ── lua-language-server ───────────────────────────────────────────────────────

install_lua_ls() {
  if command -v lua-language-server &>/dev/null; then ok "lua-language-server"; return; fi
  if $HAS_BREW; then ins "lua-language-server" brew; brew install lua-language-server; return; fi
  # Linux without brew: download pre-built binary from GitHub releases
  ins "lua-language-server" "github release"
  local tag arch install_dir="$HOME/.local/lua-language-server"
  tag=$(curl -fsSL "https://api.github.com/repos/LuaLS/lua-language-server/releases/latest" \
        | grep '"tag_name"' | cut -d'"' -f4)
  arch=$(uname -m)
  [[ "$arch" == "x86_64" ]]  && arch="x64"
  [[ "$arch" == "aarch64" ]] && arch="arm64"
  mkdir -p "$install_dir"
  curl -fsSL "https://github.com/LuaLS/lua-language-server/releases/download/${tag}/lua-language-server-${tag#v}-linux-${arch}.tar.gz" \
    | tar -xz -C "$install_dir"
  mkdir -p "$HOME/.local/bin"
  ln -sf "$install_dir/bin/lua-language-server" "$HOME/.local/bin/lua-language-server"
  warn "ensure $HOME/.local/bin is in your PATH"
}

# ── stylua ────────────────────────────────────────────────────────────────────

install_stylua() {
  if command -v stylua &>/dev/null; then ok "stylua"; return; fi
  if $HAS_BREW; then ins "stylua" brew; brew install stylua; return; fi
  if command -v cargo &>/dev/null; then ins "stylua" cargo; cargo install stylua
  else warn "stylua: cargo not found — install rustup then run: cargo install stylua"
  fi
}

# ── ruff ──────────────────────────────────────────────────────────────────────

install_ruff() {
  if command -v ruff &>/dev/null; then ok "ruff"; return; fi
  if $HAS_BREW; then ins "ruff" brew; brew install ruff; return; fi
  ins "ruff" "official installer"
  curl -LsSf https://astral.sh/ruff/install.sh | sh
}

# ── lazygit ───────────────────────────────────────────────────────────────────

install_lazygit() {
  if command -v lazygit &>/dev/null; then ok "lazygit"; return; fi
  if $HAS_BREW; then ins "lazygit" brew; brew install lazygit; return; fi
  if command -v go &>/dev/null; then
    ins "lazygit" "go install"
    go install github.com/jesseduffield/lazygit@latest
  else
    warn "lazygit: Go not found — install Go or brew then re-run"
  fi
}

# ── fzf ───────────────────────────────────────────────────────────────────────

install_fzf() {
  if command -v fzf &>/dev/null; then ok "fzf"; return; fi
  if $HAS_BREW; then ins "fzf" brew; brew install fzf; return; fi
  ins "fzf" git
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  "$HOME/.fzf/install" --bin
  warn "ensure $HOME/.fzf/bin is in your PATH"
}

# ── tree-sitter-cli ───────────────────────────────────────────────────────────
# Required by nvim-treesitter v2 for parser installation

install_tree_sitter() {
  if command -v tree-sitter &>/dev/null; then ok "tree-sitter-cli"; return; fi
  # NOTE: 'brew install tree-sitter' installs the C library only, not the CLI.
  # The CLI must be installed via cargo regardless of platform.
  if command -v cargo &>/dev/null; then ins "tree-sitter-cli" cargo; cargo install tree-sitter-cli
  else warn "tree-sitter-cli: cargo not found — run this script again after rust installs, or: cargo install tree-sitter-cli"
  fi
}

# ── gopls ─────────────────────────────────────────────────────────────────────

install_gopls() {
  if command -v gopls &>/dev/null; then ok "gopls"; return; fi
  if command -v go &>/dev/null; then ins "gopls" "go install"; go install golang.org/x/tools/gopls@latest
  else warn "gopls: Go not found — install Go then run: go install golang.org/x/tools/gopls@latest"
  fi
}

# ── Linux clipboard ───────────────────────────────────────────────────────────
# clipboard=unnamedplus requires a clipboard provider on Linux.
# On X11: xclip or xsel. On Wayland: wl-clipboard.

install_linux_clipboard() {
  if command -v xclip &>/dev/null || command -v xsel &>/dev/null || command -v wl-copy &>/dev/null; then
    ok "clipboard provider"
    return
  fi
  if $HAS_BREW; then ins "xclip" brew; brew install xclip; return; fi
  warn "no clipboard provider found — install xclip/xsel (X11) or wl-clipboard (Wayland)"
  warn "  ubuntu/debian: sudo apt install xclip"
  warn "  arch:          sudo pacman -S xclip"
  warn "  fedora:        sudo dnf install xclip"
}

# ── main ──────────────────────────────────────────────────────────────────────

echo "==> system: $OS  brew: $HAS_BREW"
echo ""

echo "==> prerequisites"
install_rust

echo ""
echo "==> language servers"
install_lua_ls
npm_install pyright
npm_install typescript
npm_install typescript-language-server
npm_install bash-language-server bash-language-server
install_gopls

echo ""
echo "==> formatters & linters"
install_stylua
install_ruff
npm_install prettier
npm_install eslint_d

echo ""
echo "==> tools"
install_lazygit
install_fzf
install_tree_sitter

if [[ "$OS" == "Linux" ]]; then
  echo ""
  echo "==> linux clipboard"
  install_linux_clipboard
fi

echo ""
echo "Done. Parsers will auto-install on first nvim launch."
