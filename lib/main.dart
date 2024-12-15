import 'package:flutter/material.dart';
import 'package:lab_2/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepPurple[100],
          appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple[300]),
      ),
      home: HomeScreen()
    );
  }
}

