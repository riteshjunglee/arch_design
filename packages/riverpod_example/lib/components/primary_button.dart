import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.isLoading,
    required this.onTap,
  }) : super(key: key);

  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          onTap.call();
        }
      },
      child: isLoading ? const Text('Loading...') : const Text('Init Code'),
    );
  }
}
