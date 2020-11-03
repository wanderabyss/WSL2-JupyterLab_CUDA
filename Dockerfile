FROM tensorflow/tensorflow:nightly-gpu-jupyter

LABEL maintainer="wanderabyss@gmail.com"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		software-properties-common \
                dirmngr \
                ed \
		less \
		locales \
		vim-tiny \
		wget \
		ca-certificates \
        && add-apt-repository --enable-source --yes "ppa:marutter/rrutter4.0" \
        && add-apt-repository --enable-source --yes "ppa:c2d4u.team/c2d4u4.0+"

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## This was not needed before but we need it now
ENV DEBIAN_FRONTEND noninteractive

## Otherwise timedatectl will get called which leads to 'no systemd' inside Docker
ENV TZ UTC

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y libgl1-mesa-dev

RUN pip install --upgrade jupyterlab 

# Install python packages
RUN pip install pandas seaborn tabulate

# Install pytorch - cuda
RUN pip install torch torchvision

# Install OpenCV

RUN pip install opencv-python

#Install Detectron2

RUN python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu102/torch1.6/index.html

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0",  "--allow-root"] 

