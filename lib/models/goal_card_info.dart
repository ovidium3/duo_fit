class GoalCardInfo extends Object {
  GoalCardInfo({
    required this.id,
    required this.isChecked,
  });

  final int id;
  final bool isChecked;

  @override
  bool operator ==(Object other) {
    return other is GoalCardInfo && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
