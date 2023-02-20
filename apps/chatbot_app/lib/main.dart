import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../controllers/conversation_controller.dart';
import '../pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConversationController()..greetingUser(),
      child: const ChatBotApp(),
    ),
  );
}

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: themeColor,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: BorderSide.strokeAlignOutside,
          toolbarHeight: 50,
          elevation: 0,
          color: layoutColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        scaffoldBackgroundColor: themeColor,
      ),
    );
  }
}
