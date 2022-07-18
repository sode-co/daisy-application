echo $(pwd)

docker run -d -v "$(pwd)"/envoy.yaml:/etc/envoy/envoy.yaml:ro \
    --name envoy-proxy -p 50056:50056 -p 9901:9901 envoyproxy/envoy:v1.16.1