import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:uicslp_admin/config/Colores.dart';

import 'package:uicslp_admin/pages/comunicados_page.dart';
import 'package:uicslp_admin/pages/inicio_page.dart';
import 'package:uicslp_admin/pages/periodos_page.dart';
import 'package:uicslp_admin/services/auth_service.dart';



class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int pageIndex = 0;

  //paginas
  final _inicio = new inicioPage();
  final _periodo = new periodosPage();
  final _comunicado = new comunicadosPage();

  Widget _showPage = new inicioPage();

  Widget _pageElegida(int page){
    switch(page){
      case 0:
        return _inicio;
        break;
      case 1:
        return _periodo;
        break;
      case 2:
        return _comunicado;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.exit_to_app, color: uicslpNaranja), 
        onPressed: (){
          Navigator.pushReplacementNamed(context, 'login');
          AuthService.deleteToken();
        }),
        backgroundColor: uicslpAzul,
        title: Text('Administración'),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.group_add,color: Colors.white, size: 30),
          Icon(Icons.remove_red_eye,color: Colors.white, size: 30),
          Icon(Icons.notifications_active,color: Colors.white, size: 30),
          

        ],
        color: uicslpAzul,
        buttonBackgroundColor: uicslpNaranja,
        backgroundColor: uicslpAzul,
        animationCurve: Curves.easeInOutCirc,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageElegida(tappedIndex);
          });
        },
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        )
    );
      
  }
}