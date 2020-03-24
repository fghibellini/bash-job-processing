#!/usr/bin/env bash

THREAD_COUNT=5

jobs="$(cat ./jobs.csv)"

echo "$jobs" | xargs -P $THREAD_COUNT -L 1 ./job.sh
