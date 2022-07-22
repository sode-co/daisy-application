class Config {
  static const String API_HOST =
      String.fromEnvironment('API_HOST', defaultValue: 'localhost');
  static const int API_PORT =
      int.fromEnvironment('API_PORT', defaultValue: 2433);
  static const String PROTOCOL =
      String.fromEnvironment('PROTOCOL', defaultValue: 'http');
  static const String GRPC_HOST =
      String.fromEnvironment('GRPC_HOST', defaultValue: 'localhost');
  static const int GRPC_PORT =
      int.fromEnvironment('GRPC_PORT', defaultValue: 50052);
  static const int GRPC_MOBILE_PORT =
      int.fromEnvironment('GRPC_MOBILE_PORT', defaultValue: 50152);
  static const WEB_URL =
      String.fromEnvironment('WEB_URL', defaultValue: 'http://localhost:5000');
  static const String GRPC_URL = '$PROTOCOL://$GRPC_HOST:$GRPC_PORT';
  static const String API_URL = '$PROTOCOL://$API_HOST:$API_PORT';
}
