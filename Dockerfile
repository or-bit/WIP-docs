FROM ubuntu:14.04

# filenames may contain accented letters
ENV LANG it_IT.UTF-8

ADD . /

RUN apt-get update && apt-get install -y nano libgmp10 zip

RUN dpkg -i shellcheck.deb

RUN ./install-deps.sh