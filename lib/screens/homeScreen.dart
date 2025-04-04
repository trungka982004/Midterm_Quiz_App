import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/next_button.dart';

import '../widgets/option_card.dart';
import '../widgets/question_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '10',
      title: 'What is 2+2 ?',
      options: {'4': true,'1': false,'2': false,'5': false},
    ),
    Question(
      id: '11',
      title: 'What is 3+2 ?',
      options: {'4': false,'1': false,'2': false,'5': true},
    ),
  ];
  
  int index = 0;
  bool isPressed = false;
  void nextQuestion(){
    if(index == _questions.length - 1){
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
      });
    }
  }
  
  void changeColor(){
    setState(() {
      isPressed = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Quiz App',
          style: TextStyle(color: neutral),
        ),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              question: _questions[index].title,
              indexAction: index,
              totalQuestions: _questions.length,
            ),
            const Divider(color: neutral),

            const SizedBox(height: 20.0), 
            for(int i =0; i < _questions[index].options.length;i++)
              OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed 
                    ? _questions[index].options.values.toList()[i] == true 
                    ? correct 
                    : incorrect
                    : neutral,
                onTap: changeColor,
              ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton()
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(nextQuestion: nextQuestion,) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}