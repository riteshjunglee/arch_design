

import 'package:data/src/home_data/hello/hello_model.dart';
import 'package:http_manager/http_manager.dart';

/// HomeData abstraction.
/// This will make the whole architecture losely coupled with data layer
/// As in software development we do have a tendency to change our apis.
/// example someapi/v1/user to someapi/v2/user in this case we can start migrating
/// our code slow module wise. And write different implementation for v1 and v2.
/// Hence api version update can be accomodated smoothly. 
/// 
/// Or if we use different data source, we can inject the correct concrete class
/// when necessary.
///
/// There can be other cases such as multiple data source, etc.
abstract class HomeData {
  /// Get home page message from server.
  ///
  /// [message] only alphabets allowed.
  Future<HelloModel> welcomeToHomeScreen({required String message});
}

/// Local api implementation
class DummyHomeData extends HomeData {
  /// Local api implementation
  DummyHomeData({required HttpManager httpManager})
      : _httpManager = httpManager;

  final HttpManager _httpManager;

  @override
  Future<HelloModel> welcomeToHomeScreen({required String message}) async {
    final result = await _httpManager.welcomeToHome(message: message);
    return HelloModel(message: result);
  }
}
