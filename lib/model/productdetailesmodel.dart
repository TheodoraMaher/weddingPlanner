class productdetailesModel {
  int? id;
  String? placeImage;
  String? title;
  String? flowers;
  String? tablesShape;
  String? chairsShape;
  String? startprice;
  String? endprice;
  String? description;
  int? numberOfPeople;
  int? productN;

  productdetailesModel(
      {this.id,
        this.placeImage,
        this.title,
        this.flowers,
        this.tablesShape,
        this.chairsShape,
        this.startprice,
        this.endprice,
        this.description,
        this.numberOfPeople,
        this.productN});

  productdetailesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeImage = json['PlaceImage'];
    title = json['title'];
    flowers = json['Flowers'];
    tablesShape = json['TablesShape'];
    chairsShape = json['ChairsShape'];
    startprice = json['startprice'];
    endprice = json['endprice'];
    description = json['Description'];
    numberOfPeople = json['number_of_people'];
    productN = json['ProductN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PlaceImage'] = this.placeImage;
    data['title'] = this.title;
    data['Flowers'] = this.flowers;
    data['TablesShape'] = this.tablesShape;
    data['ChairsShape'] = this.chairsShape;
    data['startprice'] = this.startprice;
    data['endprice'] = this.endprice;
    data['Description'] = this.description;
    data['number_of_people'] = this.numberOfPeople;
    data['ProductN'] = this.productN;
    return data;
  }
}
