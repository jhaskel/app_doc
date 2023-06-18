// To parse this JSON data, do
//
//     final setor = setorFromJson(jsonString);

import 'dart:convert';

Setor setorFromJson(String str) => Setor.fromJson(json.decode(str));

String setorToJson(Setor data) => json.encode(data.toJson());

class Setor {
  int id;
  String name;
  String email;
  String responsavel;
  String secretario;
  String sigla;

  Setor({
    required this.id,
    required this.name,
    required this.email,
    required this.responsavel,
    required this.secretario,
    required this.sigla,
  });

  Setor copyWith({
    int? id,
    String? name,
    String? email,
    String? responsavel,
    String? secretario,
    String? sigla,
  }) =>
      Setor(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        responsavel: responsavel ?? this.responsavel,
        secretario: secretario ?? this.secretario,
        sigla: sigla ?? this.sigla,
      );

  factory Setor.fromJson(Map<String, dynamic> json) => Setor(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    responsavel: json["responsavel"],
    secretario: json["secretario"],
    sigla: json["sigla"],
  );

  static List<Setor> fromJsonList(List<dynamic> jsonList) {
    List<Setor> toList = [];

    jsonList.forEach((item) {
      Setor users = Setor.fromJson(item);
      toList.add(users);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "responsavel": responsavel,
    "secretario": secretario,
    "sigla": sigla,
  };
}
