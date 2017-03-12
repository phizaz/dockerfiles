# Remote Docker

don't know what's remote-docker ? see: https://github.com/phizaz/remote-docker

## Usage of this image

```
docker run -it --rm \
    -v ${HOME}/.ssh:/ssh \
    -v `pwd`:/run \
    phizaz/rdocker <command>
```

## Alias for easy use


```
alias rdocker='docker run -it --rm \
    -v ${HOME}/.ssh:/ssh \
    -v `pwd`:/run \
    phizaz/rdocker $@'
```

Put the above command to your `.bashrc` or `.zshrc` and source it.

Now, you can try `rdocker --help`, and see:

```
initiating a new .remotedignore, change it to suit your need
usage: RemoteDocker (version 0.22) : Run your script in a docker on another machine as if it were on yours
       [-h] {list,run,restart,stop,rm,ssh,sync,syncup} ...

positional arguments:
  {list,run,restart,stop,rm,ssh,sync,syncup}

optional arguments:
  -h, --help            show this help message and exit
```