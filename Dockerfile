ARG BASE_IMAGE
FROM $BASE_IMAGE

RUN apt-get update &&  \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /BuildTools.jar "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

RUN groupadd --gid 1000 spigot && \
    useradd --create-home --uid 1000 --gid spigot spigot

COPY --chmod=0500 entrypoint.sh /entrypoint.sh

WORKDIR "/home/spigot/data"

ENV PUID=""
ENV PGID=1000
ENTRYPOINT ["/entrypoint.sh", "/opt/java/openjdk/bin/java", "-jar", "/BuildTools.jar"]

