import 'package:flutter/material.dart';
import 'package:guess_the_word/home/bloc/guess_word_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_page.dart';

void main() {
  //initialize a new instance of BLoC
  runApp(BlocProvider(
    create: (context) => GuessWordBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: HomePage(),
    );
  }
}
