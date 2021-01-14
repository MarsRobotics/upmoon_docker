#!/usr/bin/env bash

echo "Building container..."
cd robot
sudo docker build -t ros:noetic-upmoon-robot .
