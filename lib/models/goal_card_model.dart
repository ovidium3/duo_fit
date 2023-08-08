// A class that represents a specific goal card
class GoalCard {
  final String title;
  final String description;
  final int id;

  static int idCounter = 0;

  GoalCard({
    required this.title,
    required this.description,
    required this.id,
  }) {
    idCounter++;
  }

  factory GoalCard.fromJson(jsonString) {
    return GoalCard(
      title: jsonString['title'],
      description: jsonString['description'],
      id: idCounter,
    );
  }
}
