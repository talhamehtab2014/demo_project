import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import 'network_info.dart';

@Injectable(as: NetworkInfo)
class NetworkInfoImp extends NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImp(this.connectivity);

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
    }
    return false;
  }
}
