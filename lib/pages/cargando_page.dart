import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uicslp_admin/pages/home_page.dart';
import 'package:uicslp_admin/pages/login_page.dart';
import 'package:uicslp_admin/services/auth_service.dart';

class cargandoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: verificarLogin(context),
        builder: (context, snapshot){
          return Center(
              child: (Text('CARGANDO...')),
            );
        },
          
      )
    );
  }

  Future verificarLogin( BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    


    final autenticado = await authService.isLoggedIn();

    if( autenticado){
      //Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_,__,___)=> homePage(),
        transitionDuration: Duration(milliseconds: 0)
        )
        );
    } else {
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_,__,___)=> loginPage(),
        transitionDuration: Duration(milliseconds: 0)
        )
        );

    }

  }
}