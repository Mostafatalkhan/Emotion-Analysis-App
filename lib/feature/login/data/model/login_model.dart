class LoginModel {
  dynamic status;
  dynamic message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic image;
  dynamic points;
  dynamic credit;
  dynamic token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.points,
        this.credit,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

}
