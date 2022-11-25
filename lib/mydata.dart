class MyData {
  String? emotion;
  String? playing;

  MyData(
      {this.emotion,
      this.playing,
    });

  MyData.fromJson(Map<String, dynamic> json) {
    emotion = json['emotion'];
    playing = json['playing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emotion'] = this.emotion;
    data['playing'] = this.playing;

    return data;
  }
}