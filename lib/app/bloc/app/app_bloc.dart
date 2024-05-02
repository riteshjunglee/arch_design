import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required HomeRepo homeRepo})
      : _homeRepo = homeRepo,
        super(const AppState()) {
    on<ReceiveMessageEntered>(_mapMessageEnteredToState);
  }

  final HomeRepo _homeRepo;
  // final FirebaseCrashlytics _crashlytics;

  Future<void> _mapMessageEnteredToState(
    ReceiveMessageEntered event,
    Emitter emit,
  ) async {
    try {
      emit(state.copyWith(status: AppStatus.loading));

      final message = event.message.trim();
      final alphabetsOnly = RegExp(r'^[a-zA-Z][a-zA-Z\s]*$');
      if (alphabetsOnly.hasMatch(message)) {
        final result =
            await _homeRepo.welcomeToHome(message: message);

        return emit(
          state.copyWith(
            status: AppStatus.success,
            result: result,
          ),
        );
      }

      emit(
        state.copyWith(
          status: AppStatus.error,
          errorMessage: 'Please enter alphabets only.',
        ),
      );
    } catch (e) {
      // report the error to server
      // _crashlytics.recordError(e, s, fatal: true);
      emit(
        state.copyWith(
          status: AppStatus.error,
          errorMessage: '''
Ops! looks like something went wrong. Our team is already looking into the issue.''',
        ),
      );
    }
  }
}
