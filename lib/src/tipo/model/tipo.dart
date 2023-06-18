// To parse this JSON data, do
//
//     final tipo = tipoFromJson(jsonString);

import 'dart:convert';

Tipo tipoFromJson(String str) => Tipo.fromJson(json.decode(str));

String tipoToJson(Tipo data) => json.encode(data.toJson());

class Tipo {
  int id;
  int setorId;
  String name;
  String codigo;

  Tipo({
    required this.id,
    required this.setorId,
    required this.name,
    required this.codigo,
  });

  Tipo copyWith({
    int? id,
    int? setorId,
    String? name,
    String? codigo,
  }) =>
      Tipo(
        id: id ?? this.id,
        setorId: setorId ?? this.setorId,
        name: name ?? this.name,
        codigo: codigo ?? this.codigo,
      );

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
    id: json["id"],
    setorId: json["setorId"],
    name: json["name"],
    codigo: json["codigo"],
  );

  static List<Tipo> fromJsonList(List<dynamic> jsonList) {
    List<Tipo> toList = [];

    jsonList.forEach((item) {
      Tipo users = Tipo.fromJson(item);
      toList.add(users);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "setorId": setorId,
    "name": name,
    "codigo": codigo,
  };
}
