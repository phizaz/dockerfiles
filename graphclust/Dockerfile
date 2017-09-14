FROM ubuntu:16.04

########################################
# ROOT MODE
########################################

###### SETUP APT-FAST #####################
RUN apt-get update && apt-get install -y aria2 git \
    && git clone https://github.com/ilikenwf/apt-fast /tmp/apt-fast \
    && cp /tmp/apt-fast/apt-fast /usr/bin \
    && chmod +x /usr/bin/apt-fast \
    && cp /tmp/apt-fast/apt-fast.conf /etc

###### SETUP CURL #########################
RUN apt-fast update && apt-fast install -y curl

###### SETUP FIXUID #######################
RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/sh --disabled-password --gecos "" docker

RUN USER=docker && \
    GROUP=docker && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.1/fixuid-0.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

ENTRYPOINT ["fixuid"]

###### SETUP ###############################
RUN apt-fast update && apt-fast install -y \
        build-essential \
        r-base \
        zlib1g-dev

###### SETUP CONDA PYTHON 3 ###############
RUN cd /tmp \
    && curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
ENV PATH=/opt/conda/bin:$PATH
RUN conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda

###### SETUP VIENNARNA ###############
COPY ViennaRNA-2.4.0.tar.gz /tmp/viennarna.tar.gz
RUN mkdir -p /tmp/viennarna \
    && tar -xf /tmp/viennarna.tar.gz -C /tmp/viennarna --strip-components=1 \
    && cd /tmp/viennarna \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

###### SETUP LOCARNA ###############
COPY locarna-1.9.2.tar.gz /tmp/locarna.tar.gz
RUN mkdir -p /tmp/locarna \
    && tar -xf /tmp/locarna.tar.gz -C /tmp/locarna --strip-components=1 \
    && cd /tmp/locarna \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

###### SETUP RNAZ ###############
RUN conda install -y rnaz=2.1 && conda clean --yes --all

###### SETUP INFERNAL ###############
COPY infernal-1.0.2.tar.gz /tmp/infernal.tar.gz
RUN mkdir -p /tmp/infernal \
    && tar -xf /tmp/infernal.tar.gz -C /tmp/infernal --strip-components=1 \
    && cd /tmp/infernal \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

###### SETUP CMFINDER ###############
RUN conda install -y cmfinder=0.2 && conda clean --yes --all

###### SETUP RNASHAPES ###############
COPY RNAshapes-2.1.6.tar.gz /tmp/rnashapes.tar.gz
RUN mkdir -p /tmp/rnashapes \
    && tar -xf /tmp/rnashapes.tar.gz -C /tmp/rnashapes --strip-components=1 \
    && cd /tmp/rnashapes \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

###### SETUP GRAPHCLUST ###############
COPY GraphClust-0.7.6.tar.gz /tmp/graphclust.tar.gz
RUN mkdir -p /tmp/graphclust \
    && tar -xf /tmp/graphclust.tar.gz -C /tmp/graphclust --strip-components=1 \
    && cd /tmp/graphclust \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

###### SETUP PERL DEPENDENCIES ###############
RUN conda install -y perl-math-round perl-threaded && conda clean --yes --all

###### SETUP OCTAVE #########################
RUN conda install -y octave && conda clean --yes --all

###### SETUP TIME ###########################
RUN apt-get update && apt-get install -y time

########################################
# USER MODE
########################################
USER docker

###### PREPARE THE WORKING DIR #########################
RUN mkdir -p /home/docker/workdir
WORKDIR /home/docker/workdir
ENV WORKDIR=/home/docker/workdir

ENTRYPOINT ["fixuid"]
