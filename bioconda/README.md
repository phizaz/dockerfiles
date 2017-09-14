# Bioconda Ubuntu 16.04 base image

## Rationale

I used to use the original Miniconda docker image that is based on debian. But after many experiments I found that it has problems with R, like in the following:

```
/opt/conda/lib/R/bin/exec/R: symbol lookup error: /opt/conda/lib/R/bin/exec/../../lib/../../libreadline.so.6: undefined symbol: PC
```

I have yet to find the remedy for this, but it seems building my own Miniconda image from Ubuntu 16.04 has led to a better results.

## What's in the Dockerfile

- latest miniconda (https://conda.io/miniconda.html)
    - python 2 `:python2`
    - python 3 `:python3`
- r-base
- git
- zlib1g-dev
- build-essential
- apt-fast (https://github.com/ilikenwf/apt-fast)
- fixuid (https://github.com/boxboat/fixuid)

## Build

```
# build the base image
docker build -t phizaz/bioconda:base -f Dockerfile.base .
# build the python 2 image
docker build -t phizaz/bioconda:python2 -f Dockerfile.python2 .
# build the python 3 image
docker build -t phizaz/bioconda:python3 -f Dockerfile.python3 .
```
