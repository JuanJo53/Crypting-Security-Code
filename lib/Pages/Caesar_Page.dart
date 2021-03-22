import 'package:crypting_security_app/Algorithms/caesar_algorithm.dart';
import 'package:crypting_security_app/Algorithms/vigenere_algorithm.dart';
import 'package:crypting_security_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Caesar_Page extends StatefulWidget {
  Color_Palette _colores;
  Caesar_Page(this._colores);
  @override
  _Caesar_PageState createState() => _Caesar_PageState(_colores);
}

class _Caesar_PageState extends State<Caesar_Page> {
  Color_Palette _colores;
  Size size;
  _Caesar_PageState(this._colores){
    number.text="0.0";
  }
  TextEditingController input=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController output=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Input("Ingrese el texto a cifrar",input,TextInputType.text,size.width*0.1),
              InputSlider("Ingrese la cantidad a recorrer",number,TextInputType.number,size.width*0.1),
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
    );
  }
  void cifrar(){
    setState(() {
      print(number.text);
      output.text=caesar(double.parse(number.text).toInt(), input.text);
    });
  }
  void descifrar(){
    setState(() {
      print(number.text);
      output.text=caesar(double.parse(number.text).toInt()*-1, input.text);
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
          else{
            descifrar();
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
  Widget InputSlider(label,input,key,margin){
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
            child:TextField(
              readOnly: true,
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

          ),
          FlutterSlider(
            values: [double.parse(number.text)],

            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                color: _colores.primaryColor.withOpacity(0.8)
              )
            ),
            max: 30,

            tooltip: FlutterSliderTooltip(
              disabled: true
            ),
            min: -30,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                number.text=lowerValue.toString();
              });
            },
          )
        ],
      ),
    );
  }
}
