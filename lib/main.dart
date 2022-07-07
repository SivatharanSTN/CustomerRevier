import 'package:flutter/material.dart';

import 'customer_review/home_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
