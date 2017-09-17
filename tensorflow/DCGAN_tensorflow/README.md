# A Dockerfile for carpedm20's DCGAN Tensorflow

Please visit https://github.com/carpedm20/DCGAN-tensorflow for details on the implementation.

This Dockerfile is based on `phizaz/tensorflow:gpu` (to support running in non-root mode) which is, in turn, based on ``tensorflow/tensorflow:latest-gpu-py3` (supports Python 3).

## What's in this Dockerfile

- requests, tqdm (used in the implementation)
- tensorflow/tensorflow:latest-gpu-py3
    - jupyter
    - python 3
    - tensorflow
- jupyter nbextensions
- apt-fast (https://github.com/ilikenwf/apt-fast)
- fixuid (https://github.com/boxboat/fixuid)

## Build

```
nvidia-docker build -t phizaz/tensorflow:dcgan-gpu -f Dockerfile.gpu .
```

## Usage

```
NB_PORT=10011
nvidia-docker run -it --rm \
    --user=$UID:$UID \
    -p $NB_PORT:$NB_PORT \
    -v <src>:/notebooks \
    phizaz/tensorflow:gpu \
    jupyter notebook --ip="*" --port=$NB_PORT
```

With `--user` you can specify the runner of this image which in this case is the current user `$UID`.
