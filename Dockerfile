FROM ubuntu:18.04 as intermediate

###############################################################################################
MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="Ubuntu 18.04 + MATLAB MCR 2019a"
LABEL Vendor="Murphy Lab in the Computational Biology Department at Carnegie Mellon University"
LABEL Web="http://murphylab.cbd.cmu.edu"
LABEL Version="2019a"
###############################################################################################

###############################################################################################
# UPDATE OS AND INSTALL TOOLS
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y build-essential git \
    unzip \
    xorg \
    wget \
    tree \
    pandoc \
    curl \
    vim
RUN apt-get upgrade -y
###############################################################################################

###############################################################################################
# INSTALL MATLAB MCR 2017A
USER root
RUN echo "Downloading Matlab MCR 2019a"
RUN mkdir /mcr-install && \
    mkdir /opt/mcr
RUN cd /mcr-install && \
    wget -nc https://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/5/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019a_Update_5_glnxa64.zip && \
    cd /mcr-install && \
    echo "Unzipping container" && \
    unzip -q MCR_R2019a_glnxa64_installer.zip && \
    ./install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    cd / && \
    echo "Removing temporary files" && \
    rm -rvf mcr-install
###############################################################################################

###############################################################################################
FROM ubuntu:18.04
COPY --from=intermediate /opt/mcr /opt/mcr
###############################################################################################

###############################################################################################
# CONFIGURE ENVIRONMENT VARIABLES FOR MCR
RUN mv -v /opt/mcr/v95/sys/os/glnxa64/libstdc++.so.6 /opt/mcr/v95/sys/os/glnxa64/libstdc++.so.6.old
ENV LD_LIBRARY_PATH /opt/mcr/v95/runtime/glnxa64:/opt/mcr/v95/bin/glnxa64:/opt/mcr/v95/sys/os/glnxa64
ENV XAPPLRESDIR /opt/mcr/v95/X11/app-defaults
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y wget
###############################################################################################

###############################################################################################
# CONFIGURE ENVIRONMENT
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV USERNAME murphylab
ENV UID 1000
RUN useradd -m -s /bin/bash -N -u $UID $USERNAME
RUN if [ ! -d /home/$USERNAME/ ]; then mkdir /home/$USERNAME/; fi
###############################################################################################
