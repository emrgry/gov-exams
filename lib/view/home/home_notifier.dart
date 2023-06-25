// ignore_for_file: public_member_api_docs, use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gov_exams/view/fav_questions/fav_questions.dart';
import 'package:gov_exams/view/game/game_view.dart';
import 'package:gov_exams/view/home/models/exam_model.dart';
import 'package:gov_exams/view/question/question_screen.dart';
import 'package:gov_exams/view/reading/read_screen.dart';
import 'package:gov_exams/widgets/drawer/model/drawer_model.dart';

final homeProvider =
    StateNotifierProvider<HomeNotifier, String>((ref) => HomeNotifier());

class HomeNotifier extends StateNotifier<String> {
  HomeNotifier() : super('');

  ExamModel? _currentExamType;
  final zoomController = ZoomDrawerController();

  final _questionModel = DrawerMenuItemModel(
    menuName: 'Sorular',
    menuScreen: const QuestionScreen(),
    menuIcon: Icons.question_mark_rounded,
  );

  final _readingModel = DrawerMenuItemModel(
    menuName: 'Konu Anlatımı',
    menuScreen: const ReadScreen(),
    menuIcon: Icons.my_library_books_outlined,
  );

  final _trafficSign = DrawerMenuItemModel(
    menuName: 'Trafik Levhaları',
    menuScreen: const GameView(),
    menuIcon: Icons.traffic_outlined,
  );

  final _favQuestions = DrawerMenuItemModel(
    menuName: 'Favori Sorular',
    menuScreen: const FavQuestionsView(),
    menuIcon: Icons.star_border,
  );

  late final List<ExamModel> _examTypes = [
    ExamModel(
      examName: 'Ehliyet',
      menuNames: [
        _questionModel,
        _readingModel,
        _trafficSign,
        _favQuestions,
      ],
    ),
    ExamModel(
      examName: 'Jandarma',
      menuNames: [
        _questionModel,
        _readingModel,
        _favQuestions,
      ],
    )
  ];

  List<ExamModel> get getExamTypes => _examTypes;
  ExamModel? get getExam => _currentExamType;

  void setCurrentExamType(int index) => _currentExamType = _examTypes[index];

  // Future<DocumentSnapshot<Map<String, dynamic>>> requestExam() {
  //   final response =
  //       FirebaseFirestore.instance.collection('exam-types').doc('types').get();
  //   return response;
  // }

  // void setExamTypes(AsyncSnapshot<dynamic> snapshot) {
  //   snapshot.data.data().forEach((key, value) {
  //     examTypes.add(key as String);
  //   });
  // }
}


// class QuestionState extends Equatable {
//   const QuestionState({this.questions, this.questionNumber});

//   final List<>? questions;
//   final int? questionNumber;

//   @override
//   List<Object?> get props => [questions, questionNumber];

//   QuestionState copyWith(
//       {List<>? questions, int? questionNumber}) {
//     return QuestionState(
//         questions: questions ?? this.questions,
//         questionNumber: questionNumber ?? this.questionNumber);
//   }
// }