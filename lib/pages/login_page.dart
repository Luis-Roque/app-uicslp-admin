import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uicslp_admin/helpers/mostrar_alerta.dart';
import 'package:uicslp_admin/services/auth_service.dart';
import 'package:uicslp_admin/widgets/btn_login.dart';
import 'package:uicslp_admin/widgets/custom_input.dart';
import 'package:uicslp_admin/widgets/logo.dart';

class loginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'ADMINISTRACIÓN',),
                _Form(),
                
                Text('Términos y condiciones', style: TextStyle(fontWeight: FontWeight.w200),)

                ],
            ),
          ),
        ),
      )
    );
  }
}



class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}
class __FormState extends State<_Form> {

  final correoCtrl = TextEditingController();
   final contraCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    //final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo Institucional',
            keyboardType: TextInputType.emailAddress,
            textControler: correoCtrl,
          ),
           CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            textControler: contraCtrl,
          ),

          btnRegistrar(
            text: 'Ingresar',
            onPressed: authService.autenticando ? null : ()async{
              
              FocusScope.of(context).unfocus();
              final loginOk= await authService.login(correoCtrl.text.trim(), contraCtrl.text.trim());
              
              if (loginOk ){
                //TODO: conectar a nuestro socket server
                //socketService.connect();
                //Navegar a otra pantalla
                Navigator.pushReplacementNamed(context, 'home');
              } else{
                //Mostrar alerta
                mostrarAlerta(context, 'Usuario incorrecto', 'Verifique su correo electrónico y contraseña, por favor!.');
              }
            },
            ),
        ],
      ),
    );
  }
}