FROM visicam
USER root

RUN usermod -aG irc visicam  # group of /dev/videoX

RUN apt update && \
    apt -y upgrade && \
    apt -y dist-upgrade && \
    apt -y install v4l2ucp fswebcam && \
    apt clean

COPY ./visicam.conf /home/visicam/
COPY ./camera-script/ /opt/camera-script/
RUN touch /var/log/visicam.log && \
    chown visicam:visicam /var/log/visicam.log

USER visicam
