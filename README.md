# docker-buildtools
Contains Dockerfile for Spigot BuildTools.jar

## Testing

```shell
docker build --tag buildtools .
mkdir cache/ cache-m2/
docker run --user 1000:1000 -v ./:/output -v ./cache:/working -v ./cache-m2:/.m2 buildtools -o /output --rev 1.19.4
```
