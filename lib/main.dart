import 'package:exercises/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExercisesApp());
}

class ExercisesApp extends StatelessWidget {
  const ExercisesApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
