# Stereo Rig Edge

## Settng up system
Several steps are required for the system to run correctly.

1. `docker-container.service` allows for the system to launch the dockerfile on boot
2. `udev` allows for the system to connect to the imu
3. `Dockerfile` and `launch.sh` must exist in the same directory and `Dockerfile` must be built with the abe tag


## Launch.sh

The Launch.sh file needs to be modified depending on the host device. The following changes need to be made.

#### Jetson_1:

``ros2 launch ros2_bringup stereorig_1.launch.py serial:="'21502646'" sonar:='false' namespace:='jetson_1' cam_topic:="debayer/image_raw/rgb" camera_type:="blackfly_s"``

#### Jetson_2:

``ros2 launch ros2_bringup stereorig_2.launch.py serial:="'21387972'" sonar:='true'  namespace:='jetson_2' camera_type:="blackfly_s" cam_topic:="debayer/image_raw/rgb"``

## Connecting to and Pulling bag from Orin

Due to the sonar, the jetsons have a pre-set ip address of 192.168.0.100 (jetson_2) and 192.168.0.150 (jetson_1). Therefore, the easiest way to connect to the orins is to change your computer's ip address to contain the same subnet (ex: 192.168.0.250). I have provided in instructions to both ssh to the orins and scp to pull the bags below.

### ssh to orins
1. Change IP adress of host computer
2. connect via ethernet to orin
3. ping orin to confirm connection
4. ssh -p 22 afrl@_ip adress of orin_
5. input password for afrl user

### scp to retrieve bags
1. Change IP adress of host computer
2. connect via ethernet to orin
3. ping orin to confirm connection
4. scp -P 22 afrl@_ip adress of orin_:_path to bag file on orin_ _path to desired directory for bag_
5. input password for afrl user

## Additional Resources
* The `Bag_File_instructions.txt` document includes instructions on how to decompress the images recorded by the program, how to merge the two bag files, and how to convert the ros2 bag file type to the ros bag file type.
* The `jetson_scripts` includes two scripts to copy/remove all of the bag files off of the two jetsons

