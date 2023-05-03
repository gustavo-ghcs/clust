#!/bin/sh

#  multipleSimulatorsStartup.sh
#  clust
#
#  Created by João Madruga on 30/04/23.
#  

# installs and lanches the 'bundle_id' for the specified simulator device

installAndLaunch() {

device=$1

app_path=$2

app_bundle_id=$3

xcrun simctl boot $device

xcrun simctl install $device $path

sleep 6

xcrun simctl launch $device $bundle_id &

}

# parses the configuration file

source ./multipleSimulators.config

echo "testing: source $app_location"

path=$(find $app_location -name "clust.app" | head -n 1)

echo "Application found at: $path"

echo "<<<<<<<<<<<<<<<<<<< Initializing all simulators >>>>>>>>>>>>>>>>>>>>"

# iterates over the simulators list and start installation / launching process

IFS=’,’ read -ra ADDR <<< "$simulators_list"

for device in "${ADDR[@]}"; do

installAndLaunch $device $path $bundle_id &

done
