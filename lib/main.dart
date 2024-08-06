import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testlamp/cubit/lamp_cubit.dart';
import 'package:testlamp/reposetorey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
    // Start fetching data every 5 seconds

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LampCubit()..apifetchData(),
        child: HomePage(),
      ),
    );
  }
}
