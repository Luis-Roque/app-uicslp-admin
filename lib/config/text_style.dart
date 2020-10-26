import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uicslp_admin/config/Colores.dart';

// Estilos de titulos
var titleGeneral = GoogleFonts.pacifico(fontWeight: FontWeight.w400, color: tituloColor, fontSize: 25);
var titulo1 = GoogleFonts.cairo(fontWeight: FontWeight.w900, fontSize: 35);
var subTitulo = GoogleFonts.cairo(fontWeight: FontWeight.bold);
var desc = GoogleFonts.cairo();


var titleNav =  GoogleFonts.inter(fontWeight: FontWeight.w400, color: backgroundColor, fontSize: 20);
var subtitleNav = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 10, color: backgroundColor);

var titleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: tituloColor, fontSize: 16);

// Estilos de subtitulo pequeño
var subTitle5Style = GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w700, color: uicslpAzul);


// Estilos de las publicaciones
var publicTitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: uicslpNaranja,
);
var publicSubtitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 10,
  color: subTitlePublic,
);

// Estilos de las carreras
var carreraTitleStyle = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w900, color: backgroundColor);
var carreraDescripStyle = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: tituloColor);
var subtitleCarreraStyle = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: uicslpAzul);
var titleMaterias = TextStyle(fontWeight: FontWeight.w800,fontSize: 14,color: uicslpNaranja ); //blueGrey
var carreraDesc = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: subTitlePublic);


// Estilos de la seccion de usuarios
var usuarioTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, fontSize: 12, color: tituloColor);
var usuarioSubtitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 10, color: subtituloColor);