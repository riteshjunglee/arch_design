import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText({
    Key? key,
    required this.isSuccess,
    required this.result,
    required this.isError,
    required this.errorMessage,
  }) : super(key: key);

  final bool isSuccess;
  final String result;
  final bool isError;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (isError) return Text(errorMessage);

    if (isSuccess) {
      return Text(result, key: const ValueKey('success-text'));
    } else {
      return const Text('waiting for result.');
    }
  }
}
