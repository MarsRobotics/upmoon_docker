#!/usr/bin/env bash

echo "Building container..."
cd rpi_bionic
sudo docker build -t ros:melodic-upmoon-rpi .
