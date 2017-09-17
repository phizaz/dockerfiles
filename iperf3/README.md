# IPerf3 docker image

## Build

```
docker build -t phizaz/iperf3 .
```

## Usage


### Server

```
docker run -d --restart=unless-stopped --network=host phizaz/iperf3 --server
```

### Client

```
docker run -it --rm --network=host phizaz/iperf3 --client <ip>
```
