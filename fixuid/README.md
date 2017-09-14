# Fixuid Ubuntu 16.04 Base Image

## Rationale

It has been a pain to run everything in docker images with root user.

All the files created during the process will be owned by root ! It is just not natural.

For me and people like me, who want to run docker images as an alternative for a normal command line execution, this is really pain.

So, we want to run commands in docker containers in non-root users.

But, since under the same kernel, users are linked by their **UID** shared across the system. User 1000 in the host system, outside the container, is the same person as the one 1000 inside. This reduces the portability of the docker image. **How can we guarantee that wherever one runs this image will have the same UID as the one built this image ?**

**Fixuid** seems to have fixed this problem by dynamically modify UID inside the container to match the runner's supplied `--user` argument in `docker run

Please refer to https://github.com/boxboat/fixuid for more in details.

## Warning

> FROM https://github.com/boxboat/fixuid

**fixuid should only be used in development Docker containers. DO NOT INCLUDE in a production container image**

## What's in this Dockerfile

- apt-fast (https://github.com/ilikenwf/apt-fast)
- fixuid (https://github.com/boxboat/fixuid)

## Build

```
docker build -t phizaz:fixuid .
```
