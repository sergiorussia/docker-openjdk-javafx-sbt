# Amazon Corretto 8 provides JavaFX out-of-the-box
FROM amazoncorretto:8u222

# The following is inspired by https://github.com/hseeberger/scala-sbt/blob/master/oracle/Dockerfile
ENV SCALA_VERSION 2.13.1
ENV SBT_VERSION 1.3.0
RUN \
  curl -L -o /root/sbt-${SBT_VERSION}.rpm https://bintray.com/sbt/rpm/download_file?file_path=sbt-${SBT_VERSION}.rpm && \
  yum install -y /root/sbt-${SBT_VERSION}.rpm && \
  yum clean all && \
  rm /root/sbt-${SBT_VERSION}.rpm

# Prepare sbt and Scala, verify compilation including JavaFX classes
WORKDIR /root/dummy
RUN \
  mkdir -p project && \
  echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt && \
  echo "sbt.version=${SBT_VERSION}" > project/build.properties && \
  echo -e 'import java.nio.file.Path\nimport javafx.application.Application\ncase object Temp' > Temp.scala && \
  sbt compile && \
  rm -rf /root/dummy

WORKDIR /root
