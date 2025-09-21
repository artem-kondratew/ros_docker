#!/bin/bash


if [[ $# -ne 3 ]]
then
    echo $#
    echo "usage bash build.bash <container_name> <distro_image> <ROS_DISTRO>"
    echo "example:"
    echo "bash build.bash humble_docker osrf/ros:humble-desktop-full humble"
    exit 1
fi

echo $1 > name.txt
echo $1
echo $2
echo $3
docker build --build-arg distro_image=$2 --build-arg ROS_DISTRO=$3 -t $1 --network=host .
