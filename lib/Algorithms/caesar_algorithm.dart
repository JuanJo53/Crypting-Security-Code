
String caesar(int numero,String palabra){
  numero=numero%26;
  print(numero);
  String palabraEncriptada="";
  for(int i=0;i<palabra.length;i++){
    int nuevoAscii=palabra.codeUnitAt(i)+numero;
    if(!((palabra.codeUnitAt(i)>64&&palabra.codeUnitAt(i)<91)
        ||(palabra.codeUnitAt(i)>96&&palabra.codeUnitAt(i)<123))){
      palabraEncriptada+=String.fromCharCode(palabra.codeUnitAt(i));
    }
    else if(palabra.substring(i,i+1).toUpperCase()==palabra.substring(i,i+1)){
      if(nuevoAscii<65){
        palabraEncriptada+=String.fromCharCode(91+numero);
      }
      else if(nuevoAscii>90){
        palabraEncriptada+=String.fromCharCode(64+numero);
      }
      else  palabraEncriptada+=String.fromCharCode(nuevoAscii);
    }
    else{
      if(nuevoAscii<97){
        palabraEncriptada+=String.fromCharCode(123+numero);
      }
      else if(nuevoAscii>122){
        palabraEncriptada+=String.fromCharCode(96+numero);
      }
      else  palabraEncriptada+=String.fromCharCode(nuevoAscii);
    }
  }
  return palabraEncriptada;
}