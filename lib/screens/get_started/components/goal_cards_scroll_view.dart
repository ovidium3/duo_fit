import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/data/general_data.dart';
import '/controllers/get_started/get_started_controller.dart';
import '/screens/get_started/components/goal_card.dart';

class GoalCardsScrollView extends GetView<GetStartedController> {
  const GoalCardsScrollView({
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
              DataConstants.goalCardsList.length,
              (i) => DelayedDisplay(
                delay: delay,
                child: GoalCard(
                  id: DataConstants.goalCardsList[i].id,
                  text: DataConstants.goalCardsList[i].title,
                  description: DataConstants.goalCardsList[i].description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
