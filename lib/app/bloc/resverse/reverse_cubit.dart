import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reverse_state.dart';

class ReverseCubit extends Cubit<ReverseState> {
  ReverseCubit() : super(const ReverseState());

  @override
  Future<void> close() {
    print('closing the cubit now');
    return super.close();
  }

  void getReverseSequence(String something){
    final stringArray = something.split('');
    final reverseText = stringArray.reversed.toList().join();

    emit(ReverseState(reverseText: reverseText));
  }
}
