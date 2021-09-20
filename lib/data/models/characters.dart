class Character {
  int charId;
  String name;
  String nickName;
  String image;
  List<dynamic> job;
  String status;
  List<dynamic> appearanceOfSesson;
  String actorName;
  String categoryForTowSeries;
  List<dynamic> betterCall;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    job = json["occupation"];
    status = json["status"];
    appearanceOfSesson = json["appearance"];
    actorName = json["portrayes"];
    categoryForTowSeries = json["category"];
    betterCall = json["better_call_saul_appearance"];
  }
}
