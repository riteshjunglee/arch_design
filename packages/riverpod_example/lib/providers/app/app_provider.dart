import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/injections.dart';

part 'app_provider.g.dart';

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

@riverpod
class AppProvider extends _$AppProvider {
  @override
  AppState build() {
    return const AppState();
  }

  void generateMessage(String msg) async {
    try {
      final homeRepo = ref.read(homeRepoInjectionProvider);
      final message = msg.trim();
      final alphabetsOnly = RegExp(r'^[a-zA-Z][a-zA-Z\s]*$');
      if (alphabetsOnly.hasMatch(message)) {
        final result = await homeRepo.welcomeToHome(message: message);

        state = state.copyWith(
          status: AppStatus.success,
          result: result,
        );
        return;
      }

      state = state.copyWith(
        status: AppStatus.error,
        errorMessage: 'Please enter alphabets only.',
      );
    } catch (e) {
      state = state.copyWith(
        status: AppStatus.error,
        errorMessage: '''
Ops! looks like something went wrong. Our team is already looking into the issue.''',
      );
    }
  }
}
