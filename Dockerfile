FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get -qq install apt-transport-https locales krb5-user curl && \
    apt-get install python3 python3-pip -y && \
    apt-get -qq clean

RUN pip3 install tzlocal termcolor kafka-python

RUN locale-gen "en_US.UTF-8"
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

CMD ["/bin/bash"]
