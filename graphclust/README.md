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
docker build -t phizaz/graphclust:0.7.6 .
```

## Usage

```
docker run -it -v <src>:/home/docker/workdir phizaz/graphclust:0.7.6 bash
```
