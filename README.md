# docker-openjdk-javafx-sbt
Docker files for OpenJDK with JavaFX and SBT. Inspired by https://github.com/hseeberger/scala-sbt/ but simpler and is primarily intented for **building** your projects, eg CI and so on.  

There are three options:
- image-amazon = [Amazon Corretto](https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/docker-install.html) (which already includes OpenJFX) + SBT
- image-debian = pure Debian + OpenJDK JDK + OpenJFX + SBT, **recommended**
- image-openjdk = similar to image-debian but based on official openjdk image, however OpenJFX installation is hacky

Images are published to https://hub.docker.com/r/sergiorussia/docker-openjdk-javafx-sbt/tags.
