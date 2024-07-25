#!/bin/bash

sshpass -p "AFRL1D49." ssh -p 22  afrl@192.168.0.150 'docker stop $(docker ps -a -q); systemctl --user stop docker.container.service; docker stop $(docker ps -a -q)'
sshpass -p "AFRL1D49." ssh -p 22  afrl@192.168.0.100 'docker stop $(docker ps -a -q); systemctl --user stop docker.container.service; docker stop $(docker ps -a -q)'

mkdir jetson_data

cd jetson_data

mkdir jetson_1

cd jetson_1

echo "Pulling data from jetson_1"
sshpass -p "AFRL1D49." scp -P 22 -r afrl@192.168.0.150:/home/afrl/Desktop/data .

cd .. && mkdir jetson_2

source /opt/ros/humble/setup.bash

cd jetson_2

echo "Pulling data from jetson_2"
sshpass -p "AFRL1D49." scp -P 22 -r afrl@192.168.0.100:/home/afrl/Desktop/data .

cd ..

source /opt/ros/humble/setup.bash

cd jetson_data

for file in $(find . -type f); do 
    echo "testing $file"
    ros2 bag info $file 
done

