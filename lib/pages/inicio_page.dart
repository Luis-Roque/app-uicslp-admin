import 'package:flutter/material.dart';
import 'package:uicslp_admin/config/Colores.dart';
import 'package:uicslp_admin/pages/registrar/calific_alumno.dart';
import 'package:uicslp_admin/pages/registrar/insert_alumnos.dart';
import 'package:uicslp_admin/pages/registrar/insert_comunicado.dart';
import 'package:uicslp_admin/pages/registrar/insert_docentes.dart';
import 'package:uicslp_admin/pages/registrar/insert_grupos.dart';
import 'package:uicslp_admin/pages/registrar/insert_horarios.dart';
import 'package:uicslp_admin/pages/registrar/insert_notificacion.dart';
import 'package:uicslp_admin/pages/registrar/insert_semestres.dart';
import 'package:uicslp_admin/widgets/opciones_card.dart';

class inicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffold,
      body: Stack(
        children: [
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .30,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage("assets/images/notificacion.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Administración \nUICSLP",
                    style: 
                      TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                        )
                  ),
                  SizedBox(height: 95,),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        opcionesCard(
                          titulo: 'Alumnos', 
                          svgAst: "assets/svg/alumnos.svg",
                          onPress: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>insertarAlumno()),
                            );
                          },
                          ),
                        opcionesCard(
                        titulo: 'Docentes', 
                        svgAst: "assets/svg/docentes.svg",
                        onPress: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>insertarDocente()),
                          );
                        },
                        ),
                        opcionesCard(
                        titulo: 'Calificaciones', 
                        svgAst: "assets/svg/calificaciones.svg",
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> insertarCalificacion()),
                          );
                        },
                        ),
                        opcionesCard(
                        titulo: 'Grupos', 
                        svgAst: "assets/svg/grupos.svg",
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> insertarGrupo())
                          );
                        },
                        ),
                        opcionesCard(
                        titulo: 'Horarios', 
                        svgAst: "assets/svg/horarios.svg",
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: 
                            (context)=> insertarHorario())
                          );
                        },
                        ),
                        opcionesCard(
                        titulo: 'Semestres', 
                        svgAst: "assets/svg/semestres.svg",
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>insertarSemestre()));
                        },
                        ),
                        opcionesCard(
                        titulo: 'Notificaciones', 
                        svgAst: "assets/svg/notificaciones.svg",
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> insertarNotificacion()));
                        },
                        ),
                        opcionesCard(
                          titulo: 'Comunicados', 
                          svgAst: "assets/svg/comunicados.svg",
                          onPress: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>insertarComunicado()));
                          },
                          ),
                      ],
                    )
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}