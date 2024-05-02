part of 'reverse_cubit.dart';

 class ReverseState extends Equatable {
  const ReverseState({this.reverseText = ''});

  final String reverseText;

  @override
  List<Object> get props => [reverseText];
}
