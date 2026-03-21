#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="spec-driven-develop"
SOURCE_DIR="$(cd "$(dirname "$0")/../skills/$SKILL_NAME" && pwd)"
TARGET_DIR="$HOME/.cursor/skills/$SKILL_NAME"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory not found: $SOURCE_DIR"
    exit 1
fi

if [ -d "$TARGET_DIR" ]; then
    echo "Skill '$SKILL_NAME' already exists at $TARGET_DIR"
    read -p "Overwrite? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    rm -rf "$TARGET_DIR"
fi

mkdir -p "$(dirname "$TARGET_DIR")"
cp -r "$SOURCE_DIR" "$TARGET_DIR"

echo "Installed '$SKILL_NAME' to $TARGET_DIR"
echo "Restart Cursor to activate the skill."
