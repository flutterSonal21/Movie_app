import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'search_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData.dark(),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}
