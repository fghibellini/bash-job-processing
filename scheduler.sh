#!/usr/bin/env bash

THREAD_COUNT=6

touch "./jobs_done.csv"
jobs="$(comm -23 <(sort "./jobs.csv") <(sort "./jobs_done.csv"))"

echo "$jobs" | xargs -P $THREAD_COUNT -L 1 ./job.sh
