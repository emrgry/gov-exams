import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../home/home_screen.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SA')),
      body: Center(
        child: Column(
          children: [
            const Text('Question Screen'),
            ElevatedButton(
              onPressed: () {
                context.navigateToPage(const HomeScreen(), type: SlideType.TOP);
              },
              child: const Text('Go to Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
