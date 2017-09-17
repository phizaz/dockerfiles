# Tensorflow with Jupyter notebook (python 3) and VIM bindings

This Dockerfile is based on `tensorflow/tensorflow:latest-gpu-py3` than means it supports Python 3.

## Build

```
nvidia-docker build -t phizaz/tensorflow:gpu -f Dockerfile.gpu .
```

## Usage

```
NB_PORT=10010
nvidia-docker run -it --rm \
    -p $NB_PORT:$NB_PORT \
    -v <src>:/notebooks \
    phizaz/tensorflow:gpu \
    /run_jupyter.sh --allow-root --port=$NB_PORT
```
