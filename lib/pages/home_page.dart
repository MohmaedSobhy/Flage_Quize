import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flage_quiz/logic/question/question_cubit.dart';
import 'package:flage_quiz/logic/question/question_stats.dart';
import 'package:flage_quiz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var questionCubit = QuestionCubit.get(context);
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(top: 1.5.h, bottom: 1.7.h),
              child: Text(
                "Country of This Flage",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
            ),
            Image(
              image: AssetImage(questionCubit.question.image),
              width: 22.w,
              height: 22.h,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            ListView.separated(
              itemCount: 4,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 0.5.h,
                );
              },
              itemBuilder: (context, index) {
                return CustomeButton(
                    color: questionCubit.colors[index],
                    txt: questionCubit.question.answers[index],
                    onTap: () {
                      questionCubit.selectAnswer(index);
                    });
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomeButton(
              color: Colors.purple,
              txt: questionCubit.btnSubmit,
              onTap: () {
                questionCubit.submitAnswer();
              },
            )
          ]),
        ),
      );
    }, listener: (context, state) {
      if (state is QuizEndState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          width: 280,
          title: 'Score',
          desc: 'Your Score is ${questionCubit.resultes}',
          buttonsBorderRadius: const BorderRadius.all(
            Radius.circular(2),
          ),
          btnCancelOnPress: () {
            questionCubit.resetQuiz();
          },
          btnOkOnPress: () {
            questionCubit.resetQuiz();
          },
        ).show();
      }
    });
  }
}
