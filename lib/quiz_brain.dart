
import 'questions.dart';

class QuizBrain {

  int _questionno =0;
  List<Question> _questionbank = [
    Question(q: 'Delhi is the capital of INDIA', a: true,),
    Question(q: 'You can lead a cow downstairs but not up stairs', a: false,),
    Question(
      q: 'Approximately one quarter of human bones are in the feet', a: true,),
    Question(q: 'A slug\'s blood is green', a: true,),
    Question(q: '24 + 3 - 7 = 20', a: true,),
    Question(q: 'C language was developed by Dennis Ritchie', a: true,),
    Question(q: 'Java was developed by James Gooseling', a: true,),
    Question(
      q: 'In a family, there are six members A, B, C, D, E and F.A and B are a married'
          'couple, A being the male member. D is the only son of C, who is the brother of A. E'
          'is the sister of D. B is the daughter-in-law of F, whose husband has died. Then E is'
          'the sister of C', a: false,),
  ];

  void nextquestion()
  {
    if(_questionno < _questionbank.length-1)
      _questionno++;
  }

 String getquestionText() {
    return _questionbank[_questionno].questiontext.toString();
  }

  bool? getquestionanswer()
  {
    return _questionbank[_questionno].questionanswer;
  }
}