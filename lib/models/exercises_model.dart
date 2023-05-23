class ExercisesModel {

  String name;
  String type;
  String muscle;
  String equipment;
  String difficulty;
  String instructions;

  ExercisesModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });
  //internetten gelen model olursa factory kullaniyoz ismizi kolaylastiriyor
  factory ExercisesModel.fromJson(jsonData) {
    return ExercisesModel(
      name: jsonData["name"],
      type: jsonData["type"],
      muscle: jsonData["muscle"],
      equipment: jsonData["equipment"],
      difficulty: jsonData["difficulty"],
      instructions: jsonData["instructions"],
    );
  }
}

