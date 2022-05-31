FROM cirrusci/flutter:3.0.1

# ENV API_HOST="127.0.0.1"
# ENV API_PORT=2433
# ENV GRPC_HOST="127.0.0.1"
# ENV MOBILE_GRPC_PORT=50152
# ENV GRPC_PORT=50052
# ENV PROTOCOL="http"
# ENV ENVIRONMENT="production"

RUN flutter doctor
RUN flutter config --enable-web

RUN mkdir /app/
COPY daisy_application ./app
COPY pipeline/script /app/script

WORKDIR app
EXPOSE 8081
RUN ["chmod", "+x", "script/server.sh"]
RUN flutter build web -t lib/pages/main.dart \
    --dart-define=API_HOST=$API_HOST \
    --dart-define=API_PORT=$API_PORT \
    --dart-define=PROTOCOL=$PROTOCOL \
    --dart-define=GRPC_HOST=$GRPC_HOST \
    --dart-define=GRPC_PORT=$GRPC_PORT \
    --dart-define=MOBILE_GRPC_PORT=$MOBILE_GRPC_PORT \
    --dart-define=ENVIRONMENT=$ENVIRONMENT

ENTRYPOINT ["script/server.sh"]