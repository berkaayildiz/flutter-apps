import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../widgets/button_screen.dart';
import '../widgets/chat_screen.dart';
import '../widgets/frost_glass_effect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 53.0),
        child: FrostGlassEffect(
          child: AppBar(
            title: Text(
              appBarTitle,
              style: GoogleFonts.gothicA1(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appBarTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: const ChatScreen(),
      bottomSheet: const FrostGlassEffect(child: ButtonScreen()),
    );
  }
}
