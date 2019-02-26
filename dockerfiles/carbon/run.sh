#!/bin/bash
for i in $(seq $INSTANCESFROM $INSTANCESTO)
do
    echo "Launch instance $i"
    python $CARBON --config=$CONFIG --instance=${INSTANCESRC}_${i} start ;
done

tail -f /var/log/*.log
