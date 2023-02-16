#!/bin/sh
data=`top -l1 |head`

now=`date +"%m-%d-%y|%H:%M"`

cpu=`top -l1 | head | grep "CPU usage" | awk '{print $8}'`
free_ram=`top -l1 | head | grep "PhysMem" | awk '{print $10}'`
used_ram=`top -l1 | head | grep "PhysMem" | awk '{print $8}'`
load=`top -l1 | head | grep "Load Avg" | awk '{ print $3 $4 $5 }'`

curl -d "machine=nazt-mba-test&time=$now&raw=$data&free_ram=$free_ram&used_ram=$used_ram&cpu=$cpu&load=$load" http://localhost:5000/debug