#!/usr/bin/env bash

echo "Building container..."
cd base
sudo docker build -t ros:noetic-upmoon-base .
