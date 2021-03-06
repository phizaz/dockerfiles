# Non-root Tensorflow based on original tensorflow (python 3) image

This Dockerfile extends the `tensorflow/tensorflow:latest-gpu-py3` image by adding the ability to run in "non-root" mode meaning the output the jupyter notebook will be totally owned by a specific user (given a user id).

This Dockerfile use **fixuid** (https://github.com/boxboat/fixuid) to leverage the aforementioned ability.

This Dockerfile is based on `tensorflow/tensorflow:latest-gpu-py3` than means it supports Python 3.

## What's in the Dockerfile

- tensorflow/tensorflow:latest-gpu-py3
    - jupyter
    - python 3
    - tensorflow
- jupyter nbextensions
- apt-fast (https://github.com/ilikenwf/apt-fast)
- fixuid (https://github.com/boxboat/fixuid)

## Build

```
nvidia-docker build -t phizaz/tensorflow:gpu -f Dockerfile.gpu .
```

### Build `:keras-gpu`

```
nvidia-docker build -t phizaz/tensorflow:keras-gpu -f Dockerfile.gpu.keras .
```

## Usage

```
NB_PORT=10010
nvidia-docker run -it --rm \
    --user=$UID:$UID \
    -p $NB_PORT:$NB_PORT \
    -v <src>:/notebooks \
    phizaz/tensorflow:gpu \
    jupyter notebook --ip="*" --port=$NB_PORT
```

With `--user` you can specify the runner of this image which in this case is the current user `$UID`.

Or with `:keras-gpu` instead.

You can quick start by seeing the `test` directory within this repo. There is a notebook

## Tag Variations

### `phizaz/tensorflow:keras-gpu` - with Keras (only with tensorflow backend) with GPU support

### `phizaz/tensorflow:dcgan-gpu` - A Dockerfile for carpedm20's DCGAN Tensorflow

Visit: https://github.com/phizaz/dockerfiles/tree/master/tensorflow/DCGAN_tensorflow
