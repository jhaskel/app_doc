// To parse this JSON data, do
//
//     final usersCargos = usersCargosFromJson(jsonString);

import 'dart:convert';

UserCargo usersCargosFromJson(String str) => UserCargo.fromJson(json.decode(str));

String usersCargosToJson(UserCargo data) => json.encode(data.toJson());

class UserCargo {
  int id;
  int userId;
  String name;
  bool isAtivo;

  UserCargo({
    required this.id,
    required this.userId,
    required this.name,
    required this.isAtivo,
  });

  UserCargo copyWith({
    int? id,
    int? userId,
    String? name,
    bool? isAtivo,
  }) =>
      UserCargo(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        isAtivo: isAtivo ?? this.isAtivo,
      );

  factory UserCargo.fromJson(Map<String, dynamic> json) => UserCargo(
    id: json["id"],
    userId: json["userId"],
    name: json["name"],
    isAtivo: json["isAtivo"],
  );



  static List<UserCargo> fromJsonList(List<dynamic> jsonList) {
    List<UserCargo> toList = [];

    jsonList.forEach((item) {
      UserCargo users = UserCargo.fromJson(item);
      toList.add(users);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "name": name,
    "isAtivo": isAtivo,
  };
}

