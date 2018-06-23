#!/usr/bin/bash
while true; do
    if [ genspri.pl -nt cblesprt.bin ]; then
        ./genspri.pl | recode lat1..ibmpc >./cblesprt.s; printf "\007";
    fi; sleep 1;
done

