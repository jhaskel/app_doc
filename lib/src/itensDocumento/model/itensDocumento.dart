// To parse this JSON data, do
//
//     final iItensDocumento = iItensDocumentoFromJson(jsonString);

import 'dart:convert';

ItensDocumento iItensDocumentoFromJson(String str) => ItensDocumento.fromJson(json.decode(str));

String iItensDocumentoToJson(ItensDocumento data) => json.encode(data.toJson());

class ItensDocumento {
  int id;
  int documentoId;
  String titulo;
  String quantidade;
  String unidade;
  dynamic anexo;
  bool isAtivo;
  DateTime createdAt;
  DateTime updatedAt;

  ItensDocumento({
    required this.id,
    required this.documentoId,
    required this.titulo,
    required this.quantidade,
    required this.unidade,
    this.anexo,
    required this.isAtivo,
    required this.createdAt,
    required this.updatedAt,
  });

  ItensDocumento copyWith({
    int? id,
    int? documentoId,
    String? titulo,
    String? quantidade,
    String? unidade,
    dynamic anexo,
    bool? isAtivo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ItensDocumento(
        id: id ?? this.id,
        documentoId: documentoId ?? this.documentoId,
        titulo: titulo ?? this.titulo,
        quantidade: quantidade ?? this.quantidade,
        unidade: unidade ?? this.unidade,
        anexo: anexo ?? this.anexo,
        isAtivo: isAtivo ?? this.isAtivo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ItensDocumento.fromJson(Map<String, dynamic> json) => ItensDocumento(
    id: json["id"],
    documentoId: json["documentoId"],
    titulo: json["titulo"],
    quantidade: json["quantidade"],
    unidade: json["unidade"],
    anexo: json["anexo"],
    isAtivo: json["isAtivo"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  static List<ItensDocumento> fromJsonList(List<dynamic> jsonList) {
    List<ItensDocumento> toList = [];

    jsonList.forEach((item) {
      ItensDocumento users = ItensDocumento.fromJson(item);
      toList.add(users);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "documentoId": documentoId,
    "titulo": titulo,
    "quantidade": quantidade,
    "unidade": unidade,
    "anexo": anexo,
    "isAtivo": isAtivo,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
