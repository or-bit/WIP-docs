FROM ubuntu:14.04

# filenames may contain accented letters
ENV LANG it_IT.UTF-8

RUN apt-get update && apt-get install -y nano libgmp10 zip

ADD install-deps.sh /

# does NOT work on 2 different systems running Ubuntu (16.04 LTS and xxx)... working on Windows 10 though!
# RUN chmod +x install-deps.sh && ./install-deps.sh
# silly workaround:
# RUN chmod +x install-deps.sh
# RUN ./install-deps.sh

RUN chmod +x install-deps.sh; sync; ./install-deps.sh
