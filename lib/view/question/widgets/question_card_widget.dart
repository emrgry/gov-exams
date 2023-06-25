// ignore_for_file: public_member_api_docs, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_exams/core/constants/index.dart';
import 'package:gov_exams/view/question/models/question_model.dart';
import 'package:gov_exams/view/question/question_notifier.dart';

class QuestionCard extends ConsumerWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final QuestionState questions = ref.watch(questionProvider);
    final questionNumber = questions.questionNumber ?? 0;
    final QuestionModel? question = questions.questions?[questionNumber];
    return Container(
      width: double.infinity,
      color: ColorConstants.yellow,
      child: Column(
        children: [
          questionArea(
            question?.question,
          )
        ],
      ),
    );
  }

  Text questionArea(String? question) {
    String text = '';
    if (question == null) {
      text = 'Sınav Süresi 1 saattir';
    } else {
      text = question;
    }
    return Text(text);
  }
}
