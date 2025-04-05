import 'package:http/http.dart' as http;
import './question_model.dart';
import 'dart:convert';

class DBConnect {
  final url = Uri.parse(
      'https://midterm-18d21-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json
            .encode({'title': question.title, 'options': question.options}));
  }

  //Fetching data from the database
  Future<void> fetchQuestions() async {
    http.get(url).then((response) {
      var data = json.decode(response.body);
      print(data);
    });
  }
}
