import 'package:flutter/material.dart';



class insertarHorario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                image: AssetImage('assets/images/horario.png'),
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
                      "¡Un nuevo horario!",
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
                        "Para subir un nuevo horario deberá ingresar todos los datos requeridos.",
                      ),
                    ),
                    SizedBox( 
                      width: size.width * .5, // it just take the 50% width
                      //child: SearchBar(),
                    ),
                    SizedBox(height: 30,),
                    Text('Nuevo \nhorario', style:  Theme.of(context)
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