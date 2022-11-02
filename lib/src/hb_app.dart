import 'package:flutter/material.dart';

import 'screens/main_page.dart';

class HBApp extends StatelessWidget {
  const HBApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
