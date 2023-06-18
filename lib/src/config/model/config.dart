// To parse this JSON data, do
//
//     final config = configFromJson(jsonString);

import 'dart:convert';

Config configFromJson(String str) => Config.fromJson(json.decode(str));

String configToJson(Config data) => json.encode(data.toJson());

class Config {
  int id;
  String logo;
  String name;
  String endereco;
  String site;
  String fone;
  String cnpj;
  String email;
  int isAtivo;

  Config({
    required this.id,
    required this.logo,
    required this.name,
    required this.endereco,
    required this.site,
    required this.fone,
    required this.cnpj,
    required this.email,
    required this.isAtivo,
  });

  Config copyWith({
    int? id,
    String? logo,
    String? name,
    String? endereco,
    String? site,
    String? fone,
    String? cnpj,
    String? email,
    int? isAtivo,
  }) =>
      Config(
        id: id ?? this.id,
        logo: logo ?? this.logo,
        name: name ?? this.name,
        endereco: endereco ?? this.endereco,
        site: site ?? this.site,
        fone: fone ?? this.fone,
        cnpj: cnpj ?? this.cnpj,
        email: email ?? this.email,
        isAtivo: isAtivo ?? this.isAtivo,
      );

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    id: json["id"],
    logo: json["logo"],
    name: json["name"],
    endereco: json["endereco"],
    site: json["site"],
    fone: json["fone"],
    cnpj: json["cnpj"],
    email: json["email"],
    isAtivo: json["isAtivo"],
  );
  static List<Config> fromJsonList(List<dynamic> jsonList) {
    List<Config> toList = [];

    jsonList.forEach((item) {
      Config users = Config.fromJson(item);
      toList.add(users);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "name": name,
    "endereco": endereco,
    "site": site,
    "fone": fone,
    "cnpj": cnpj,
    "email": email,
    "isAtivo": isAtivo,
  };
}
