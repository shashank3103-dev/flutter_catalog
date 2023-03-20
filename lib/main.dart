import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homepage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
        darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      routes: {
        "/":(context)=>Homepage(),
        
      },

    );
  }
}
