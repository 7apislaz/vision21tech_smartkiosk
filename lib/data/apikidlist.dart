class KidsList {
  String? group;
  String? key;
  Null? tag;
  String? name;
  String? gender;
  String? pic;
  bool? localOnly;

  KidsList(
      {this.group,
        this.key,
        this.tag,
        this.name,
        this.gender,
        this.pic,
        this.localOnly});

  KidsList.fromJson(Map<String, dynamic> json) {
    group = json['group'];
    key = json['key'];
    tag = json['tag'];
    name = json['name'];
    gender = json['gender'];
    pic = json['pic'];
    localOnly = json['local_only'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group'] = this.group;
    data['key'] = this.key;
    data['tag'] = this.tag;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['pic'] = this.pic;
    data['local_only'] = this.localOnly;
    return data;
  }
}