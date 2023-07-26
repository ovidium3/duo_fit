import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/screens/get_started/componenets/get_started_card.dart';

import '../../../constants/data/general_data.dart';
import '/controllers/get_started_controllers/get_started_controller.dart';

class GetStartedCardsScrollView extends GetView<GetStartedController> {
  const GetStartedCardsScrollView({
    required this.delay,
    super.key,
  });

  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ...List.generate(
              handledCardsList.length,
              (i) => DelayedDisplay(
                delay: delay,
                child: GetStartedCard(
                  id: handledCardsList[i].id,
                  text: handledCardsList[i].title,
                  description: handledCardsList[i].description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
