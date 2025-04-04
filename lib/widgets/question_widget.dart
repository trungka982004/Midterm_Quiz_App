import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class QuestionWidget extends StatelessWidget{
  const QuestionWidget({Key? key, 
    required this.question,
    required this.totalQuestions,
    required this.indexAction,
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: const TextStyle(
          fontSize: 24.0,
          color: neutral      
        ),
      ),
    );
  }
}