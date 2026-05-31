#!/usr/bin/env bash
# Daily: refresh per-stop temps (climatology now, forecast once <=16d out),
# commit + push only if index.html changed. Idempotent + quiet on no-op.
set -euo pipefail
REPO="/home/openclaw/.openclaw/workspace/repos/japon-trip"
LOG="$REPO/.weather-cron.log"
cd "$REPO"

{
  echo "=== $(date -Is) ==="
  # keep clone current (someone may have pushed)
  git pull -q --no-rebase origin main 2>&1 || echo "pull warn"
  python3 scripts/update_weather.py 2>&1

  if git diff --quiet -- index.html; then
    echo "no temp change — nothing to push"
    exit 0
  fi
  PAT="$(grep '^GITHUB_PAT=' "$HOME/.secrets/.env" | cut -d= -f2-)"
  git add index.html
  git -c user.email=mew@martriay.com -c user.name=Mew \
      commit -q -m "weather: refresh per-stop temps ($(date +%F))

Co-Authored-By: Martin <martriay@gmail.com>"
  git -c credential.helper= push -q \
      "https://friendly-mew:${PAT}@github.com/Mew-Industries/japon-trip.git" main
  echo "pushed temp refresh"
} >>"$LOG" 2>&1
