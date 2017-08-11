FROM continuumio/miniconda

# add conda bio channel
RUN conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda

# install vienna locarna rnaz infernal cmfinder rnashapes
RUN conda install -y viennarna locarna rnaz infernal=1.0.2 cmfinder rnashapes=2.1.6

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y zlib1g-dev

# graphclust 0.7.6 (http://www.bioinf.uni-freiburg.de/Software/GraphClust/)
COPY GraphClust-0.7.6.tar.gz /tmp
RUN tar -xf /tmp/GraphClust-0.7.6.tar.gz  -C /tmp \
    && cd /tmp/GraphClust-0.7.6 \
    && chmod +x ./configure \
    && ./configure --prefix=/usr/local \
    && make -j4 \
    && make install

# install graphclust runtime requirements
RUN conda install -y perl-math-round perl-threaded

# install packages for optional graphclust's arguments
RUN conda install -y r-base octave

# cleanup
RUN conda clean --yes --all
