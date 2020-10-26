import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:uicslp_admin/global/enviroment.dart';
import 'package:uicslp_admin/models/alumno.dart';
import 'package:uicslp_admin/models/alumno_response.dart';
import 'package:uicslp_admin/models/login_response.dart';
import 'package:uicslp_admin/models/usuario.dart';

class AuthService with ChangeNotifier{
  Usuario usuario;
  Alumno alumno;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;
  set autenticando ( bool valor ){
    this._autenticando = valor;
    notifyListeners();
  }
  //geters del token de forma estática
  static Future<String> getToken()async{
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }
  static Future<void> deleteToken()async{
     final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token'); 
    
  }

  Future<bool> login (String email, String contra)async{

    this.autenticando = true;
  
    final data = {
      'correo': email,
      'contra': contra
    };

    final resp = await http.post('${Enviroment.apiUrl}/uicslp/admin/',
    body: jsonEncode(data),
    headers: {
      'Content-Type': 'application/json'
      }
    );
    this.autenticando = false;
    
    if (resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      
      return true; 
    }else{
      return false;
    }
  }
  
  Future addAlumno (String matricula,String nombre,String ap,String am,String email, String contra, String carrera)async{
    this.autenticando = true;
    final data = {
      "matricula":matricula,
      "rol":"alumno",
      "nombre":nombre,
      "ap":ap,
      "am":am,
      "correo":email,
      "contra":contra,
      "Carrera_id":carrera
    };
    
    final resp = await http.post('${Enviroment.apiUrl}/uicslp/add',
    body: jsonEncode(data),
    headers: {
      'Content-Type': 'application/json'}
    );
    print(resp.body);
    this.autenticando = false;


    if(resp.statusCode == 200){
      final alumnoRegistrado= alumnoResponseFromJson(resp.body);
      this.alumno = alumnoRegistrado.alumno;
   return true;
    } else{
      final  respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }
  Future<bool> isLoggedIn() async {

    final token = await this._storage.read(key: 'token');
    print(token);
    final resp = await http.get('${Enviroment.apiUrl}/uicslp/renew/admin',
    
    headers: {
      'Content-Type': 'application/json',
      'x-token': token
      }
    );
    
    
    if(resp.statusCode == 200){
      final loginResponse= loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      return true;
      } else{
        this.logout();
        return false;
      }

  }

  Future _guardarToken(String token) async{
    
    return await _storage.write(key: 'token', value: token);
  }
  Future logout()async{
    //borrar token
    await _storage.delete(key: 'token');
  }
}