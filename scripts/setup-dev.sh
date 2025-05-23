#!/usr/bin/env bash
set -euo pipefail

# Install dependencies for developing claude-code-action

NODE_VERSION=18
BUN_VERSION=1.2.11

# Ensure basic tools
sudo apt-get update && sudo apt-get install -y curl git

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Bun runtime
curl -fsSL https://bun.sh/install | bash -s "$BUN_VERSION"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Install project dependencies
bun install

# Optional: install Claude Code CLI globally for testing
npm install -g @anthropic-ai/claude-code@^1.0.2

# Install git hooks
bun run scripts/install-hooks.sh

echo "Setup complete!"
