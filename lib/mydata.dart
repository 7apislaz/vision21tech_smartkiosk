class MyData {
  String? emotion;
  String? playing;
  String? kidHeight;
  String? kidWeight;

  MyData({
    this.emotion,
    this.playing,
    this.kidHeight,
    this.kidWeight,
  });

  MyData.fromJson(Map<String, dynamic> json) {
    emotion = json['emotion'];
    playing = json['playing'];
    kidHeight = json['kidHeight'];
    kidWeight = json['kidWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emotion'] = this.emotion;
    data['playing'] = this.playing;
    data['kidHeight'] = this.kidHeight;
    data['kidWeight'] = this.kidWeight;

    return data;
  }
}
