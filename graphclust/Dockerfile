FROM ubuntu:14.04
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>


# install vienna-rna, locarna, rnashapes 3.3.0
RUN apt-get update \
	&& apt-get install -y software-properties-common \
	&& apt-add-repository -y ppa:j-4/vienna-rna \
	&& apt-add-repository -y ppa:swill/locarna \
	&& add-apt-repository -y ppa:bibi-help/bibitools \
	&& apt-get update \
	&& apt-get install -y build-essential vienna-rna locarna rnashapes zlib1g-dev \
	&& apt-get autoremove \
	&& apt-get clean

# install RNAz
COPY RNAz-2.1.tar.gz /tmp
WORKDIR /tmp
RUN tar -xzf RNAz-2.1.tar.gz
WORKDIR RNAz-2.1
RUN ./configure \
	&& make \
	&& make install

# install CMFinder
COPY CMfinder_0.2.tgz /tmp
WORKDIR /tmp
RUN tar -xzf CMfinder_0.2.tgz -C /root/
WORKDIR /root/CMfinder_0.2
RUN make \
	&& ln -s /root/CMfinder_0.2/bin/* /usr/local/bin/

# set environment for CMFinder (this will work only run using /bin/bash or so)
RUN echo "export CMfinder=/usr/local/bin" >> /root/.bashrc
RUN echo "export CMfinder=/usr/local/bin" > /root/.profile

# install perl modules (Math::Round, threads, Threads::Queue)
RUN cpan App::cpanminus
RUN cpanm Math::Round \
	&& cpanm threads \
	&& cpanm Thread::Queue

# install graphclust
COPY GraphClust-0.7.6.tar.gz /tmp
WORKDIR /tmp
RUN tar -xzf GraphClust-0.7.6.tar.gz -C /root/
WORKDIR /root/GraphClust-0.7.6
RUN ./configure --prefix=/root/GraphClust-0.7.6 \
	&& make \
	&& make install \
	&& ln -s /root/GraphClust-0.7.6/bin/* /usr/local/bin/

# clean up
RUN rm -rf /tmp

WORKDIR /root

