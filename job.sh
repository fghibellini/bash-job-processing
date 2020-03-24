#!/usr/bin/env bash
MIN_DURATION=3
MAX_DURATION=15
if [[ $# -ne 1 ]]; then
  echo "Invocation: job <job_name>" >&2
  exit 1
fi
export name="$1"
# each job runs for an unpredictable amount of time
printf "%s [starting]\n" "$name"
sleep $((MIN_DURATION + RANDOM % (MAX_DURATION - MIN_DURATION)));
flock "lockfile.lock" bash -c 'echo "$name" >> jobs_done.csv'
printf "%s [done]\n" "$name"
