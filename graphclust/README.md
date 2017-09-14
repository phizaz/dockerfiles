# Graphclust 0.7.6 docker image

Original work from http://www.bioinf.uni-freiburg.de/Software/GraphClust/

## What's in this Dockerfile

- graphclust 0.7.6 (http://www.bioinf.uni-freiburg.de/Software/GraphClust/)
    - Infernal 1.0.2
    - Locarna 1.9.2
    - RNAshapes 2.1.6
    - ViennaRNA 2.4.0
- latest miniconda-python3 (https://conda.io/miniconda.html)
    - bioconda
- apt-fast (https://github.com/ilikenwf/apt-fast)
- fixuid (https://github.com/boxboat/fixuid)

## Build

```
# build
docker build -t phizaz/graphclust:0.7.6 .
# build with jupyter
docker build -t phizaz/graphclust:0.7.6-jupyter -f Dockerfile.jupyter .
```

## Usage

```
# run
docker run -it --user=1000:1000 -v <src>:/home/docker/workdir phizaz/graphclust:0.7.6 bash
# run with jupyter
docker run -it --rm --user=1000:1000 -v <src>:/home/docker/workdir -p 8888:8888 phizaz/graphclust:0.7.6-jupyter --port=8888
```

## Test

To test the usability of this Dockerfile after you have built the image, I have provided the copy-and-paste script here for your reproducibility.

Note that it will run against my example `test/test.fa` (which is originally yanked from https://github.com/sarahmid/nofold/blob/master/demo/demo1/demo1.db)

```
docker run -it --user=1000:1000 \
    -v `pwd`/test:/home/docker/workdir \
    phizaz/graphclust:0.7.6 \
    MASTER_GraphClust.pl \
        --root run_test \
        --fasta test.fa \
        --config config.default_global \
        --threads=4 \
        --verbose
```
