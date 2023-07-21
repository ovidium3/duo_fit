import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/view/screens/Get%20started/componenets/get_started_card.dart';

import '../../../../constants/onboarding/onboarding_cards.dart';
import '../../../../controllers/get_started_controller/get_started_controller.dart';

class GetStartedCardsScrollView extends GetView<GetStartedController> {
  const GetStartedCardsScrollView({
    super.key,
    required this.delay,
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
