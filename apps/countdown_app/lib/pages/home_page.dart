import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../controllers/app_controller.dart';
import '../widgets/create_countdown_button.dart';
import '/widgets/get_countdown_name.dart';
import '../widgets/get_datetime_button.dart';
import '../widgets/my_countdown_timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                constraints: const BoxConstraints(maxHeight: 270),
                context: context,
                builder: ((context) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: const Text(
                          "COUNTDOWN MAKER",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const GetCountdownName(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          GetDateTimeButton(),
                          CreateCountdownButton(),
                        ],
                      ),
                    ],
                  );
                }),
              );
            },
          ),
          body: ListView.builder(
            itemCount: controller.allCountdownCardsData.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return MyCountdownTimer(
                  data: controller.allCountdownCardsData[index]);
            },
          ),
        );
      },
    );
  }
}
