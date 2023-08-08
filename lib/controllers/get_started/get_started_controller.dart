import 'package:get/get.dart';

import '/constants/text/app_texts.dart';
import '/models/goal_card_info.dart';

// Controller for goal cards on get started page
class GetStartedController extends GetxController {
  // Set default state for cards
  Set<GoalCardInfo> checkedCardsIds = {};
  bool anyCardTapped = false;

  String rebuildId = TextConstants.rebuildId;

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
