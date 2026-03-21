#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Installing spec-driven-develop ==="
echo ""

echo "[1/2] Installing to Cursor..."
bash "$SCRIPT_DIR/install-cursor.sh"
echo ""

echo "[2/2] Installing to Codex..."
bash "$SCRIPT_DIR/install-codex.sh"
echo ""

echo "=== Done ==="
echo ""
echo "For Claude Code: add this repository as a plugin source."
echo "  The plugin will be loaded automatically from the repo structure."
