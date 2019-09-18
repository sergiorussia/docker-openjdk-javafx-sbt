# Debian Stretch provides proper openjfx version for Java 8
FROM buildpack-deps:stretch-scm

# Install OpenJDK JDK and OpenJFX
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-8-jdk openjfx && rm -rf /var/lib/apt/lists/*

# The following is inspired by https://github.com/hseeberger/scala-sbt/blob/master/debian/Dockerfile
ENV SBT_VERSION 1.3.0
RUN \
  curl -L -o /root/sbt-${SBT_VERSION}.deb https://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb && \
  apt-get install -y /root/sbt-${SBT_VERSION}.deb && \
  rm /root/sbt-${SBT_VERSION}.deb

# Prepare sbt and Scala, verify compilation including JavaFX classes
ENV SCALA_VERSION 2.13.1
WORKDIR /root/dummy
RUN \
  mkdir -p project && \
  echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt && \
  echo "sbt.version=${SBT_VERSION}" > project/build.properties && \
  echo 'import java.nio.file.Path\nimport javafx.application.Application\ncase object Temp' > Temp.scala && \
  sbt compile && \
  rm -rf /root/dummy

WORKDIR /root
