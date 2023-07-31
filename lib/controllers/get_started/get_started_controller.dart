import 'package:get/get.dart';

import '/models/goal_card_info.dart';

class GetStartedController extends GetxController {
  String rebuildId = "rebuildId";
  Set<GoalCardInfo> checkedCardsIds = {};
  bool anyCardTapped = false;

  // This method is called when user taps on a card
  handleCardTap(GoalCardInfo checkedCard) {
    checkedCardsIds.addIfRemoveElse(
      checkedCard,
      checkedCard.isChecked,
      removeElse: !checkedCard.isChecked,
    );
    // Update card tapped and rebuild widget
    anyCardTapped = checkedCardsIds.isNotEmpty;
    update([rebuildId]);
  }
}

// Custom extension only used here to add / remove card on specific condition
extension ElseMethodExtension<E> on Set<E> {
  void addIfRemoveElse(E item, dynamic condition, {bool removeElse = false}) {
    if (condition is bool && condition) {
      add(item);
    } else if (removeElse) {
      remove(item);
    }
  }
}
