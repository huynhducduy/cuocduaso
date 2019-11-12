sudo docker build -t cuocduaso .

xhost + 127.0.0.1
xhost + \${hostname}

export LIBGL_ALWAYS_INDIRECT=1
export LIBGL_ALWAYS_SOFTWARE=1

--network="host" \

docker run -it \
 --name cuocduaso-container \
 --privileged \
 -e DISPLAY=host.docker.internal:0 \
 -e QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
 -v $XAUTH:/root/.Xauthority \
 -v $PWD:/catkin_ws/src:rw \
 -p 9000:9000 \
 -p 11311:11311 \
 cuocduaso:latest

docker run -it \
 -e DISPLAY=host.docker.internal:0 \
 --privileged \
 -e QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
 osrf/ros:melodic-desktop-full \
 rqt
