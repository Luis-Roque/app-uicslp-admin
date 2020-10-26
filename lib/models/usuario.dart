// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.id,
        this.matricula,
        this.nombre,
        this.correo,
        this.contra,
    });

    int id;
    String matricula;
    String nombre;
    String correo;
    String contra;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        matricula: json["matricula"],
        nombre: json["nombre"],
        correo: json["correo"],
        contra: json["contra"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "matricula": matricula,
        "nombre": nombre,
        "correo": correo,
        "contra": contra,
    };
}
