FROM ubuntu:14.04

# filenames may contain accented letters
ENV LANG it_IT.UTF-8

RUN apt-get update && apt-get install -y nano libgmp10 zip

ADD install-deps.sh /

RUN chmod +x install-deps.sh && ./install-deps.sh