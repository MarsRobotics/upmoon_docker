# upmoon_docker

Docker images for running the upmoon robot on a Jetson Xavier NX


## Setup

On first boot of the Xavier, run `sudo apt upgrade && sudo apt update`. If a menu pops up that asks about the default display manager, select `gdm3`. Afterwards, reboot the Xavier.

As mentioned [here](https://github.com/dusty-nv/jetson-containers), enable access to the CUDA compiler during `docker build` operations by adding `"default-runtime": "nvidia"` to `/etc/docker/daemon.json`:

``` json
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },

    "default-runtime": "nvidia"
}
```

Then, reboot or restart the Docker service.

For communicating with other machines in ROS, add their hostname and ip to `/etc/hosts`.


## Building the Containers

Run the following command to build the Docker containers.

``` bash
$ git clone https://github.com/MarsRobotics/upmoon_docker.git
$ cd upmoon_docker
$ ./base/docker_build.sh
$ ./robot/docker_build.sh
```


## Running the Containers

`docker run -it --privileged --network=host ros:noetic-upmoon-robot`
