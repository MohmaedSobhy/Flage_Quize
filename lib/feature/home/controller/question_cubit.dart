import 'package:flage_quiz/core/helper/helper.dart';
import 'package:flage_quiz/feature/home/controller/question_stats.dart';
import 'package:flage_quiz/feature/home/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCubit extends Cubit<QuestionStates> {
  QuestionCubit(super.initialState);

  int _currentQuesiton = 0;
  int lenght = Question.dummyData().length;
  static QuestionCubit? questionCubit;
  String btnSubmit = "Submit";
  int resultes = 0;
  Question question = Question.dummyData()[0];
  List<Color> colors = [Colors.white, Colors.white, Colors.white, Colors.white];
  int _selectedAnswer = -1;

  // false if user click submit button Check Answer else  Choose nextQuestion
  bool nextQuestion = false;

  bool btnSubmitClicked = false;

  static QuestionCubit get(context) {
    questionCubit ??= BlocProvider.of(context);
    return questionCubit!;
  }

  void selectAnswer(int buttonIndex) {
    if (!btnSubmitClicked) {
      _selectedAnswer = buttonIndex;
      for (int i = 0; i < 4; i++) {
        colors[i] = (i == buttonIndex) ? Colors.amber : Colors.white;
      }
      emit(SelectAnswerStates());
    }
  }

  void submitAnswer() {
    if (nextQuestion) {
      _nextQuestion();
    } else {
      _checkAnswer();
    }
  }

  void _checkAnswer() {
    if (_selectedAnswer == -1) {
      showToastMessage();
      return;
    }

    nextQuestion = true;
    btnSubmitClicked = true;
    if (_currentQuesiton == lenght - 1) {
      btnSubmit = "Finish";
    } else {
      btnSubmit = "Go To Next Question";
    }
    if (question.answers[_selectedAnswer] ==
        question.answers[question.indexOfCorrectAnswers]) {
      colors[_selectedAnswer] = Colors.green;
      resultes++;
    } else {
      colors[_selectedAnswer] = Colors.red;
      colors[question.indexOfCorrectAnswers] = Colors.green;
    }
    emit(CheckAnswerState());
  }

  void _nextQuestion() {
    _currentQuesiton++;
    if (_currentQuesiton < lenght) {
      _selectedAnswer = -1;
      _resetQuestion();
      emit(NextQuestionStates());
    } else {
      emit(QuizEndState());
    }
  }

  void _resetQuestion() {
    question = Question.dummyData()[_currentQuesiton];
    for (int i = 0; i < 4; i++) {
      colors[i] = Colors.white;
    }
    nextQuestion = false;
    btnSubmit = "Submit";
    btnSubmitClicked = false;
    emit(InitialState());
  }

  void resetQuiz() {
    _currentQuesiton = 0;
    resultes = 0;
    _selectedAnswer = -1;
    _resetQuestion();
  }
}
