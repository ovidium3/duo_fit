// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';

import '/models/goal_card_info.dart';

import 'get_started_controller.dart';

class GoalCardController extends GetxController {
  GoalCardController(this.id);

  bool isTappedDown = false;
  bool isChecked = false;
  bool? previousIsChecked;
  final int id;

  // Update UI / card tap status to true
  void panDownMethod() {
    isTappedDown = true;
    update();
  }

  // Update UI / card tap status to false
  void panEndCancel() {
    isTappedDown = false;
    update();
  }

  void toggleIsChecked() {
    previousIsChecked = isChecked;
    isChecked = !isChecked;
    // Call custom update function
    updateWithCallback(
      Get.find<GetStartedController>().handleCardTap(
        GoalCardInfo(
          id: id,
          isChecked: isChecked,
        ),
      ),
      null,
      previousIsChecked != isChecked,
    );
  }
}

// Custom extension used for triggering UI updates based on ids passed in
extension on GoalCardController {
  void updateWithCallback(
    dynamic callback, [
    List<Object>? ids,
    bool condition = true,
  ]) {
    if (!condition) {
      return;
    }
    callback;

    if (ids == null) {
      refresh();
    } else {
      for (final id in ids) {
        refreshGroup(id);
      }
    }
  }
}
