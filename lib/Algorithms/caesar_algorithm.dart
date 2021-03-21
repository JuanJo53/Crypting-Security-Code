import 'dart:math';
String caesar(int numero,String palabra){
  var numeroaux=numero.abs()%26;
  if(numero<0){
    numero=numeroaux*-1;
  }
  else
    numero=numeroaux;
  print(numero);
  String palabraEncriptada="";
  for(int i=0;i<palabra.length;i++){
    int nuevoAscii=palabra.codeUnitAt(i)+numero;
    print(nuevoAscii);
    if(!((palabra.codeUnitAt(i)>64&&palabra.codeUnitAt(i)<91)
        ||(palabra.codeUnitAt(i)>96&&palabra.codeUnitAt(i)<123))){
      palabraEncriptada+=String.fromCharCode(palabra.codeUnitAt(i));
    }
    else if(palabra.substring(i,i+1).toUpperCase()==palabra.substring(i,i+1)){
      if(nuevoAscii<65){
        palabraEncriptada+=String.fromCharCode(91-(65-nuevoAscii));
      }
      else if(nuevoAscii>90){
        palabraEncriptada+=String.fromCharCode(64+(nuevoAscii-90));
      }
      else  palabraEncriptada+=String.fromCharCode(nuevoAscii);
    }
    else{
      if(nuevoAscii<97){
        print("nuevo");
        print(123-97-nuevoAscii);
        palabraEncriptada+=String.fromCharCode(123-(97-nuevoAscii));
      }
      else if(nuevoAscii>122){
        palabraEncriptada+=String.fromCharCode(96+(nuevoAscii-122));
      }
      else  palabraEncriptada+=String.fromCharCode(nuevoAscii);
    }
  }
  return palabraEncriptada;
}