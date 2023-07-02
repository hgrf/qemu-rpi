#!/bin/bash
/run_qemu_nographic.sh &
QEMU_PID=$!

CONN="-o StrictHostKeyChecking=no -p8022 qtxrpi@127.0.0.1"
PASS="qtxrpi"
sshpass -p $PASS ssh $CONN true
while test $? -gt 0; do
    sleep 5
    echo "Trying again..."
    sshpass -p $PASS ssh $CONN true
done

sshpass -p $PASS ssh $CONN sudo shutdown now

wait $QEMU_PID
