FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common

# install apt-fast
RUN add-apt-repository -y ppa:saiarcot895/myppa
RUN apt-get update
RUN apt-get install -y apt-fast

# install bulid-essential
RUN apt-fast install -y build-essential

# install r
RUN apt-fast install -y r-base

# install z-lib
RUN apt-fast install -y zlib1g-dev

# install conda
RUN cd /tmp \
    && curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda

ENV PATH=/opt/conda/bin:$PATH

RUN conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda

# insatll viennarna
COPY ViennaRNA-2.4.0.tar.gz /tmp/viennarna.tar.gz
RUN mkdir -p /tmp/viennarna \
    && tar -xf /tmp/viennarna.tar.gz -C /tmp/viennarna --strip-components=1 \
    && cd /tmp/viennarna \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

# install locarna
COPY locarna-1.9.2.tar.gz /tmp/locarna.tar.gz
RUN mkdir -p /tmp/locarna \
    && tar -xf /tmp/locarna.tar.gz -C /tmp/locarna --strip-components=1 \
    && cd /tmp/locarna \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

RUN conda install -y rnaz=2.1

# install infernal
COPY infernal-1.0.2.tar.gz /tmp/infernal.tar.gz
RUN mkdir -p /tmp/infernal \
    && tar -xf /tmp/infernal.tar.gz -C /tmp/infernal --strip-components=1 \
    && cd /tmp/infernal \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

# install cmfinder
RUN conda install -y cmfinder=0.2

# install rnashapes
COPY RNAshapes-2.1.6.tar.gz /tmp/rnashapes.tar.gz
RUN mkdir -p /tmp/rnashapes \
    && tar -xf /tmp/rnashapes.tar.gz -C /tmp/rnashapes --strip-components=1 \
    && cd /tmp/rnashapes \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

# graphclust 0.7.6 (http://www.bioinf.uni-freiburg.de/Software/GraphClust/)
COPY GraphClust-0.7.6.tar.gz /tmp/graphclust.tar.gz
RUN mkdir -p /tmp/graphclust \
    && tar -xf /tmp/graphclust.tar.gz -C /tmp/graphclust --strip-components=1 \
    && cd /tmp/graphclust \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

# install perl
RUN conda install -y perl-math-round perl-threaded
RUN conda install -y octave

# cleanup
RUN conda clean --yes --all
RUN apt-get clean && apt-get autoremove
