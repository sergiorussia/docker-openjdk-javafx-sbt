#!/usr/bin/env bash
# Usage: $0 <sbt-version> <scala-version>

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -Eeuo pipefail

version_sbt="$1"
version_scala="$2"
root="$( cd "$( dirname "$0" )" && pwd )"
cd "$root/"
sed -i -e "s|^ENV SBT_VERSION.*|ENV SBT_VERSION $version_sbt|" -e "s|^ENV SCALA_VERSION.*|ENV SCALA_VERSION $version_scala|" image-*/Dockerfile
git commit -am"sbt $version_sbt, scala $version_scala"
