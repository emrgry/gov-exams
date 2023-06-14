import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SA')),
      body: Center(
        child: Column(
          children: [
            const Text('Read Screen'),
            ElevatedButton(
              onPressed: () {
                context.navigateToPage(const ReadScreen(), type: SlideType.TOP);
              },
              child: const Text('Go to Question screen'),
            ),
          ],
        ),
      ),
    );
  }
}
