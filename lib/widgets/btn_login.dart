import 'package:flutter/material.dart';
import 'package:uicslp_admin/config/Colores.dart';

class btnRegistrar extends StatelessWidget {

  final String text;
  final Function onPressed;

  const btnRegistrar({
    Key key, 
    @required this.text, 
    @required this.onPressed
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            elevation: 2,
            highlightElevation: 5,
            color: uicslpNaranja,
            shape: StadiumBorder(),
            onPressed: this.onPressed,
            child: Container(
              width: double.infinity,
              height: 55,
              child: Center(
                child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
            ),
            );
  }
}