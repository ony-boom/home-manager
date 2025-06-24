#!/usr/bin/env sh
set -e

echo "=== Checking and installing dependencies ==="

# Detect package manager
detect_pkg_manager() {
  if command -v apt-get >/dev/null 2>&1; then
    echo "apt-get"
  elif command -v dnf >/dev/null 2>&1; then
    echo "dnf"
  elif command -v pacman >/dev/null 2>&1; then
    echo "pacman"
  elif command -v apk >/dev/null 2>&1; then
    echo "apk"
  elif command -v zypper >/dev/null 2>&1; then
    echo "zypper"
  else
    echo ""
  fi
}

PKG_MANAGER=$(detect_pkg_manager)

install_pkg() {
  case "$PKG_MANAGER" in
  apt-get)
    sudo apt-get update
    sudo apt-get install -y "$@"
    ;;
  dnf)
    sudo dnf install -y "$@"
    ;;
  pacman)
    sudo pacman -Sy --noconfirm "$@"
    ;;
  apk)
    sudo apk add --no-cache "$@"
    ;;
  zypper)
    sudo zypper install -y "$@"
    ;;
  *)
    echo "No supported package manager found, please install $* manually."
    exit 1
    ;;
  esac
}

ensure_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Installing $1..."
    install_pkg "$1"
  else
    echo "$1 is already installed."
  fi
}

# Check for wget or curl (needed to install nix)
if ! command -v wget >/dev/null 2>&1 && ! command -v curl >/dev/null 2>&1; then
  echo "Neither wget nor curl found. Installing wget..."
  install_pkg wget
fi

ensure_command wget
ensure_command unzip

# git is optional
if ! command -v git >/dev/null 2>&1; then
  echo "git not found. It will be installed if available in your package manager."
  install_pkg git || echo "git install failed, will fallback to wget download"
fi

echo "=== Installing Nix if not installed ==="
if ! command -v nix >/dev/null 2>&1; then
  echo "Nix not found, installing..."
  # Use your install_nix function or embed it here:
  wget -qO- https://raw.githubusercontent.com/ony-boom/dev-setup/main/install.sh | bash
else
  echo "Nix already installed."
fi

echo "=== Downloading home-manager ==="
HM_DIR="$HOME/.config/home-manager"
TMPDIR="$(mktemp -d)"

if command -v git >/dev/null 2>&1; then
  echo "Cloning home-manager repo..."
  git clone --depth 1 https://github.com/ony-boom/home-manager.git "$TMPDIR/home-manager"
  rm -rf "$HM_DIR"
  mkdir -p "$(dirname "$HM_DIR")"
  mv "$TMPDIR/home-manager" "$HM_DIR"
else
  echo "git not found or clone failed, downloading zip archive..."
  ZIP_URL="https://github.com/ony-boom/home-manager/archive/refs/heads/main.zip"
  wget -qO "$TMPDIR/home-manager.zip" "$ZIP_URL"
  unzip -q "$TMPDIR/home-manager.zip" -d "$TMPDIR"
  rm -rf "$HM_DIR"
  mkdir -p "$(dirname "$HM_DIR")"
  mv "$TMPDIR/home-manager-main" "$HM_DIR"
fi

rm -rf "$TMPDIR"

echo "=== Running home-manager switch ==="
nix run nixpkgs#home-manager -- switch --impure -b backup

echo "Setup complete!"
