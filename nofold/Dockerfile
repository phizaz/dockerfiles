FROM continuumio/miniconda

# add conda bio channel
RUN conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda

# install vienna locarna rnaz infernal cmfinder rnashapes
RUN conda install -y locarna rnaz infernal=1.0.2 r-base r-fastcluster

# install nofold
COPY nofold.tar.gz /tmp
RUN mkdir -p /nofold \
    && tar -xf /tmp/nofold.tar.gz -C /nofold --strip=1

WORKDIR /nofold

