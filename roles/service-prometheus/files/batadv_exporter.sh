#!/bin/sh

BATCTL=$(which batctl)

for batdev in /sys/class/net/*bat; do
  test -d ${batdev} || exit 0
  batdev=$(basename $batdev)

  /sbin/ethtool -S ${batdev} | awk -v batdev=${batdev} '
    /^     .*:/ {
      gsub(":", "");
      print "batman_" $1 "{batdev=\"" batdev "\"} " $2
    }
  '

  echo "batman_originator_count{batdev=\"${batdev}\",selected=\"false\"}" $($BATCTL -m ${batdev} originators -H | egrep '^   ' | wc -l)
  echo "batman_originator_count{batdev=\"${batdev}\",selected=\"true\"}" $($BATCTL -m ${batdev} originators -H | egrep '^ \*' | wc -l)
  echo "batman_tg_count{batdev=\"${batdev}\",type=\"multicast\"}" $($BATCTL -m ${batdev} transglobal -H -m | wc -l)
  echo "batman_tg_count{batdev=\"${batdev}\",type=\"unicast\"}" $($BATCTL -m ${batdev} transglobal -H -u | wc -l)
done
