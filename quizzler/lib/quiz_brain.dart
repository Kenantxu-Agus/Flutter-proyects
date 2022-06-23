import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _aciertos = 0;
  bool _final = false;

  final List<Question> _questionBank = [
    Question('La isla más grande del mundo es Groenlandia', true),
    Question(
        'Tony Hawk aterrizó el primer 900 de la historia del skateboarding',
        true),
    Question(
        'El Guernica de Picasso se encuentra en el Museo del Prado en Madrid',
        false),
    Question(
        'La biblioteca de Alejandría fue destruida por un incendio', false),
    Question('El idioma más hablado del mundo es el chino mandarín', true),
    Question('El último esposo de Cleopatra fue Julio Cesar', false),
    Question('El océano más grande del mundo es el océano Atlántico', false),
    Question('En Suiza se habla Romanche', true),
    Question('En el año 1988 se creó la World Wide Web', false),
    Question('La guerra de los 100 años duró 116 años', true),
    Question('El David de Miguel Ángel mide más de 5 metros', true),
    Question('En 1967 el hombre piso la Luna', false),
    Question('El tomate es una hortaliza', false),
    Question(
        'El director de la película animada \"La princesa Mononoke\" fue Hayao Miyazaki',
        true),
  ];

  String getText() {
    return (_questionBank[_questionNumber].q);
  }

  bool getAnswer() {
    return (_questionBank[_questionNumber].a);
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _final = true;
    }
  }

  void nextQuestionPlus() async {
    _aciertos++;
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _final = true;
    }
  }

  bool isFinal() {
    return (_final);
  }

  String getAciertos() {
    return (_aciertos.toString());
  }

  int getAcierto() {
    return (_aciertos);
  }

  void reset() {
    _questionNumber = 0;
    _aciertos = 0;
    _final = false;
  }
}
