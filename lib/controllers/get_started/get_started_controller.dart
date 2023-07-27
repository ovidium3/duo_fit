import 'package:get/get.dart';

import '/models/checked_get_started_card_info.dart';

class GetStartedController extends GetxController {
  String rebuildId = "rebuildId";
  Set<CheckedCard> checkedCardsIds = {};
  bool anyCardTapped = false;

  // This method is called when user taps on a card
  handelChangeInCheckedCardsList(CheckedCard checkedCard) {
    checkedCardsIds.addIfRemoveElse(
      checkedCard,
      checkedCard.isChecked,
      removeElse: !checkedCard.isChecked,
    );

    anyCardTapped = checkedCardsIds.isNotEmpty;
    update([rebuildId]);
  }
}

extension ElseMethodExtension<E> on Set<E> {
  void addIfRemoveElse(E item, dynamic condition, {bool removeElse = false}) {
    if (condition is bool && condition) {
      add(item);
    } else if (removeElse) {
      remove(item);
    }
  }
}
