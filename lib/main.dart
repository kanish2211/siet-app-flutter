import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siet_app/screens/authentication/login.dart';
import 'package:siet_app/screens/student/suggestion.dart';

void main() {
  runApp(const ProviderScope(child: SIETApp()));
}

class SIETApp extends StatelessWidget {
  const SIETApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Siet', home: Login());
  }
}
