#!/bin/bash

mkdir jetson_data

cd jetson_data

mkdir jetson_1

cd jetson_1

echo "Pulling data from jetson_1"
sshpass -p "AFRL1D49." scp -P 22 -r afrl@192.168.0.150:/home/afrl/Desktop/data .

cd .. && mkdir jetson_2

cd jetson_2

echo "Pulling data from jetson_2"
sshpass -p "AFRL1D49." scp -P 22 -r afrl@192.168.0.100:/home/afrl/Desktop/data .
