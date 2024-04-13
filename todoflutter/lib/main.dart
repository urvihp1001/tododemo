// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/models/tasks_data.dart';
import 'Screens/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(create: (context)=>TasksData(),
    child:MaterialApp(
debugShowCheckedModeBanner: false,
home:HomeScreen()
    ),
    );
      
  }
}