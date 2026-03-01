#!/bin/bash

# TikSave CLI Installer
# Quick install script for TikSave

set -e

echo "🎬 TikSave CLI Installer"
echo "========================"
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed."
    echo "Please install Homebrew first: https://brew.sh"
    exit 1
fi

echo "📥 Installing TikSave CLI..."
echo ""

# Install via Homebrew
brew install miftahganzz/tiksave-cli/tiksave

echo ""
echo "✅ TikSave CLI installed successfully!"
echo ""
echo "🚀 Try it now:"
echo "  tiksave https://vm.tiktok.com/xxx"
echo ""
echo "📖 For more info:"
echo "  tiksave --help"
echo ""
