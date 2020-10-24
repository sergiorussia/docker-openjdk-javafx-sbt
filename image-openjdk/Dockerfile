# Debian Stretch provides proper openjfx version for Java 8
FROM openjdk:8u222-jdk-stretch

# Install OpenJFX as per https://github.com/docker-library/openjdk/issues/158
RUN apt-get update && apt-get install -y --no-install-recommends openjfx && rm -rf /var/lib/apt/lists/*

# The following is inspired by https://github.com/hseeberger/scala-sbt/blob/master/debian/Dockerfile
ENV SBT_VERSION 1.4.1
RUN \
  curl -L -o /root/sbt-${SBT_VERSION}.deb https://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb && \
  apt-get install -y /root/sbt-${SBT_VERSION}.deb && \
  rm /root/sbt-${SBT_VERSION}.deb

# Fix OpenJFX installation for local JDK
RUN \
  ln -s -t "$JAVA_HOME/jre/lib/" $(find /usr/share/java/openjfx/jre/lib/ -maxdepth 1 -type f) && \
  ln -s -t "$JAVA_HOME/jre/lib/ext/" $(find /usr/share/java/openjfx/jre/lib/ext/ -maxdepth 1 -type f)

# Prepare sbt and Scala, verify compilation including JavaFX classes
ENV SCALA_VERSION 2.13.3
WORKDIR /root/dummy
RUN \
  mkdir -p project && \
  echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt && \
  echo "sbt.version=${SBT_VERSION}" > project/build.properties && \
  echo 'import java.nio.file.Path\nimport javafx.application.Application\ncase object Temp' > Temp.scala && \
  sbt compile && \
  rm -rf /root/dummy

WORKDIR /root
