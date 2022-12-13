class KidsList {
  String? group;
  String? key;
  Null? tag;
  String? name;
  String? gender;
  String? pic;
  bool? localOnly;

  KidsList(
      {
        this.group,
        this.key,
        this.tag,
        this.name,
        this.gender,
        this.pic,
        this.localOnly});

  factory KidsList.fromJson(Map<String, dynamic> parsedJson) {
    return KidsList(
      group: parsedJson['group'],
      key: parsedJson['key'],
      tag: parsedJson['tag'],
      name: parsedJson['name'],
      gender: parsedJson['gender'],
      pic: parsedJson['pic'],
      localOnly: parsedJson['localOnly'],
    );
  }
}