FROM docker.io/library/debian:trixie

# Install python's build deps
RUN apt-get update -y && apt-get install -y python3 pkg-config \
      build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev

WORKDIR /home

# For this step, download & unzip a python tarball in the 
# same dir as the Dockerfile, then run the following commands 
# before building the container image:
# $ ./configure
# $ make
# If you run into problems installing python, just copy the 
# unzipped tarball & run these commands in the container.
COPY Python-3.13.0rc1 python3.13/

# To build & run: 
# docker build -t <container>:<tag> . 
# docker run -it --entrypoint bash <container>:<tag> 
CMD ["bin/sh", "-c"]
