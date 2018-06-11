FROM ubuntu

RUN apt-get update && \
	apt-get -y install \
		git \
		gcc-arm-none-eabi \
 		srecord \
 		stm32flash \
 		python-pip \
 		wget \
 		unzip \
 		zip && pip install --user crcmod intelhex

WORKDIR /tmp/FlashFloppy
CMD git clone https://github.com/keirf/FlashFloppy.git . && make dist && mv flashfloppy*.zip /output

# Ports and volumes.
VOLUME /output