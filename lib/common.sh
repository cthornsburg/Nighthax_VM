#!/usr/bin/env bash
set -euo pipefail

run_task() {
  local task="$1"
  local profile="$2"
  if [[ ! -f "$task" ]]; then
    echo "[nighthax] skipping missing task: $task"
    return 0
  fi
  echo "[nighthax] task: $(basename "$task")"
  chmod +x "$task" || true
  "$task" "$profile"
}
