#!/usr/bin/env bash

echo "Building container..."
cd rpi
sudo docker build -t ros:noetic-upmoon-rpi .
