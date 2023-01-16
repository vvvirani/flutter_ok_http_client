import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityUtils {
  ConnectivityUtils._();

  static Future<bool> get isConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
