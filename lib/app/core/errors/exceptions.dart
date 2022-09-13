class ServerException implements Exception {
  final int errorCode;
  ServerException({
    required this.errorCode,
  });
}

