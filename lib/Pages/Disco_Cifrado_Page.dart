import 'package:crypting_security_app/Algorithms/disco_cifrado_algorithm.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class DiscoCifradoPage extends StatefulWidget {
  Color_Palette _colores;
  DiscoCifradoPage(this._colores);
  @override
  _DiscoCifradoPageState createState() => _DiscoCifradoPageState(_colores);
}

class _DiscoCifradoPageState extends State<DiscoCifradoPage> {
  Color_Palette _colores;
  Size size;

  _DiscoCifradoPageState(Color_Palette colores);
  TextEditingController cifrar=TextEditingController();
  TextEditingController descifrar=TextEditingController();
  TextEditingController output=TextEditingController();
  double heightAppbar;
  @override
  Widget build(BuildContext context) {
    heightAppbar=Scaffold.of(context).appBarMaxHeight;
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height-heightAppbar-60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Input("Ingrese el texto a cifrar",cifrar,TextInputType.text,size.width*0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Boton("Encriptar"),

                  Boton("Desencriptar"),
                ],
              ),
              InputArea("Texto Cifrado",output),

            ],
          ),
        ),
      ),
    );
  }


  void Cifrar(){
    setState(() {
      output.text=Disco(cifrar.text, 1);
    });
  }

  void Descifrar(){
    setState(() {
      output.text=Disco(cifrar.text, 0);
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
        onPressed: (){
          if(label=="Encriptar"){
            Cifrar();
          }
          else{
            Descifrar();
          }

        },
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
}

