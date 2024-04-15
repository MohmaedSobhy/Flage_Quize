import 'package:flage_quiz/feature/home/controller/question_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'feature/home/controller/question_cubit.dart';
import 'feature/home/screens/home_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(InitialState()),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
