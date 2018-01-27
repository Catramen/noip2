FROM ubuntu

RUN apt-get update && apt-get -y install wget 
RUN apt-get -y install make && apt-get -y install gcc
RUN cd /usr/local/src/ \
  && wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz\
  && tar xf noip-duc-linux.tar.gz \
  && cd noip* \
  && make \
  && cp noip2 /usr/local/bin/

VOLUME /usr/local/etc
# Define working directory.
WORKDIR /


# Define default command.
CMD noip2 && bash
