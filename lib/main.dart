import 'package:flutter/material.dart';
import 'package:konverter_suhu/convert.dart';
import 'package:konverter_suhu/try.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: tryConvert());
  }
}
