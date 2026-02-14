#!/usr/bin/env bash
set -euo pipefail

# NighHax VM setup script
#
# Student usage:
#   sudo ./nighthax-setup.sh
#
# Optional:
#   sudo ./nighthax-setup.sh --profile ctf-min|ctf-standard|ctf-full

PROFILE="ctf-standard"
LOG_DIR="${HOME}/.nighthax"
LOG_FILE="${LOG_DIR}/setup.log"

usage() {
  cat <<'EOF'
Usage: sudo ./nighthax-setup.sh [--profile ctf-min|ctf-standard|ctf-full]

Defaults:
  --profile ctf-standard

Notes:
- Requires sudo/root to install packages.
- Safe to re-run.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      PROFILE="${2:-}"; shift 2;;
    -h|--help)
      usage; exit 0;;
    *)
      echo "Unknown arg: $1" >&2; usage; exit 2;;
  esac
done

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo: sudo $0 [--profile ...]" >&2
  exit 1
fi

mkdir -p "$LOG_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "[nighthax] setup start: $(date)"
echo "[nighthax] profile: ${PROFILE}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/lib/common.sh"

TARGET_USER="${SUDO_USER:-root}"
export NIGHTHAX_PROFILE="$PROFILE"
export NIGHHAX_TARGET_USER="$TARGET_USER"

echo "[nighthax] running as root; target user: ${TARGET_USER}"

echo "[nighthax] running tasks..."
run_task "${SCRIPT_DIR}/tasks/00_system_prep.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/20_ctf_tooling.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/60_browser_setup.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/70_desktop_setup.sh" "${PROFILE}"
run_task "${SCRIPT_DIR}/tasks/80_hardening_optional.sh" "${PROFILE}"

echo "[nighthax] setup complete: $(date)"
echo "[nighthax] log: ${LOG_FILE}"
