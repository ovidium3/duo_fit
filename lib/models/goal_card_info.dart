// A class that represents a specific goal card's current state
class GoalCardInfo {
  final int id;
  final bool isChecked;

  GoalCardInfo({
    required this.id,
    required this.isChecked,
  });

  @override
  bool operator ==(Object other) {
    return other is GoalCardInfo && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
