// To parse this JSON data, do
//
//     final documento = documentoFromJson(jsonString);

import 'dart:convert';

Documento documentoFromJson(String str) => Documento.fromJson(json.decode(str));

String documentoToJson(Documento data) => json.encode(data.toJson());

class Documento {
  int id;
  int tipoId;
  int userId;
  String titulo;
  int codigo;
  int ano;
  bool isInterno;
  bool isAtivo;
  DateTime createdAt;
  DateTime updatedAt;

  Documento({
    required this.id,
    required this.tipoId,
    required this.userId,
    required this.titulo,
    required this.codigo,
    required this.ano,
    required this.isInterno,
    required this.isAtivo,
    required this.createdAt,
    required this.updatedAt,
  });

  Documento copyWith({
    int? id,
    int? tipoId,
    int? userId,
    String? titulo,
    int? codigo,
    int? ano,
    bool? isInterno,
    bool? isAtivo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Documento(
        id: id ?? this.id,
        tipoId: tipoId ?? this.tipoId,
        userId: userId ?? this.userId,
        titulo: titulo ?? this.titulo,
        codigo: codigo ?? this.codigo,
        ano: ano ?? this.ano,
        isInterno: isInterno ?? this.isInterno,
        isAtivo: isAtivo ?? this.isAtivo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Documento.fromJson(Map<String, dynamic> json) => Documento(
    id: json["id"],
    tipoId: json["tipoId"],
    userId: json["userId"],
    titulo: json["titulo"],
    codigo: json["codigo"],
    ano: json["ano"],
    isInterno: json["isInterno"],
    isAtivo: json["isAtivo"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
  static List<Documento> fromJsonList(List<dynamic> jsonList) {
    List<Documento> toList = [];

    jsonList.forEach((item) {
      Documento users = Documento.fromJson(item);
      toList.add(users);
    });

    return toList;
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "tipoId": tipoId,
    "userId": userId,
    "titulo": titulo,
    "codigo": codigo,
    "ano": ano,
    "isInterno": isInterno,
    "isAtivo": isAtivo,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
