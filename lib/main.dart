import 'package:flutter/material.dart';
import 'package:siet_app/screens/login.dart';

void main() {
  runApp(const SIETApp());
}

class SIETApp extends StatelessWidget {
  const SIETApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Siet', home: Login());
  }
}
