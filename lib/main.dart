import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import './screens/homeScreen.dart';
import './models/db_connect.dart';

void main() {
  var db = DBConnect();
  // db.addQuestion(Question(
  //   id: '20',
  //   title: 'What is 5 * 6 ?',
  //   options: {'10': false, '30': true, '20': false, '25': false},
  // ));
  db.fetchQuestions();  

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
