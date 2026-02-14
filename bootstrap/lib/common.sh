#!/usr/bin/env bash
set -euo pipefail

require_sudo() {
  if [[ "${EUID}" -eq 0 ]]; then
    return 0
  fi
  if ! sudo -v; then
    echo "sudo is required" >&2
    exit 1
  fi
}

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
