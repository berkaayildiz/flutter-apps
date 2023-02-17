import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './constants/constants.dart';
import './controllers/app_controller.dart';
import './pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primarySwatch, elevation: 0),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primarySwatch: primarySwatch,
        appBarTheme: const AppBarTheme(
          color: primarySwatch,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
          elevation: 1,
        ),
      ),
      home: const HomePage(),
    );
  }
}
