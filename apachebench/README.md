# ApacheBench in Docker

## Build

```
docker build -t phizaz/ab .
```

## Usage

```
docker run --rm phizaz/ab -n 100 -c 3 https://www.google.co.th
```


