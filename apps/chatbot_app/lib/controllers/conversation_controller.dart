import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../data/fun_facts_data.dart';
import '../models/message_model.dart';

class ConversationController extends ChangeNotifier {
  List<Message> messagesList = [];
  List<String> answersList = [];

  greetingUser() {
    addMessage(
      Message(
          messageContent:
              "Seni tekrar gördüğüme sevindim! \nBugün ne yapmak istersin?",
          messageType: MessageType.reciever),
    );
    addAllButtons(
      [
        'Oyun oynamak istiyorum.',
        'Bir şeyler öğrenmek istiyorum.',
        'Şu an bir şey yapmak istemiyorum.'
      ],
    );
  }

  botAnswer() {
    guessingTheNumber();
    switch (messagesList.last.messageContent) {
      case 'Oyun oynamak istiyorum.':
        numberGuessingGame();
        break;
      case 'Bir şeyler öğrenmek istiyorum.':
        giveFunFact();
        break;
      case 'Şu an bir şey yapmak istemiyorum.':
        Timer(
          const Duration(seconds: 1),
          () {
            addMessage(
              Message(
                  messageContent:
                      "Garip... Sanki uygulamayı ben çalıştırdım.\nNeyse, bir şey yapmak istersen tekrar yazabilirsin.",
                  messageType: MessageType.reciever),
            );
          },
        );
        Timer(
          const Duration(seconds: 2),
          () {
            addMessage(
              Message(
                  messageContent: "Görüşürüz!",
                  messageType: MessageType.reciever),
            );
            addButton('Merhaba, geri geldim!');
          },
        );
        break;

      case 'Merhaba, geri geldim!':
        Timer(
          const Duration(seconds: 1),
          () {
            greetingUser();
          },
        );
        break;
      case 'Olur, isterim.':
        giveFunFact();
        break;
      case 'Hayır, istemiyorum.':
        Timer(
          const Duration(seconds: 1),
          () {
            addMessage(
              Message(
                  messageContent: 'Tamam, ne yapmak istersin?',
                  messageType: MessageType.reciever),
            );
          },
        );
        Timer(
          const Duration(seconds: 2),
          () {
            addAllButtons(
              [
                'Oyun oynamak istiyorum.',
                'Bir şeyler öğrenmek istiyorum.',
                'Şu an bir şey yapmak istemiyorum.'
              ],
            );
          },
        );
        break;
      case 'Tuttum.':
        Timer(
          const Duration(seconds: 1),
          () {
            addMessage(
              Message(
                  messageContent: 'Tuttuğun sayı 50 mi?',
                  messageType: MessageType.reciever),
            );
          },
        );
        Timer(
          const Duration(seconds: 1),
          () {
            addAllButtons(
              ['Evet, bildin!', 'Hayır, daha yüksek.', 'Hayır, daha düşük.'],
            );
          },
        );
        break;
    }
  }

