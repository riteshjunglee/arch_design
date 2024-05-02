import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'super_list_event.dart';
part 'super_list_state.dart';

class SuperListBloc extends Bloc<SuperListEvent, SuperListState> {
  SuperListBloc() : super(SuperListInitial()) {
    on<SuperListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
