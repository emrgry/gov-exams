import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_exams/core/init/index.dart';
import 'package:gov_exams/view/home/home_screen.dart';

Future<void> main() async {
  await ApplicationStart.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
