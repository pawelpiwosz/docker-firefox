FROM ubuntu

LABEL maintainer="Pawel Piwosz <devops@pawelpiwosz.net>"

# For Travis build
ARG BUILD_DATE
ARG VCS_REF
ARG VER

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/pawelpiwosz/docker-firefox"
LABEL org.label-schema.name="docker-firefox"
LABEL org.label-schema.description="Dockerized Firefox"
LABEL org.label-schema.version=$VER

RUN apt update && apt install -y \
  dbus-x11  \
  libcanberra-gtk0 \
  libcanberra-gtk3-module \
  firefox \
  sudo

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 \
    && mkdir -p /home/firefox \
    && echo "firefox:x:${uid}:${gid}:Firefox,,,:/home/firefox:/bin/bash" >> /etc/passwd \
    && echo "firefox:x:${uid}:" >> /etc/group \
    && echo "firefox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/firefox \
    && chmod 0440 /etc/sudoers.d/firefox \
    && chown ${uid}:${gid} -R /home/firefox

USER firefox

ENV HOME /home/firefox
ENTRYPOINT ["/usr/bin/firefox"]
