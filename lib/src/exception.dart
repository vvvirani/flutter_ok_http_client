class OkHttpClientException implements Exception {
  final String cause;

  const OkHttpClientException(this.cause);
}

const String kNoInternetConnection =
    'No Internet connection. Make sure that Wi-Fi or Mobile data is turned on, then try again.';
