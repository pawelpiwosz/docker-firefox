## Dockerized Firefox

Docker container for Firefox. The version is last one when container
was build.

#### Test status



### Synopsis

Sometimes it is worth to use the web browser in isolated environment

### Pull image

In order to pull image from dockerhub registry, run:

```
docker pull almerhor/firefox
```

### Build

In order to build the image, run:

```
docker build -t firefox .
```

### Run

In order to run firefox container, execute:

```
docker run -it --rm --name firefox \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix\
  -e DISPLAY=$DISPLAY \
  firefox
```

In order to run in private mode:

```
docker run -it --rm --name firefox \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix\
  -e DISPLAY=$DISPLAY \
  firefox --private-window
```

### Credits

I wrote this container based on Marco work.
