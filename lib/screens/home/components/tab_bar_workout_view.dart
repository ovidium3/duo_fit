import 'package:duo_fit/constants/color_constants.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import '/constants/media_constants.dart';

import '../../../constants/text/general_texts.dart';
import '../../../helpers/string_methods.dart';
import 'workout_card.dart';
import '/models/workout_model.dart';

class TabBarViewSection extends StatelessWidget {
  const TabBarViewSection({
    required this.title,
    required this.dataList,
    this.itemsToShow = 3,
    super.key,
  });

  final String title;
  final List<WorkoutModel> dataList;
  final int itemsToShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textWhite,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: [
              ...List.generate(
                dataList.length,
                (index) => WorkoutCard(
                    index: index,
                    listCollection: dataList,
                    title: dataList[index].title,
                    imagePath: dataList[index].image),
              )
            ],
          ),
        )
      ],
    );
  }
}
