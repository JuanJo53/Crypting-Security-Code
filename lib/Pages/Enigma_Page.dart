import 'package:crypting_security_app/Algorithms/caesar_algorithm.dart';
import 'package:crypting_security_app/Algorithms/enigma_machine.dart';
import 'package:crypting_security_app/Algorithms/vigenere_algorithm.dart';
import 'package:crypting_security_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Enigma_Page extends StatefulWidget {
  Color_Palette _colores;
  Enigma_Page(this._colores);
  @override
  _Enigma_PageState createState() => _Enigma_PageState(_colores);
}

class _Enigma_PageState extends State<Enigma_Page> {
  Color_Palette _colores;
  Size size;
  _Enigma_PageState(this._colores){
    number.text="0.0";
  }
  TextEditingController input=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController output=TextEditingController();
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Input("Ingrese el texto a cifrar",input,TextInputType.text,size.width*0.1),

              Boton("Encriptar"),
              InputArea("Texto Cifrado",output),

            ],
          ),
    );
  }
  void cifrar(){
    setState(() {
      output.text=enigma_algo(input.text);
    });
  }
  Widget Boton(label){
    return Container(
      decoration: BoxDecoration(
        color: _colores.secondColor,
        borderRadius: BorderRadius.circular(size.width*0.05),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.width*0.05)),
        onPressed: (){cifrar();},
        child: Text(label),
      ),
    );
  }
  Widget InputArea(label,input){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
      child: Column(
        children: [
          Text(label),
          SizedBox(
            height: size.height*0.01,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(size.width*0.05))
            ),
            child:
            TextField(
              readOnly: true,
              maxLines: 10,
              controller: input,
              cursorColor: _colores.primaryColor,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _colores.secondColor),
                      borderRadius: BorderRadius.all(Radius.circular(size.width*0.05))),
                  contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.width*0.03),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: _colores.primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(size.width*0.05))
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget Input(label,input,key,margin){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Column(
        children: [
          Text(label,textAlign: TextAlign.center,),
          SizedBox(
            height: size.height*0.01,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(size.width*0.05))
            ),
            child:
            TextField(

              controller: input,
              keyboardType: key,
              cursorColor: _colores.primaryColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _colores.secondColor),
                    borderRadius: BorderRadius.all(Radius.circular(size.width*0.05))),
                contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.03),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: _colores.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(size.width*0.05))
                )
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget InputEnigma(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("1er Rotor"),

            ],
          ),
          Column(
            children: [
              Text("2do Rotor"),

            ],
          ),
          Column(
            children: [
              Text("3er Rotor"),

            ],),
        ],
      ),
    );
  }
}
