#!/bin/sh
#江西用这个#date -u "`curl -sI 117.21.211.239 | awk '/Date:/{gsub(/Jan/,"01",$4);gsub(/Feb/,"02",$4);gsub(/Mar/,"03",$4);gsub(/Apr/,"04",$4);gsub(/May/,"05",$4);gsub(/Jun/,"06",$4);gsub(/Jul/,"07",$4);gsub(/Aug/,"08",$4);gsub(/Sep/,"09",$4);gsub(/Oct/,"10",$4);gsub(/Nov/,"11",$4);gsub(/Dec/,"11",$4);print $5"-"$4"-"$3" "$6;}'`"
uci set network.timesyn=interface
uci set network.timesyn.proto='pppoe'
uci set network.timesyn.ifname='eth0.2'
uci set network.timesyn.username='wuhan'
uci set network.timesyn.password='wuhan'
uci set network.timesyn.metric='0'
uci commit timesyn
ifdown NetKeeper 
ifup timesyn
uci set firewall.@zone[1].network='wan wan6 NetKeeper timesyn' 
uci commit firewall
/etc/init.d/firewall restart
#江西117.21.211.239

date -u "`curl -sI kd.wuhan.net.cn | awk '/Date:/{gsub(/Jan/,"01",$4);gsub(/Feb/,"02",$4);gsub(/Mar/,"03",$4);gsub(/Apr/,"04",$4);gsub(/May/,"05",$4);gsub(/Jun/,"06",$4);gsub(/Jul/,"07",$4);gsub(/Aug/,"08",$4);gsub(/Sep/,"09",$4);gsub(/Oct/,"10",$4);gsub(/Nov/,"11",$4);gsub(/Dec/,"11",$4);print $5"-"$4"-"$3" "$6;}'`"
ifdown timesyn
ifup NetKeeper 
