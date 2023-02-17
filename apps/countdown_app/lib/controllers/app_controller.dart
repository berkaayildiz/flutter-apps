import 'package:flutter/material.dart';

import '../models/countdown_card_model.dart';

class AppController extends ChangeNotifier {
  List<CountdownCardData> allCountdownCardsData = [];

  DateTime? dateTime;
  String? countdownCardName;

  addCountdownCard() {
    allCountdownCardsData.add(
      CountdownCardData(
        dateTime: dateTime!,
        countdownCardName: countdownCardName!,
      ),
    );
    dateTime = null;
    countdownCardName = null;
    notifyListeners();
  }
}
