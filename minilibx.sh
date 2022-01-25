#!/bin/bash

mkdir -p build && cd build
gcl https://github.com/42Paris/minilibx-linux.git build/minilibx-linux
cd build/minilibx-linux
sudo mkdir -p /usr/X11/lib && sudo mkdir -p /usr/local/lib
sudo mkdir -p /usr/X11/include && sudo mkdir -p /usr/local/include
sudo mkdir -p /usr/X11/man/man3 && sudo mkdir -p /usr/local/man/man3
./configure
sudo cp -rf libmlx.a /usr/X11/lib && sudo cp -rf libmlx.a /usr/local/lib
sudo cp -rf libmlx_Linux.a /usr/X11/lib && sudo cp -rf libmlx_Linux.a /usr/local/lib
sudo cp mlx.h /usr/X11/include && sudo cp mlx.h /usr/local/include
sudo cp man/man3/mlx*.3 /usr/X11/man/man3 && sudo cp man/man3/mlx*.3 /usr/local/man/man3
