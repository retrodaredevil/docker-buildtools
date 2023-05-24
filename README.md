# docker-buildtools
Contains Dockerfile for Spigot BuildTools.jar

To learn about the usage for BuildTools itself, go here: https://www.spigotmc.org/wiki/buildtools/.

## Usage

```shell
mkdir cache/
docker run -e PUID="$(id -u)" -e PGID="$(id -g)" --rm -v ./:/output -v ./cache:/home/spigot ghcr.io/retrodaredevil/buildtools:edge-17 -o /output --rev 1.17.1
```

Note that including `--user "$(id -u):$(id -g)"` is optional.
This is recommended if the cache and output directories are directories controlled by your user.

Mounting the `/working` (cache) and `/.m2`  directories are optional.
However, these are required to be mounted if you supply a `--user` argument because by default root permissions are applied to those directories.

## Java version

Depending on what tag you choose, you may choose an appropriate Java version required for your specific revision.

| Minecraft Version | Java Version |
|-------------------|--------------|
| Below 1.17        | Java 8       |
| 1.17              | Java 16      |
| 1.17.1 and above  | Java 17      |

We also supply other Java versions to choose from, but these are not supported by all minecraft versions.



## Testing

```shell
docker build --tag buildtools --build-arg BASE_IMAGE=eclipse-temurin:17-jre-jammy .
mkdir cache/ cache-m2/
docker run -e PUID="$(id -u)" -e PGID="$(id -g)" --rm -v ./:/output -v ./cache:/home/spigot  buildtools -o /output --rev 1.19.4
```

## Other

The source for BuildTools can be found here: https://hub.spigotmc.org/stash/projects/SPIGOT/repos/buildtools/browse.
Specifically [Builder.java](https://hub.spigotmc.org/stash/projects/SPIGOT/repos/buildtools/browse/src/main/java/org/spigotmc/builder/Builder.java)
has most of the logic.
More about the source here: https://www.spigotmc.org/wiki/cloning-building-and-compiling-the-spigot-source/
