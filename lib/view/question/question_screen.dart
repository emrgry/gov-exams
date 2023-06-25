// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_exams/view/question/models/question_model.dart';
import 'package:gov_exams/view/question/question_notifier.dart';
import 'package:gov_exams/view/question/widgets/question_card_widget.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  bool initialized = false;
  List<QuestionModel> questions = [];
  @override
  Widget build(BuildContext context) {
    final response = FirebaseFirestore.instance
        .collection('meb-mtsk')
        .doc('2023-haziran-sinav-1')
        .collection('questions')
        .withConverter(
          fromFirestore: QuestionModel.fromJson,
          toFirestore: (QuestionModel value, _) => value.toJson(),
        )
        .get();
    // print(initialized);
    return initialized
        ? mainWidget(ref, questions)
        : FutureBuilder(
            future: response,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Placeholder();
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const LinearProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    questions =
                        snapshot.data!.docs.map((e) => e.data()).toList();
                    return mainWidget(ref, questions);
                  } else {
                    return const SizedBox();
                  }
              }
            },
          );
  }

  Scaffold mainWidget(WidgetRef ref, List<QuestionModel> questions) {
    return Scaffold(
      appBar: AppBar(title: const Text('SA')),
      body: Center(
        child: Column(
          children: [
            const Text('Question Screen'),
            const QuestionCard(),
            if (!initialized)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    initialized = true;
                    ref
                        .read(questionProvider.notifier)
                        .goToNextQuestion(questions);
                  });
                },
                child: const Text('Başlat'),
              ),
          ],
        ),
      ),
    );
  }
}

// class QuestionScreen extends ConsumerWidget {
//   const QuestionScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final response = FirebaseFirestore.instance
//         .collection('meb-mtsk')
//         .doc('2023-haziran-sinav-1')
//         .collection('questions')
//         .withConverter(
//           fromFirestore: QuestionModel.fromJson,
//           toFirestore: (QuestionModel value, _) => value.toJson(),
//         )
//         .get();
//     return FutureBuilder(
//       future: response,
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//             return const Placeholder();
//           case ConnectionState.waiting:
//           case ConnectionState.active:
//             return const LinearProgressIndicator();
//           case ConnectionState.done:
//             if (snapshot.hasData) {
//               final questions =
//                   snapshot.data!.docs.map((e) => e.data()).toList();
//               return mainWidget(ref, questions);
//             } else {
//               return const SizedBox();
//             }
//         }
//       },
//     );
//     //
//   }


