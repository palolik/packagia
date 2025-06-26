library packagia;
import 'package:flutter/material.dart';

class Packagia extends StatelessWidget {
  const Packagia({super.key, required this.text,});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
