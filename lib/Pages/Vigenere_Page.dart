import 'package:crypting_security_app/Algorithms/vigenere_algorithm.dart';
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
  TextEditingController input=TextEditingController();
  TextEditingController llave=TextEditingController();
  TextEditingController output=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
              Input("Ingrese el texto a cifrar",input,TextInputType.text,size.width*0.1),
              Input("Ingrese la llave",llave,TextInputType.text,size.width*0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Boton("Encriptar"),
                  Boton("Desencriptar"),
                  Boton("Limpiar"),
                ],
              ),
              InputArea("Texto Cifrado",output),

            ],
          ),
        ),
      ),
    );
  }
  void cifrar(){
    setState(() {
      output.text=encripta(input.text, llave.text);
    });
  }
  void descifrar(){
    setState(() {
      output.text=desencripto(input.text, llave.text);
    });
  }
  void limpiar(){
    setState(() {
      output.text="";
      llave.text="";
      input.text="";
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
            cifrar();
          }
          else if(label == "Desencriptar"){
            descifrar();
          } else {
            limpiar();
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