import 'package:flutter/material.dart';
import 'package:uicslp_admin/pages/cargando_page.dart';
import 'package:uicslp_admin/pages/home_page.dart';
import 'package:uicslp_admin/pages/login_page.dart';



final Map<String, Widget Function(BuildContext)> appRoutes ={

  'home'    : ( _ )=>homePage(),
  'cargando': ( _ )=> cargandoPage(),
  'login'   : ( _ )=>loginPage()

};