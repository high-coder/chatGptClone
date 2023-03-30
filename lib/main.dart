import 'package:chatgpt_flutter/providers/currentState.dart';
import 'package:chatgpt_flutter/screens/homeScreen/our_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentState())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OurHome(),
      ),
    );
  }
}
