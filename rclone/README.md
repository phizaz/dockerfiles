# a dockerfile for rclone

Read rclone project here https://rclone.org/

## Build

```
docker build -t phizaz/rclone .
```

## Usage

You need to have the rclone config file in your home folder.

```
docker logs -f $(docker run -d \
     -v $HOME:/root \
     -v <src>:/workdir \
     phizaz/rclone copy --stats=5s -v \
        . <remote>:<target>)
```

- `-v` is verbose showing files transferred
- `--stats=5s` shows stats including speeds every 5 second interval
