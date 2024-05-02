import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_two_state.dart';

class PageTwoCubit extends Cubit<PageTwoState> {
  PageTwoCubit() : super(const PageTwoState());

  void shuffleText(String someText) {
    final textArray = someText.split('')..shuffle();
    final shuffleText = textArray.join();
    emit(PageTwoState(shuffledText: shuffleText));
  }
}
