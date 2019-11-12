FROM osrf/ros:melodic-desktop-full

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update -y
RUN rosdep fix-permissions
RUN rosdep update
RUN echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
RUN apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential ros-melodic-rosbridge-server
RUN mkdir -p /catkin_ws/src
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /catkin_ws; catkin_make'
RUN echo 'source /catkin_ws/devel/setup.bash' >> ~/.bashrc
RUN /bin/bash -c '. /catkin_ws/devel/setup.bash;'

WORKDIR /catkin_ws/src
COPY . .

# ENTRYPOINT ["/catkin_ws/src/public1-2019/simulator.x86_64"]

# apt-get install -y software-properties-common
# apt-get update -y && apt-get dist-upgrade -y
# add-apt-repository -y ppa:ubuntu-x-swat/update
# add-apt-repository -y ppa:paulo-miguel-dias/pkppa
# apt-get install -y libgl1-mesa-glx libgl1-mesa-dri llvm-dev libegl1-mesa xserver-xorg-video-intel libglapi-mesa && rm -rf /var/lib/apt/lists/*
# apt-get update -y && apt-get dist-upgrade -y
# apt-get install -y mesa-utils
# apt-get update -y && apt-get dist-upgrade -y
# api-get upgrade -y
# LIBGL_DEBUG=verbose glxinfo
