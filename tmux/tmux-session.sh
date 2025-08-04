#!/usr/bin/env bash

SEARCH_PATH="${1:-$(pwd)}"
SELECTED_DIR=$(find "$SEARCH_PATH" -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z "$SELECTED_DIR" ]]; then
    exit 0
fi

SESSION_NAME=$(basename "$SELECTED_DIR" | tr . _)

if [[ -z "$TMUX" ]] && [[ -z $(pgrep tmux ) ]]; then
    tmux new-session -s "$SESSION_NAME" -c "$SELECTED_DIR"
    exit 0
fi

if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    tmux new-session -ds "$SESSION_NAME" -c "$SELECTED_DIR"
fi

tmux switch-client -t "$SESSION_NAME"
