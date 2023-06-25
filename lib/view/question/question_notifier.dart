// ignore_for_file: public_member_api_docs, require_trailing_commas

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_exams/view/question/models/question_model.dart';

final questionProvider = StateNotifierProvider<QuestionNotifier, QuestionState>(
    (ref) => QuestionNotifier());

final class QuestionNotifier extends StateNotifier<QuestionState> {
  QuestionNotifier() : super(QuestionState());

  // int? get questionNumber => state.questionNumber;

  QuestionModel? getQuestion() {
    if (state.questions!.length < state.questionNumber!) {
      return state.questions![state.questionNumber!];
    } else {
      return null;
    }
  }

  void goToNextQuestion(List<QuestionModel> questions) {
    if (state.questionNumber == null) {
      state = state.copyWith(questionNumber: 1, questions: questions);
    } else {
      final nextNumber = state.questionNumber! + 1;
      state = state.copyWith(questionNumber: nextNumber);
    }
  }
}

class QuestionState extends Equatable {
  const QuestionState({this.questions, this.questionNumber});

  final List<QuestionModel>? questions;
  final int? questionNumber;

  @override
  List<Object?> get props => [questions, questionNumber];

  QuestionState copyWith(
      {List<QuestionModel>? questions, int? questionNumber}) {
    return QuestionState(
        questions: questions ?? this.questions,
        questionNumber: questionNumber ?? this.questionNumber);
  }
}
