FROM debian:stretch
MAINTAINER Jacopo Mauro

RUN apt-get update && \
	apt-get install -y \
		libxml2-dev \
		wget \
		git \
		unzip \
		make \
		g++ && \
	rm -rf /var/lib/apt/lists/* && \
  mkdir -p /tool && \
	cd /tool && \
	wget https://github.com/ehebrard/Mistral-2.0/archive/master.zip && \
	unzip master.zip && \
	rm master.zip  && \
	mv Mistral-2.0-master/ mistral && \
	cd mistral && \
	make && \
	ln -s fz/mistral-fzn fzn-mistral && \
	ln -s /fz/mznlib mzn-lib

ENV PATH "$PATH:/tool/mistral/"

# minizinc lib files in /tool/mistral/mzn-lib
# fzn-exec is /tool/mistral/fzn-mistral
