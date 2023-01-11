class EmotionData {
  String? emotion;
  String? selected_play;
  String? key;

  EmotionData({
    this.emotion,
    this.selected_play,
    this.key,
  });

  EmotionData.fromJson(Map<String, dynamic> json) {
    emotion = json['emotion'];
    selected_play = json['playing'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emotion'] = this.emotion;
    data['selected_play'] = this.selected_play;
    data['key'] = this.key;
    return data;
  }
}
