import 'package:http/http.dart' as http;
import './question_model.dart';
import 'dart:convert';

class DBConnect {
  final url = Uri.parse(
      'https://midterm-18d21-default-rtdb.firebaseio.com/questions.json');

  Future<List<Question>> fetchQuestions() async {
    return http.get(url).then((response) {

      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key, 
          title: value['title'],
          options: Map.castFrom(value['options']), 
        );
        // add to newQuestions
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}
