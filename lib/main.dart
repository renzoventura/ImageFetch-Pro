import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay/di/setup_dependencies.dart';
import 'package:pixabay/screens/feed_screen/screens/feed_screen.dart';

void main() {
  setUpDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pixabay App',
      home: FeedScreen(),
    );
  }
}
