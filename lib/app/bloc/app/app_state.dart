part of 'app_bloc.dart';

enum AppStatus { initial, loading, success, error }

class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.initial,
    this.result = HelloModel.empty,
    this.errorMessage = '',
  });

  final AppStatus status;
  final HelloModel result;
  final String errorMessage;

  @override
  List<Object?> get props => [status, result, errorMessage];

  AppState copyWith({
    AppStatus? status,
    HelloModel? result,
    String? errorMessage,
  }) {
    return AppState(
      status: status ?? this.status,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
