import 'package:flutter/material.dart';

/// TODO: to update a single item in a list of items
/// when the data updates within the list of items already
/// present
class SuperListScreen extends StatelessWidget {
  const SuperListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => SuperItem(text: 'text$index'),
      ),
    );
  }
}

class SuperItem extends StatelessWidget {
  const SuperItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(text),
        const SizedBox(height: 16)
      ],
    );
  }
}
