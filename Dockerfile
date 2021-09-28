FROM debian:buster
LABEL maintainer "nik0chan@hotmail.com"

RUN apt-get update \
  && apt-get install -y binutils git python python-distorm3 python-crypto python-yara \
  && git clone https://github.com/volatilityfoundation/volatility.git \
  && git clone https://github.com/volatilityfoundation/profiles.git \
  && rm -rf /volatility/.git \
  && rm -rf /profiles/.git \
  && apt-get -y remove --purge git \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /volatility/vol.py \
  && ln -s  /volatility/vol.py /usr/bin/volatility \
  && mkdir evidencias 
  
VOLUME /evidencias

WORKDIR /volatility

