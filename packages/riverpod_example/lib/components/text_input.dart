import 'package:flutter/material.dart';

class WidgetDemoTextInput extends StatefulWidget {
  const WidgetDemoTextInput({Key? key, required this.onChanged})
      : super(key: key);

  final void Function(String)? onChanged;

  @override
  State<WidgetDemoTextInput> createState() => _WidgetDemoTextInputState();
}

class _WidgetDemoTextInputState extends State<WidgetDemoTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      // could be used to prevent edit time
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp(r'^[a-z][a-z\s]*$'))
      // ],
    );
  }
}
