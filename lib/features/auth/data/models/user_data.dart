class UserDataModel {
  User? user;
  String? token;

  UserDataModel({this.user, this.token});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? phone;
  String? password;
  String? role;
  int? charge;
  int? code;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.username,
        this.phone,
        this.password,
        this.role,
        this.charge,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    charge = json['charge'];
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['role'] = this.role;
    data['charge'] = this.charge;
    data['code'] = this.code;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
