import 'package:flutter/material.dart';
import 'package:uicslp_admin/config/Colores.dart';



class insertarComunicado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: uicslpAzul,
              image: DecorationImage(
                image: AssetImage('assets/images/comunicado.png'),
                fit: BoxFit.fitWidth
              )
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
                      "¡Comunicado!",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900,color: uicslpNaranja),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "#Nota",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "A continuación deberá ingresar todos los campos requeridos.",style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox( 
                      width: size.width * .5, // it just take the 50% width
                      //child: SearchBar(),
                    ),
                    SizedBox(height: 30,),
                    Text('Nuevo \ncomunicado', style:  Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900, color: Colors.white),),
                    //FORMULARIO
                  ],
                ),
              ),
              ),
          ),
        ],
      ),
    );
  }
}