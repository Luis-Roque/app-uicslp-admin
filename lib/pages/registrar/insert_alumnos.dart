import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:uicslp_admin/helpers/mostrar_alerta.dart';
import 'package:uicslp_admin/services/auth_service.dart';
import 'package:uicslp_admin/widgets/btn_login.dart';
import 'package:uicslp_admin/widgets/custom_input.dart';

class insertarAlumno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Stack(
        children: [
          Container(
            height: size.height *.45,
            decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                image: AssetImage("assets/images/alumno.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "¡Un nuevo alumno!",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Nota:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Para registrar al nuevo alumno deberá ingresar todos los datos requeridos y poder continuar.",
                      ),
                    ),
                    SizedBox( 
                      width: size.width * .5, // it just take the 50% width
                      //child: SearchBar(),
                    ),
                    SizedBox(height: 13,),
                    Text('Registro \nde alumno', style:  Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900, color: Colors.white),),
                    _Form()
                  ],
                ),
              ),
              ),
          ),
        ],
      )
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}
class __FormState extends State<_Form> {

  final matriculaCtrl = TextEditingController();
  //final String rolCtrl = 'alumno';
  final nombreCtrl = TextEditingController();
  final apCtrl = TextEditingController();
  final amCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final contraCtrl = TextEditingController();
  final carreraCtrl = TextEditingController();
  /* String _opcionSeleccionada = 'LIA';
  List<String> _carrera = ['LIA', 'LD']; */

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    /*final socketService = Provider.of<SocketService>(context); */

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          
          CustomInput(
            icon: Icons.credit_card,
            placeholder: 'Matricula',
            keyboardType: TextInputType.text,
            textControler: matriculaCtrl,
          ),
          /* CustomInput(
            icon: Icons.info_outline,
            placeholder: 'Rol',
            keyboardType: TextInputType.text,
            textControler: rolCtrl,
          ), */
          CustomInput(
            icon: Icons.person_outline,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textControler: nombreCtrl,
          ),
          CustomInput(
            icon: Icons.person_outline,
            placeholder: 'Apellido paterno',
            keyboardType: TextInputType.text,
            textControler: apCtrl,
          ),
          CustomInput(
            icon: Icons.person_outline,
            placeholder: 'Apellido materno',
            keyboardType: TextInputType.text,
            textControler: amCtrl,
          ),
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
          CustomInput(
            icon: Icons.school_outlined,
            placeholder: 'Carrera',
            keyboardType: TextInputType.text,
            textControler: carreraCtrl,
          ),
          
          btnRegistrar(
            text: 'Continuar',
            onPressed: authService.autenticando ? null :()async {
              print(matriculaCtrl);
              //print(rolCtrl);
              print(nombreCtrl);
              print(apCtrl);
              print(amCtrl);
              print(correoCtrl);
              print(contraCtrl);
              print(carreraCtrl);

              final registroOk = await authService.addAlumno(matriculaCtrl.text.trim(),nombreCtrl.text.trim(),apCtrl.text.trim(),amCtrl.text.trim(),correoCtrl.text.trim(), contraCtrl.text.trim(),carreraCtrl.text.trim());
            
              if (registroOk == true){
                Navigator.pushReplacementNamed(context, 'home');
              } else {
                mostrarAlerta(context, 'Registro incorrecto', registroOk);
              }
            },
            ),
        ],
      ),
    );
  }
 //Lista para mostrar en el select
/*   List<DropdownMenuItem<String>> getOpcionesSelect(){
    List<DropdownMenuItem<String>> lista = new List();

    _carrera.forEach((tipo) {
      lista.add(DropdownMenuItem(
          child: Text(tipo),
          value: tipo,
      )
      );
    });
    return lista;

}
  Widget _crearSelect() {
    return Container(
      padding: EdgeInsets.only(top: 5,left: 5,bottom: 5,right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow:<BoxShadow> [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5
                )
              ]
            ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10,),
          Icon(Icons.school_outlined, color: Colors.grey[500],),
          SizedBox(width: 10,),
          Text('Carrera'),
          SizedBox(width: 30.0),
          DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesSelect(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          )
        ],
      ),
    );

 }
 */}


