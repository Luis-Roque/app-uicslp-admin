import 'package:flutter/material.dart';
import 'package:uicslp_admin/widgets/buscador.dart';



class insertarCalificacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/calificacion.png'),
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
                      "¡Calificaciones!",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "#Nota",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Busca al alumno por su matricula, o puedes buscarlos por grupo.",
                      ),
                    ),
                    SizedBox( 
                      width: size.width * .5, // it just take the 50% width
                      child: Buscador(),
                    ),
                    
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