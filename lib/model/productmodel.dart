class productModel {
  int? id;
  String? placeName;
  String? placeImage;
  String? description;
  String? address;

  productModel(
      {this.id,
        this.placeName,
        this.placeImage,
        this.description,
        this.address});

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeName = json['PlaceName'];
    placeImage = json['PlaceImage'];
    description = json['Description'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PlaceName'] = this.placeName;
    data['PlaceImage'] = this.placeImage;
    data['Description'] = this.description;
    data['Address'] = this.address;
    return data;
  }
}