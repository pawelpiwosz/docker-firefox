FROM ubuntu

RUN apt update && apt install -y \
  dbus-x11  \
  libcanberra-gtk0 \
  libcanberra-gtk3-module \
  firefox \
  sudo

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 \
    && mkdir -p /home/firefox \
    && echo "firefox:x:${uid}:${gid}:Firefox,,,:/home/firefix:/bin/bash" >> /etc/passwd \
    && echo "firefox:x:${uid}:" >> /etc/group \
    && echo "firefox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/firefox \
    && chmod 0440 /etc/sudoers.d/firefox \
    && chown ${uid}:${gid} -R /home/firefox

USER firefox

ENV HOME /home/firefox
ENTRYPOINT ["/usr/bin/firefox"]
