class MyData {
  String? name;
  String? emotion;
  String? selected_play;
  String? kidHeight;
  String? kidWeight;
  String? key;

  MyData({
    this.name,
    this.emotion,
    this.selected_play,
    this.kidHeight,
    this.kidWeight,
    this.key,
  });

  MyData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    emotion = json['emotion'];
    selected_play = json['playing'];
    kidHeight = json['kidHeight'];
    kidWeight = json['kidWeight'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['emotion'] = this.emotion;
    data['selected_play'] = this.selected_play;
    data['kidHeight'] = this.kidHeight;
    data['kidWeight'] = this.kidWeight;
    data['key'] = this.key;
    return data;
  }
}
