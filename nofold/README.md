# Nofold 1.0.1 docker image

Original work from http://kim.bio.upenn.edu/software/nofold.shtml

## What's in this Dockerfile

- Nofold 1.0.1 (http://kim.bio.upenn.edu/software/nofold.shtml)
    - Infernal 1.0.2
    - Locarna 1.8.7
    - RNAz 2.1
- latest miniconda-python2 (https://conda.io/miniconda.html)
    - bioconda
- apt-fast (https://github.com/ilikenwf/apt-fast)
- fixuid (https://github.com/boxboat/fixuid)

## Build

```
# build
docker build -t phizaz/nofold:1.0.1 .
# build with jupyter
docker build -t phizaz/nofold:1.0.1-jupyter -f Dockerfile.jupyter .
```

## Usage

```
# run
docker run -it --user=1000:1000 -v <src>:/home/docker/workdir phizaz/nofold:1.0.1 bash
# run with jupyter
docker run -it --rm --user=1000:1000 -v <src>:/home/docker/workdir -p 8888:8888 phizaz/nofold:1.0.1-jupyter --port=8888
```

Nofold source code is in `/home/docker/nofold` or `${NOFOLD}`.

I suggest mount your working directory to `/home/docker/workdir`.

## Test

To test the usability of this Dockerfile after you have built the image, I have provided the copy-and-paste script here for your reproducibility.

The following snippet will perform these things:

1. Get normalized structural coordinates of sequences:
2. Extract any clusters that form within the structure space:

```
docker run -it --rm --user=1000:1000 \
    --workdir=/home/docker/nofold/src \
    phizaz/nofold:1.0.1 \
    bash -c "python score_and_normalize.py ../demo/demo1/demo1.db --cpus=4 \
        && python nofold_pipeline.py ../demo/demo1/demo1.zNorm.pcNorm100.zNorm.bitscore ../demo/demo1/demo1.db --cpus=4 --bounds-file=../thresh/bounds_30seq.txt --verbose \
        && bash"
```
