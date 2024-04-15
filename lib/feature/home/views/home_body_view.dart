import 'package:flage_quiz/feature/home/controller/question_cubit.dart';
import 'package:flage_quiz/feature/home/controller/question_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/widgets/custom_button.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
      child: BlocBuilder<QuestionCubit, QuestionStates>(
        builder: (context, state) {
          return ListView(
            children: [
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
                image: AssetImage(QuestionCubit.get(context).question.image),
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
                      color: QuestionCubit.get(context).colors[index],
                      txt: QuestionCubit.get(context).question.answers[index],
                      onTap: () {
                        QuestionCubit.get(context).selectAnswer(index);
                      });
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomeButton(
                color: Colors.purple,
                txt: QuestionCubit.get(context).btnSubmit,
                onTap: () {
                  QuestionCubit.get(context).submitAnswer();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
