

import 'package:data/data.dart';

/// Widget book respository layer.
/// Abstraction is done of keeping the architecture loosely coupled.
/// The main purpose of this layer is to rearrange the obtained data
/// and provide useable data to presentation layer.
abstract class HomeRepo {
  /// Get awesome welcome response from server.
  ///
  /// [message] only alphabets allowed.
  Future<HelloModel> welcomeToHome({required String message});
}

/// repo implementation
class HomeTempRepo extends HomeRepo {
  /// [HomeTempRepo] takes data class to use it here.
  HomeTempRepo({required HomeData homeDemoData})
      : _homeDemoData = homeDemoData;

  final HomeData _homeDemoData;

  @override
  Future<HelloModel> welcomeToHome({required String message}) async {
    final result = _homeDemoData.welcomeToHomeScreen(message: message);
    return result;
  }
}
