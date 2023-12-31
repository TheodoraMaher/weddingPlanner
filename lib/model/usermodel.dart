class user {
  int? id;
  String? name;
  String? email;
  String? password;
  String? address;
  String? gender;
  String? age;

  user(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.address,
        this.gender,
        this.age});

  user.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    email = json['Email'];
    password = json['Password'];
    address = json['Address'];
    gender = json['Gender'];
    age = json['Age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['Age'] = this.age;
    return data;
  }
}
