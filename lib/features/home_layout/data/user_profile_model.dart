class ProfileModel {
  String? sId;
  String? username;
  String? phone;
  String? role;
  int? charge;
  int? code;

  ProfileModel(
      {this.sId, this.username, this.phone, this.role, this.charge, this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    phone = json['phone'];
    role = json['role'];
    charge = json['charge'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['charge'] = this.charge;
    data['code'] = this.code;
    return data;
  }
}
