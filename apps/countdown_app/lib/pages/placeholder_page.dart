import 'package:flutter/material.dart';

// This page is not a part of the project, was used for designing the UI.

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Placeholder(fallbackHeight: 115),
        const SizedBox(height: 30),
        const Center(
          child: SizedBox(width: 365, child: Placeholder(fallbackHeight: 90)),
        ),
        const SizedBox(height: 30),
        const Center(
          child: SizedBox(width: 365, child: Placeholder(fallbackHeight: 90)),
        ),
        const SizedBox(height: 30),
        const Center(
          child: SizedBox(width: 365, child: Placeholder(fallbackHeight: 90)),
        ),
        const SizedBox(height: 30),
        Stack(
          children: [
            const Placeholder(fallbackHeight: 347),
            Column(
              children: const [
                SizedBox(
                  height: 220,
                ),
                Center(
                  child: SizedBox(
                    width: 50,
                    child: Placeholder(fallbackHeight: 50),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
