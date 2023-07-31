class GoalCard {
  GoalCard({
    required this.title,
    required this.description,
    required this.id,
  }) {
    idCounter++;
  }
  static int idCounter = 0;
  final String title;
  final String description;
  final int id;

  factory GoalCard.fromJson(jsonString) {
    return GoalCard(
      title: jsonString["title"],
      description: jsonString["description"],
      id: idCounter,
    );
  }
}
