import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gov_exams/view/question/question_screen.dart';
import 'package:kartal/kartal.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final response =
    //     FirebaseFirestore.instance.collection('meb-mtsk').get().then((value) {
    //   for (var docSnapshot in value.docs) {
    //     print(docSnapshot.id);
    //   }
    // });
    final response = FirebaseFirestore.instance.collection('meb-mtsk').get();

    return FutureBuilder(
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
              final t = snapshot.data!.docs.map((e) => e.id).toList();
              // final t = snapshot.data!.id;
              print(t);
              return testWdiget();
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }

  Scaffold testWdiget() {
    return Scaffold(
      appBar: AppBar(title: const Text('SA')),
      body: const Center(
        child: Column(
          children: [Text('Read Screen')],
        ),
      ),
    );
  }
}
