class ServerException implements Exception {
  final String errorMessage;

  const ServerException([this.errorMessage = ""]);
}
