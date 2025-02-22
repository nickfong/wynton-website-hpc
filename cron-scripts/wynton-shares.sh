#! /usr/bin/env bash

TARGET=${TARGET:-$HOME/repositories/UCSF-HPC/wynton/docs/assets/data}

## wynton shares
PATH="/wynton/home/cbi/shared/software/CBI-testing/wynton-tools/bin:$PATH"

## wynton shares queries 'qconf'
PATH="/opt/sge/bin/lx-amd64/:$PATH"

tmpfile=$(mktemp)
wynton shares tsv > "$tmpfile"
grep -q -E "^# Total queue_slots:[[:space:]]*0$$" "$tmpfile" || mv "$tmpfile" "${TARGET}/compute_shares.tsv"

wynton gpushares tsv > "$tmpfile"
mv "$tmpfile" "${TARGET}/gpu_shares.tsv"



