#!/bin/bash
# A Simple Fan Speed Control Script for ASUS Laptop by ZanDev

version_number="0.0.1"

# root check
ROOTUSER_NAME=root

username=`whoami`
if [ "$username" != "$ROOTUSER_NAME" ]
then
    echo "You are just a regular fella."
    exit 1
fi

# Input

fan_spd=$1
if (( "$fan_spd">255 ))
    then
        echo "The range speed is 0-255"
        exit 1
fi

# Command

echo $fan_spd > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1

# Output
echo "Program Done"
exit 0
