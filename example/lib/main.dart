import 'package:flutter/material.dart';
import 'package:packagia/packagia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Prottoys first package'),
        ),
        body: const  CountryPack(),
      ),
    );
  }
}

