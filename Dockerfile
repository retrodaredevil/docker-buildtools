FROM eclipse-temurin:20-jre-jammy

RUN apt-get update &&  \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /BuildTools.jar "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

WORKDIR "/working"
# thanks https://stackoverflow.com/a/70345376/5434860
ENV GIT_CONFIG_GLOBAL="/working/.gitconfig"

ENTRYPOINT ["java", "-jar", "/BuildTools.jar"]
CMD ["--output-dir", "/output"]

