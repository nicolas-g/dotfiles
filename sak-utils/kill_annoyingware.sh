#!/bin/bash

while true; do

#echo "endpoint"
pkill -9 endpoint

#echo "Netskope"
pkill -9 netskope

#echo "Umbrella"
pkill -9 umbrella

#OpenDNS
pkill -9 OpenDNS
for i in $(ps -ef | grep -i opendns | grep -v grep  | awk '{ print $2}'); do kill -9 $i; done;

# Druva
for i in $(ps -ef | grep Druva | grep -v grep  | awk '{ print $2}'); do kill -9 $i; done;

#echo "Nomad"
for i in $(ps -ef | grep -i nomad | grep -v grep  | awk '{ print $2}'); do kill -9 $i; done;

done;
