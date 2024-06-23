class ChangePasswordModel
{
  bool? status;
  String? message;
  Data? data;

  ChangePasswordModel({
    this.status,
    this.message,
    this.data,
});

  ChangePasswordModel.fromJson(dynamic json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] !=null?new Data.fromJson(json['data']):null;
  }
}
class Data
{
  String? email;
  Data({
    this.email,
});
  Data.fromJson(dynamic json)
  {
    email=json['email'];
  }
}