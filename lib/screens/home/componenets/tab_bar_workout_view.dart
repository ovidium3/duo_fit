import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/image_path_constants.dart';

import '../../../constants/text_constants/general_text_constants.dart';
import '../../../helpers/string_methods.dart';
import 'workout_card.dart';

class TabBarViewSection extends StatelessWidget {
  TabBarViewSection({
    required this.title,
    required this.dataList,
    this.itemsToShow = 3,
    this.hasSeeAllButton = true,
    super.key,
  });
  String title;
  List dataList;
  bool hasSeeAllButton;
  int itemsToShow;

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
                color: Colors.white,
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
                itemsToShow < dataList.length ? 3 : dataList.length,
                (index) => WorkoutCard(
                    index: index,
                    listCollection: dataList,
                    title: capitalize(
                      dataList[index]["workOutTitle"] ??
                          TextConstants.somethingWrong,
                    ),
                    imagePath:
                        dataList[index]["imagePath"] ?? ImgSrc.noImgAvailable),
              )
            ],
          ),
        )
      ],
    );
  }
}
