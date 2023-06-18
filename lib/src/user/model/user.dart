// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  int? role;
  String? image;
  String? fone;
  int? setorId;
  String? matricula;
  String? cargo;
  String? token;
  String? forget;
  bool? isAtivo;


  User({
     this.id,
     this.name,
     this.email,
     this.password,
     this.role,
     this.image,
     this.fone,
     this.setorId,
     this.matricula,
     this.cargo,
     this.token,
     this.forget,
     this.isAtivo,

  });



  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    image: json["image"],
    fone: json["fone"],
    setorId: json["setorId"],
    matricula: json["matricula"],
    cargo: json["cargo"],
    token: json["token"],
    forget: json["forget"],
    isAtivo: json["isAtivo"],

  );

  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> toList = [];

    jsonList.forEach((item) {
      User users = User.fromJson(item);
      toList.add(users);
    });

    return toList;
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "role": role,
    "image": image,
    "fone": fone,
    "setorId": setorId,
    "matricula": matricula,
    "cargo": cargo,
    "token": token,
    "forget": forget,
    "isAtivo": isAtivo,

  };
  Map<String, dynamic> toJsonRegister() => {

    "name": name,
    "email": email,
    "password": password,



  };



  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  bool isEqual(User model) {
    return this.id == model.id;
  }

  @override
  String toString() => name!;
}

