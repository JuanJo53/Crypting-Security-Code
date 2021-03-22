import 'package:crypting_security_app/colors.dart';
import 'package:flutter/material.dart';

class Vigenere_Page extends StatefulWidget{
  Color_Palette _colores;
  Vigenere_Page(this._colores);
  @override
  _Vigenere_PageState createState() => _Vigenere_PageState(_colores);

}

class _Vigenere_PageState extends State<Vigenere_Page>{
  Color_Palette _colores;
  Size size;
  _Vigenere_PageState(this._colores){
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(
          "Hola"
        ),
      ),
    );
  }

}