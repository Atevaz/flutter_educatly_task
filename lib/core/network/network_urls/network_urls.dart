class NetworkURLS {
  // static const String baseDevURL = "5e47-90-148-138-21.ngrok-free.app";
  static const isDev = true;

  static const String baseDevURL = "https://google.com";
  static const String baseBetaURL = "https://google.com";
  static const String baseURL = isDev ? baseDevURL : baseBetaURL;
}
