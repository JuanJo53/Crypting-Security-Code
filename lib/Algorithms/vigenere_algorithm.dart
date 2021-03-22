List matriz = [];
// void main(){
//   String mensaje = "Encriptado por vigenere".trim();
//   String llave = "criptii".trim();
//
//   Vigenere();
//   String cripto = cifra(mensaje, llave).trim().toLowerCase();
//   print(cripto);
//   print(descifra(cripto, llave).trim().toLowerCase());
//   //print(quitaEspacios(mensaje));
//   //print(mensaje.length);
// }
String encripta(mensaje, llave){
  mensaje = mensaje.trim();
  llave = llave.trim();

  Vigenere();
  return cifra(mensaje, llave).trim().toLowerCase();
}

String desencripto(mensaje, llave){
  mensaje = mensaje.trim();
  llave = llave.trim();

  Vigenere();
  return descifra(mensaje, llave).trim().toLowerCase();
}

Vigenere(){
  int codigo=65;
  int interno=0;
  for(int i=0;i<26;i++){
    interno=codigo;
    List newRow = List();
    for(int j=0;j<26;j++){
      //matriz[i][j]=interno;
      newRow.add(interno);
      interno++;
      if(interno>90){
        interno=65;
      }
    }
    matriz.add(newRow);
    codigo++;
    if(codigo>90){
      codigo=65;
    }
  }
}

String cifra(mensaje, llave){
  String criptograma = " ";
  mensaje = quitaEspacios(mensaje);
  llave = quitaEspacios(llave);

  mensaje = mensaje.toUpperCase();
  llave = llave.toUpperCase();
  print(mensaje);
  llave = completa(llave,mensaje.length);
  print(llave);

  for(int i = 0; i < mensaje.length; i++){
    criptograma += getCaracter(mensaje.substring(i, i+1), llave.substring(i, i+1));
  }
  return criptograma;
}

String quitaEspacios(cadena){
  String auxiliar = cadena;
  cadena = "";
  for(int i=0;i<auxiliar.length;i++){
    if(auxiliar[i]!=' '){
      cadena+=auxiliar[i];
    }
  }
  return cadena;
}

String completa(String cadena,int tamano){
  int diferencia = 0, indice = 0;
  if(cadena.length != tamano){
    if(cadena.length < tamano){
      diferencia = tamano - cadena.length;
      while(diferencia != 0){
        cadena += cadena.substring(indice, indice+1);
        if(indice == (cadena.length-1)){
          indice =-1;
        }
        indice++;
        diferencia--;
      }
    } else {
      diferencia = cadena.length - tamano;
      cadena = cadena.substring(0, cadena.length - diferencia);
    }
  }

  return cadena;
}

String getCaracter(mensaje,clave){
  int posicionMensaje=0,posicionClave=0,indice=0;
  bool encontrado=false;
  while(indice<26 && encontrado==false){
    if(matriz[0][indice]==mensaje.codeUnitAt(0)){
      encontrado=true;
      posicionMensaje=indice;
    }
    indice++;
  }
  encontrado=false;
  indice=0;
  while(indice<26 && encontrado==false){
    if (matriz[indice][0]==clave.codeUnitAt(0)){
      encontrado=true;
      posicionClave=indice;
    }
    indice++;
  }
  return String.fromCharCode(matriz[posicionClave][posicionMensaje]);
}

String descifra(mensaje, clave){
  String criptograma=" ";
  mensaje=quitaEspacios(mensaje);
  clave=quitaEspacios(clave);
  mensaje=mensaje.toUpperCase();
  clave=clave.toUpperCase();
  clave=completa(clave,mensaje.length);
  for(int i=0;i<mensaje.length;i++){
    criptograma+=getCaracterDescifrado(mensaje.substring(i, i+1),clave.substring(i, i+1));
  }
  return criptograma;
}

String getCaracterDescifrado(cripto, clave){
  int posicionMensaje=0,posicionClave=0,indice=0;
  bool encontrado=false;
  while(indice<26 && encontrado==false){
    if(matriz[0][indice]==clave.codeUnitAt(0)){
      encontrado=true;
      posicionClave=indice;
    }
    indice++;
  }
  encontrado=false;
  indice=0;
  while(indice<26 && encontrado==false){
    if (matriz[indice][posicionClave]==cripto.codeUnitAt(0)){
      encontrado=true;
      posicionMensaje=indice;
    }
    indice++;
  }
  return String.fromCharCode(matriz[0][posicionMensaje]);
}