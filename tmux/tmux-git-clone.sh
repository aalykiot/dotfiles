#!/usr/bin/env bash

set -e

GIT_URL="$1"
TARGET_PATH="$2"

if [[ -z "$GIT_URL" || -z "$TARGET_PATH" ]]; then
    echo "Usage: tmux-git-clone <GIT_URL> <TARGET_PATH>"
    exit 1
fi

mkdir -p "$TARGET_PATH"
cd "$TARGET_PATH"

git clone "$GIT_URL"

REPO_NAME=$(basename "$GIT_URL" .git)
cd "$REPO_NAME"

SESSION_NAME=$(basename "$(pwd)" | tr . _)

# If session already exists -> error.
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Error: tmux session '$SESSION_NAME' already exists."
fi

if [[ -z "$TMUX" ]]; then
    # Not inside tmux.
    tmux new-session -s "$SESSION_NAME" -c "$(pwd)"
else
    # Inside tmux.
    tmux new-session -ds "$SESSION_NAME" -c "$(pwd)"
    tmux switch-client -t "$SESSION_NAME"
fi
