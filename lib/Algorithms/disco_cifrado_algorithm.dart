import 'dart:math';
String Disco(String texto, int flag) {
  List discoInterno=List(26);
  List discoInterno2=List(26);
  List discoExterno=List(26);
  List encriptador=List(26);
  List desencriptador=List(26);
  List listaDescifrar=List(26);
  discoInterno[0]='p';discoInterno[1]='l';discoInterno[2]='o';discoInterno[3]='k';
  discoInterno[4]='m';discoInterno[5]='i';discoInterno[6]='j';discoInterno[7]='n';
  discoInterno[8]='u';discoInterno[9]='h';discoInterno[10]='b';discoInterno[11]='y';
  discoInterno[12]='g';discoInterno[13]='v';discoInterno[14]='t';discoInterno[15]='f';
  discoInterno[16]='c';discoInterno[17]='r';discoInterno[18]='d';discoInterno[19]='x';
  discoInterno[20]='e';discoInterno[21]='s';discoInterno[22]='z';discoInterno[23]='w';
  discoInterno[24]='a';discoInterno[25]='q';
  discoInterno2[0]='P';discoInterno2[1]='L';discoInterno2[2]='O';discoInterno2[3]='K';
  discoInterno2[4]='M';discoInterno2[5]='I';discoInterno2[6]='J';discoInterno2[7]='N';
  discoInterno2[8]='U';discoInterno2[9]='H';discoInterno2[10]='B';discoInterno2[11]='Y';
  discoInterno2[12]='G';discoInterno2[13]='V';discoInterno2[14]='T';discoInterno2[15]='F';
  discoInterno2[16]='C';discoInterno2[17]='R';discoInterno2[18]='D';discoInterno2[19]='X';
  discoInterno2[20]='E';discoInterno2[21]='S';discoInterno2[22]='Z';discoInterno2[23]='W';
  discoInterno2[24]='A';discoInterno2[25]='Q';
  discoExterno[0]='a';discoExterno[1]='b';discoExterno[2]='c';discoExterno[3]='d';
  discoExterno[4]='e';discoExterno[5]='f';discoExterno[6]='j';discoExterno[7]='h';
  discoExterno[8]='i';discoExterno[9]='j';discoExterno[10]='k';discoExterno[11]='l';
  discoExterno[12]='m';discoExterno[13]='n';discoExterno[14]='o';discoExterno[15]='p';
  discoExterno[16]='q';discoExterno[17]='r';discoExterno[18]='s';discoExterno[19]='t';
  discoExterno[20]='u';discoExterno[21]='v';discoExterno[22]='w';discoExterno[23]='x';
  discoExterno[24]='y';discoExterno[25]='z';
  String fraseCifrada="",fraseDescifrada="";

  List palabras=texto.split("-");
  int cantidad=palabras.length;
// 		int rand=(int) Math.floor(Math.random()*26);
  int rand=Random().nextInt(26);

//   print(discoInterno);
  int contador=0;
  if(flag==1){
    for(int i=0;i<cantidad;i++) {
      if(contador==0) {
        encriptador=verCifrado(discoInterno,rand);
        fraseCifrada+=discoInterno2[rand]+cifrar(palabras[i],encriptador,discoExterno);
        contador++;
      }else if(contador==3) {
        rand=Random().nextInt(26);
        encriptador=verCifrado(discoInterno,rand);
        fraseCifrada+="-"+discoInterno2[rand]+cifrar(palabras[i],encriptador,discoExterno);
        contador=1;
      }else {
        encriptador=verCifrado(discoInterno,rand);
        fraseCifrada+="-"+cifrar(palabras[i],encriptador,discoExterno);
        contador++;
      }
//			System.out.println(rand);
    }
    return fraseCifrada;
  }else{

    List palabras2=texto.split("-");String fraseDescifrada1="";
    int cantidad2=palabras2.length,verificar=0;
    for(int j=0;j<cantidad2;j++) {
      if(j==0) {
        verificar=1;
        listaDescifrar=listaVerificar(discoInterno2,palabras2[j],discoInterno);
        fraseDescifrada1+=verDescifrado(palabras2[j],listaDescifrar,discoExterno,verificar);
      }else if(j%3==0) {
        verificar=1;
        listaDescifrar=listaVerificar(discoInterno2,palabras2[j],discoInterno);
        fraseDescifrada1+="-"+verDescifrado(palabras2[j],listaDescifrar,discoExterno,verificar);
      }else {
        verificar=0;
        fraseDescifrada1+="-"+verDescifrado(palabras2[j],listaDescifrar,discoExterno,verificar);
      }
    }
    return fraseDescifrada1;
  }



}
List listaVerificar(List discoInterno2,String palabras2,List discoInterno) {
  String letra=palabras2.substring(0,1);List listaDescifrar=List(26);
  for(int i=0;i<discoInterno2.length;i++) {
    if(discoInterno2[i]==letra) {
      listaDescifrar=verCifrado(discoInterno,i);
    }
  }
  return listaDescifrar;
}
String verDescifrado(String palabra,List listaDescifrar,List discoExterno,int verificar) {
  String palabra2="";
  if(verificar==0) {
    for(int i=0;i<palabra.length;i++) {
//				System.out.println(palabra.substring(i,i+1));
      palabra2+=letra2(listaDescifrar, palabra.substring(i,i+1),discoExterno);
    }
  }else {
    for(int i=1;i<palabra.length;i++) {
//				System.out.println(palabra.substring(i,i+1));
      palabra2+=letra2(listaDescifrar, palabra.substring(i,i+1),discoExterno);
    }
  }
  return palabra2;
}
List verCifrado(List discoInterno, int rand) {
  List encriptador=List(26);
  int llenado=0,fin=0;
  llenado=rand;
  for(int i=0;i<(26-rand);i++) {
    encriptador[i]=discoInterno[llenado];
    llenado++;
  }
  fin=26-rand;
  for(int j=0;j<rand;j++) {
    encriptador[fin]=discoInterno[j];
    fin++;
  }
//		System.out.println(encriptador);
  return  encriptador;
}
String cifrar(String palabra,List encriptador,List discoExterno) {
  String frase="";
  for(int i=0;i<palabra.length;i++) {
//			System.out.println(palabra.substring(i,i+1));
    frase+=letra(encriptador, palabra.substring(i,i+1),discoExterno);
  }
  return frase;
}
String letra(List encriptador,String letra,List discoExterno) {
  String fin;String letra2=letra.substring(0,1);int indice=0;
  for(int i=0;i<discoExterno.length;i++) {
    if(letra2==discoExterno[i]) {
      indice=i;
      break;
    }
  }
  fin=encriptador[indice];
  String fin2=fin;
  return fin2;
}
String letra2(List encriptador,String letra,List discoExterno) {
  String fin;String letra2=letra.substring(0,1);int indice=0;
  for(int i=0;i<discoExterno.length;i++) {
    if(letra2==encriptador[i]) {
      indice=i;
      break;
    }
  }
  fin=discoExterno[indice];
  String fin2=fin;
  return fin2;
}