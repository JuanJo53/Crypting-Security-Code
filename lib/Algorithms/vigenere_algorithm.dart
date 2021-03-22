List matriz = [];

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
  print(matriz);
}

String cifra(mensaje, llave){
  String criptograma = " ";
  mensaje = quitaEspacios(mensaje);
  llave = quitaEspacios(llave);

  mensaje = mensaje.toUpperCase();
  llave = llave.toUpperCase();

  print(llave);
  llave = completa(llave,mensaje.length);

  print(llave);

  for(int i = 0; i < mensaje.length; i++){
    print("for");
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

String getCaracter(mensaje, clave){
  int posicionMensaje = 0, posicionClave = 0, indice = 0;
  bool encontrado = false;

  while(indice < 26 && encontrado == false){
    if(matriz[0][indice] == mensaje){
      encontrado = true;
      posicionMensaje = indice;
    }

    indice++;
  }
  encontrado = false;
  indice = 0;
  while(indice<26 && encontrado==false){
    if(matriz[indice][0] == clave){
      encontrado = true;
      posicionClave = indice;
    }
    indice ++;
  }
  return matriz[posicionClave][posicionMensaje];
}