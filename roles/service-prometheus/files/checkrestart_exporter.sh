#!/bin/bash

echo "# HELP checkrestart_process_count checkrestart count of processes with old libraries"
echo "# TYPE checkrestart_process_count gauge"
COUNT=$(checkrestart -pm 2>/dev/null | egrep '^PROCESSES' | awk '{ print $2 }')
echo "checkrestart_process_count ${COUNT:-0}"
