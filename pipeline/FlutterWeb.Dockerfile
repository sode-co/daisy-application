FROM cirrusci/flutter:3.0.1

RUN flutter doctor
RUN flutter config --enable-web

RUN mkdir /app/
COPY daisy_application ./app
COPY pipeline/script /app/script

WORKDIR app
EXPOSE 8081
RUN ["chmod", "+x", "script/server.sh"]
RUN flutter build web -t lib/pages/main.dart \
    --dart-define=API_HOST=localhost \
    --dart-define=API_PORT=8888 \
    --dart-define=PROTOCOL=http \
    --dart-define=GRPC_HOST=localhost \
    --dart-define=GRPC_PORT=50052 \
    --dart-define=ENVIRONMENT=production

ENTRYPOINT ["script/server.sh"]