
class LoginResponseModel {
  String name;
  String pass;
  String avatar;
  String id;
  bool success;
  String status;

  LoginResponseModel({
    this.status, this.id, this.avatar, this.name,
});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(status:json["status"] != null ? json["status"] : "", name:json["userData"]["name"] != null ? json["userData"]["name"] : ""
    ,id:json["userData"]["_id"] != null ? json["userData"]["_id"] :""
      );
  }

}
class SignupResponseModel {
  String token;

  SignupResponseModel({
    this.token,

  });

  // factory SignupResponseModel.fromJson(Map<String, dynamic> json){
  //   return SignupResponseModel(token:json["token"] != null ? json["token"] : "");
  // }
  factory SignupResponseModel.fromCheck(String json){
    return SignupResponseModel(token:json);
  }

}

class LoginRequestModel {
  String email;
  String pass;

  LoginRequestModel({
    this.email,
    this.pass,
});
  Map<String,dynamic> toJson() {
    Map<String,dynamic> map  = {
      'email': email.trim(),
      'pass':pass.trim(),
    };
    return map;
  }

}

class SignupRequestModel {
  String email;
  String pass;
  String name;

  SignupRequestModel({
    this.email,
    this.pass,
    this.name,
  });
  Map<String,dynamic> toJson() {
    Map<String,dynamic> map  = {
      'email': email.trim(),
      'pass':pass.trim(),
      'name': name.trim(),
    };
    return map;
  }
  Map<String,dynamic> toJson_Check() {
    Map<String,dynamic> map  = {
      'email': email.trim(),
    };
    return map;
  }
}