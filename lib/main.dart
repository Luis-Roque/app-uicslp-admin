import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uicslp_admin/routes/routes.dart';
import 'package:uicslp_admin/services/auth_service.dart';

import 'config/Colores.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ )=> AuthService()),
      ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Administración UICSLP',
        initialRoute: 'cargando',
        routes: appRoutes,
        theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        ),
      ),
    );
  }
}