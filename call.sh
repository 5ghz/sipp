#!/bin/bash

###############################
# Usage: call_with_auth.sh <number to call> <fqdn/IP:port of SIP server> <calls per second> <max symul calls> <duration limit in milliseconds> <local IP>
#

number_to_call="$1"
sip_server="$2"
rate="$3"
max_calls="$4"
max_duration="$5"
local_ip="$6"

cd `dirname $0`
#sipp -inf users.csv -sf uac_auth.xml -aa -p 5065 -max_socket 8192 -max_recv_loops 10000 -max_sched_loops 10000 -deadcall_wait 60000 -rtp_echo -mp 16384 -trace_err -trace_msg -trace_stat -fd 5 \
sipp -inf users.csv -sf sipp_uac_basic.xml -aa -p 5063 -max_socket 8192 -max_recv_loops 10000 -max_sched_loops 10000 -deadcall_wait 60000 -rtp_echo -mp 16384  -trace_err -trace_msg \
     -r "$rate" -l "$max_calls" -m 10000000 -d "$max_duration" -i "$local_ip" -s "$number_to_call" "$sip_server"