  giveFunFact() {
    if (funFacts.isEmpty) {
      Timer(
        const Duration(seconds: 1),
        () {
          addMessage(
            Message(
                messageContent:
                    "Şu an aklıma daha fazla bilgi gelmiyor. Başka bir şey yapalım!",
                messageType: MessageType.reciever),
          );
        },
      );
      Timer(
        const Duration(seconds: 2),
        () {
          addAllButtons(
            [
              'Oyun oynamak istiyorum.',
              'Bir şeyler öğrenmek istiyorum.',
              'Şu an bir şey yapmak istemiyorum.'
            ],
          );
        },
      );
      return;
    }

    Random random = Random();
    int randomFactIndex = random.nextInt(funFacts.length);
    String randomFact = funFacts[randomFactIndex];
    funFacts.remove(randomFact);
    Timer(
      const Duration(seconds: 1),
      () {
        addMessage(
          Message(messageContent: "Hmmm...", messageType: MessageType.reciever),
        );
      },
    );

    Timer(
      const Duration(seconds: 2),
      () {
        addMessage(
          Message(
              messageContent: randomFact, messageType: MessageType.reciever),
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        addMessage(
          Message(
              messageContent: "Bir tane daha ister misin?",
              messageType: MessageType.reciever),
        );
        addAllButtons(
          ['Olur, isterim.', 'Hayır, istemiyorum.'],
        );
      },
    );
  }

  numberGuessingGame() {
    Timer(
      const Duration(seconds: 1),
      () {
        addMessage(
          Message(
            messageContent:
                "Hadi aklından 1 ile 101 arasında bir sayı tut! \nOnu tahmin etmeyi deneyeceğim.",
            messageType: MessageType.reciever,
          ),
        );
      },
    );
    Timer(
      const Duration(seconds: 2),
      () {
        addMessage(
          Message(
            messageContent: "Tuttunca haber ver.",
            messageType: MessageType.reciever,
          ),
        );
        addButton('Tuttum.');
      },
    );
  }

  int guessNumber = 50;
  int guessChange = 25;
  int guessCount = 0;

  guessingTheNumber() {
    if (guessChange == 2) {
      guessChange = 1;
    }
    if (guessCount == 7) {
      clearAllButtons();
      Timer(
        const Duration(seconds: 1),
        () {
          addMessage(
            Message(
              messageContent:
                  "Hey, hile yapıyorsun! Daha fazla oynamak istemiyorum, Başka bir şey yapalım.",
              messageType: MessageType.reciever,
            ),
          );
        },
      );

      Timer(
        const Duration(seconds: 2),
        () {
          addAllButtons(
            [
              'Oyun oynamak istiyorum.',
              'Bir şeyler öğrenmek istiyorum.',
              'Şu an bir şey yapmak istemiyorum.'
            ],
          );
        },
      );
      guessNumber = 50;
      guessChange = 25;
      guessCount = 0;
      return;
    }

    switch (messagesList.last.messageContent) {
      case 'Evet, bildin!':
        Timer(
          const Duration(seconds: 1),
          () {
            addMessage(
              Message(
                messageContent: "Haha, aslında başından beri biliyordum!",
                messageType: MessageType.reciever,
              ),
            );
          },
        );
        Timer(
          const Duration(seconds: 2),
          () {
            addMessage(
              Message(
                messageContent: "Şimdi ne yapmak istersin?",
                messageType: MessageType.reciever,
              ),
            );
            addAllButtons(
              [
                'Oyun oynamak istiyorum.',
                'Bir şeyler öğrenmek istiyorum.',
                'Şu an bir şey yapmak istemiyorum.'
              ],
            );
          },
        );
        guessNumber = 50;
        guessChange = 25;
        guessCount = 0;
        break;
      case 'Hayır, daha yüksek.':
        guessNumber = guessNumber + guessChange;
        guessChange = (guessChange / 2).ceil();
        guessCount++;
        Timer(
          const Duration(seconds: 1),
          () {
            addMessage(
              Message(
                messageContent: "Hmmm... O zaman $guessNumber!",
                messageType: MessageType.reciever,
              ),
            );
            addAllButtons(
              ['Evet, bildin!', 'Hayır, daha yüksek.', 'Hayır, daha düşük.'],
            );
          },
        );
        break;
      case 'Hayır, daha düşük.':
        guessNumber = guessNumber - guessChange;
        guessChange = (guessChange / 2).ceil();
        guessCount++;
        Timer(
          const Duration(seconds: 1),
          () {
            addMessage(
              Message(
                messageContent: "Hmmm... O zaman $guessNumber!",
                messageType: MessageType.reciever,
              ),
            );
            addAllButtons(
              ['Evet, bildin!', 'Hayır, daha yüksek.', 'Hayır, daha düşük.'],
            );
          },
        );
        break;
    }
  }

  addMessage(Message newMessage) {
    messagesList.add(newMessage);
    notifyListeners();
  }

  addButton(String newButton) {
    answersList.add(newButton);
    notifyListeners();
  }

  addAllButtons(List<String> newButtons) {
    answersList.addAll(newButtons);
    notifyListeners();
  }

  clearAllButtons() {
    answersList.clear();
    notifyListeners();
  }
}
