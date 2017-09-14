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

###### SETUP CONDA PYTHON 2 ###############
RUN cd /tmp \
    && curl -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
    && bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/conda
ENV PATH=/opt/conda/bin:$PATH
RUN conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda

###### SETUP LOCARNA 1.8.7 ###############
RUN conda install -y locarna=1.8.7 && conda clean --yes --all

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

###### SETUP R-FASTCLUSTER ###############
RUN Rscript -e 'install.packages("fastcluster", repos="https://cloud.r-project.org/")'

###### SETUP TIME ###########################
RUN apt-get update && apt-get install -y time

# ########################################
# # USER MODE
# ########################################
USER docker

###### SETUP NOFOLD ###############
COPY nofold_1.0.1.tar.gz /tmp
RUN mkdir -p /home/docker/nofold \
    && tar -xf /tmp/nofold_1.0.1.tar.gz -C /home/docker/nofold --strip=1

RUN mkdir -p /home/docker/workdir
WORKDIR /home/docker/workdir

ENV WORKDIR=/home/docker/workdir
ENV NOFOLD=/home/docker/nofold
ENV SRC=/home/docker/nofold/src
