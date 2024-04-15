import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flage_quiz/feature/home/controller/question_cubit.dart';
import 'package:flage_quiz/feature/home/controller/question_stats.dart';

import 'package:flage_quiz/feature/home/views/home_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionStates>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flage Quiz",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const HomeBodyView(),
      );
    }, listener: (context, state) {
      if (state is QuizEndState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          borderSide: const BorderSide(
            color: Colors.green,
          ),
          width: MediaQuery.sizeOf(context).width * 0.98,
          title: 'Score',
          desc: 'Your Score is ${QuestionCubit.get(context).resultes}',
          buttonsBorderRadius: const BorderRadius.all(
            Radius.circular(2),
          ),
          btnCancelOnPress: () {
            QuestionCubit.get(context).resetQuiz();
          },
          btnOkOnPress: () {
            QuestionCubit.get(context).resetQuiz();
          },
        ).show();
      }
    });
  }
}
