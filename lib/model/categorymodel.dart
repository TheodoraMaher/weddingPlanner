class categoryModel {
  int? id;
  String? yourEvent;
  String? eventImage;
  bool? complete;

  categoryModel({this.id, this.yourEvent, this.eventImage, this.complete});

  categoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    yourEvent = json['YourEvent'];
    eventImage = json['EventImage'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['YourEvent'] = this.yourEvent;
    data['EventImage'] = this.eventImage;
    data['complete'] = this.complete;
    return data;
  }
}
