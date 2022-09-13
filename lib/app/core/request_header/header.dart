abstract class RequestHeaders {
  Map<String, String> call();
}

class HeaderImpl implements RequestHeaders {
  @override
  Map<String, String> call() {
    return {'': ''};
  }
}
