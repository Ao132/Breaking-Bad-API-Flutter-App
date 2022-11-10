class Character {
  late int charId;
  late String name;
  late List<dynamic> jobs;
  late String image;
  late String statusIfDeadOrAlive;
  late String nickname;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    jobs = json["occupation"];
    image = json["img"];
    statusIfDeadOrAlive = json["status"];
    nickname = json["nickname"];
    appearanceOfSeasons = json["appearance"];
    actorName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }
}
