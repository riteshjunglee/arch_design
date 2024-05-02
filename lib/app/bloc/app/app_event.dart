part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class ReceiveMessageEntered extends AppEvent {
  const ReceiveMessageEntered({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
