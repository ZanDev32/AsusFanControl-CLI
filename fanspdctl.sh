#!/usr/bin/env bash
# A Simple Fan Speed Control Script for ASUS Laptop by ZanDev

version_number="0.0.2"

# UI

help_info() {
    printf "
    Usage:
    %s [query]
    %s [options] [query]

    Options:
      -h, --help
        Show this help message and exit
      -m, --mode #planned
        Change fan mode {auto, manual, performance} #planned
      -p, --percentage #planned
        Change input into percentage (%%)
      -s, --status #planned
        Show fan current speed
      -v, --version
        Show the version of the script
    \n" "${0##*/}" "${0##*/}"
    exit 0
}

version_info() {
    printf "%s\n" "$version_number"
    exit 0
}


# Input

input=$1
if [[ "$input" =~ ^(-)?[0-9]+$ ]]
  then
    if [[ $input -gt 255 || $input == -* ]]
      then
          echo "The range speed is 0-255"
          exit 1
    fi
  else
    while [ $# -gt 0 ]; do
      case  "$1" in
          -h | --help) help_info ;;
          # -m | --mode
          # -p | --percentage
          # -s | --status
          -v | --version) version_info ;;
        esac
      done
      shift
fi

# Root check
ROOTUSER_NAME=root

username=$(whoami)
if [ "$username" != "$ROOTUSER_NAME" ]
then
    echo "You need to be root to run this script."
    exit 1
fi

# Main

echo "$input" > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1     # Set fan value (Value: 0-255)
# planned feature
# echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1_enable        # Change fan mode to automatic
# echo 1 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1_enable        # Change fan mode to manual
# echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1_enable        # Change fan mode to full speed (buggy in some device)

# Output
current_fan_spd=$(</sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1)
echo "Current fan speed is $current_fan_spd"
exit 0


# License

# AsusFanControl-CLI
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# Project repository: https://github.com/ZanDev32/AsusFanControl-CLI
