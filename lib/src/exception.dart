class OkHttpClientException implements Exception {
  final String cause;

  const OkHttpClientException(this.cause);
}

class NoConnectivityException implements OkHttpClientException {
  @override
  String get cause {
    return 'No Internet connection. Make sure that Wi-Fi or Mobile data is turned on, then try again.';
  }
}
