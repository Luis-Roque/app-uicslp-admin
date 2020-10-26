// To parse this JSON data, do
//
//     final alumnoResponse = alumnoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:uicslp_admin/models/alumno.dart';

AlumnoResponse alumnoResponseFromJson(String str) => AlumnoResponse.fromJson(json.decode(str));

String alumnoResponseToJson(AlumnoResponse data) => json.encode(data.toJson());

class AlumnoResponse {
    AlumnoResponse({
        this.ok,
        this.alumno,
        this.token,
    });

    bool ok;
    Alumno alumno;
    String token;

    factory AlumnoResponse.fromJson(Map<String, dynamic> json) => AlumnoResponse(
        ok: json["ok"],
        alumno: Alumno.fromJson(json["alumno"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "alumno": alumno.toJson(),
        "token": token,
    };
}

