# Jetson Data Management Scripts

## Overview
This repository contains scripts for managing data on Jetson devices. The scripts allow you to retrieve the entire data folder or remove all `.bag` files from the Jetson devices on the same network subnet.

## Requirements
Before running the scripts, ensure the following requirements are met:

1. `sshpass` is installed on your system.
2. The IP addresses of the Jetson devices are on the `192.168.0.x` subnet.

## Usage
To run the scripts, use the following commands:

- To retrieve the entire data folder from both Jetsons:
  ```sh
  ./retrieve.sh

