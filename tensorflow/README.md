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
