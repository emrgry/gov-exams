import 'package:flutter/material.dart';
import 'package:gov_exams/view/reading/read_screen.dart';
import 'package:kartal/kartal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SA')),
      body: Center(
        child: Column(
          children: [
            const Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                context.navigateToPage(const ReadScreen(), type: SlideType.TOP);
              },
              child: const Text('Go to Read screen'),
            ),
          ],
        ),
      ),
    );
  }
}
