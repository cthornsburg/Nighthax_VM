#!/usr/bin/env bash
set -euo pipefail

PROFILE="ctf-standard"
LOG_DIR="${HOME}/.nighthax"
LOG_FILE="${LOG_DIR}/bootstrap.log"

usage() {
  cat <<'EOF'
Usage: ./bootstrap.sh [--profile ctf-min|ctf-standard|ctf-full]

Runs the NighHax VM bootstrap tasks. Safe to re-run.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      PROFILE="$2"; shift 2;;
    -h|--help)
      usage; exit 0;;
    *)
      echo "Unknown arg: $1" >&2; usage; exit 2;;
  esac
done

mkdir -p "$LOG_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "[nighthax] bootstrap start: $(date)"
echo "[nighthax] profile: ${PROFILE}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/lib/common.sh"

require_sudo

echo "[nighthax] running tasks..."
run_task "${SCRIPT_DIR}/tasks/00_system_prep.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/20_ctf_tooling.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/60_browser_setup.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/70_desktop_setup.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/80_hardening_optional.sh" "${PROFILE}"

echo "[nighthax] bootstrap complete: $(date)"
echo "[nighthax] log: ${LOG_FILE}"
