enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class MealModels {
  const MealModels({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return "simple";
      case Complexity.challenging:
        return "challenging";
      case Complexity.hard:
        return "hard";
      default:
        return "Unknown";
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.affordable:
        return "affordable";
      case Affordability.luxurious:
        return "luxurious";
      case Affordability.pricey:
        return "pricey";

      default:
        return "Unknown";
    }
  }
}
