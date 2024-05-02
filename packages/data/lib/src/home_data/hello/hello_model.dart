
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hello_model.freezed.dart';

/// dummy model for showing use of freezed
@freezed
class HelloModel with _$HelloModel {
  /// dummy model for showing use of freezed
  const factory HelloModel({required String message}) = _HelloModel;

  const HelloModel._();

  /// check if model is empty
  bool get isEmpty => this == empty;

  /// check if model is not empty
  bool get isNotEmpty => this != empty;

  /// empty model
  static const empty = HelloModel(message: '');
}
