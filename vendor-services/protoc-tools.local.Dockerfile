FROM node:gallium-bullseye

RUN npm i protoc

FROM dart:2.17.5-sdk

RUN dart pub global activate protoc_plugin
ENV PATH="$PATH:$HOME/.pub-cache/bin"

ENTRYPOINT [ "" ]