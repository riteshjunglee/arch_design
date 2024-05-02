part of 'page_two_cubit.dart';

class PageTwoState extends Equatable {
  const PageTwoState({this.shuffledText = ''});

  final String shuffledText;

  @override
  List<Object> get props => [shuffledText];
}
