class HeightData {
  String? height;
  String? weight;
  String? key;

  HeightData({
    this.height,
    this.weight,
    this.key,
  });

  HeightData.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['key'] = this.key;
    return data;
  }
}
