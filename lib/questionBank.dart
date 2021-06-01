import 'question.dart';

class QuestionBank {
  int questionNum = 0;
  List<Question> _questionList = [
    Question(q: 'You can lead a cow to down stears not up stears', a: false),
    Question(q: 'Appreantly one fourth of human bones are in feet', a: true),
    Question(q: 'A slug\'s blood is green', a: false),
  ];
}

class AnotherQuestion {
  int _questionNum = 0;
  List<Question> _questionList = [
    Question(q: 'You can lead a cow to down stears not up stears', a: false),
    Question(q: 'Appreantly one fourth of human bones are in feet', a: true),
    Question(q: 'A slug\'s blood is green', a: false),
  ];

  void nextQuestion() {
    if (_questionNum < _questionList.length - 1) {
      _questionNum++;
    }
  }

  String getQuestion() {
    return _questionList[_questionNum].questionText;
  }

  bool getAnswer() {
    return _questionList[_questionNum].questionAnswer;
  }

  bool isFinished() {
    if (_questionNum >= _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;
  }
}
