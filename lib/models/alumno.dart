// To parse this JSON data, do
//
//     final alumno = alumnoFromJson(jsonString);

import 'dart:convert';

Alumno alumnoFromJson(String str) => Alumno.fromJson(json.decode(str));

String alumnoToJson(Alumno data) => json.encode(data.toJson());

class Alumno {
    Alumno({
        this.matricula,
        this.rol,
        this.nombre,
        this.ap,
        this.am,
        this.correo,
        this.contra,
        this.carreraId,
    });

    String matricula;
    String rol;
    String nombre;
    String ap;
    String am;
    String correo;
    String contra;
    String carreraId;

    factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        matricula: json["matricula"],
        rol: json["rol"],
        nombre: json["nombre"],
        ap: json["ap"],
        am: json["am"],
        correo: json["correo"],
        contra: json["contra"],
        carreraId: json["Carrera_id"],
    );

    Map<String, dynamic> toJson() => {
        "matricula": matricula,
        "rol": rol,
        "nombre": nombre,
        "ap": ap,
        "am": am,
        "correo": correo,
        "contra": contra,
        "Carrera_id": carreraId,
    };
}
