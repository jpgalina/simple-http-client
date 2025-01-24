class APIError {
  final String message;
  final int statusCode;
  final dynamic response;

  APIError({
    required this.message,
    required this.statusCode,
    this.response,
  });
}
