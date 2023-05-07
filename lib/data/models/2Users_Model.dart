class UsersModel {
  String? id;
  String? name;
  String? phone;
  String? country;
  bool? state;

  UsersModel({
    this.id,
    this.name,
    this.phone,
    this.country,
    this.state,
  });
  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
    country = json["country"];
    state = json["state"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'country': country,
      'state': state,
    };
  }
}
