String enigma(String plaintext, String rotor1, String rotor2, String rotor3, String refl, String ringS, String ringP, String plugB) {
  var LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var rotors = ("I","II","III");
  var reflector = "UKW-B";
  var ringSettings ="AAC";
  var ringPositions = "DEF" ;
  var plugboard = "AT BS DE FM IR KN LZ OW PV XY";
  
  encode(plaintext);
}


void encode(plaintext){
  var rotors, reflector,ringSettings,ringPositions,plugboard;
  //Enigma Rotors and reflectors
  var rotor1 = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
  var rotor1Notch = "Q";
  var rotor2 = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
  var rotor2Notch = "E";
  var rotor3 = "BDFHJLCPRTXVZNYEIWGAKMUSQO";
  var rotor3Notch = "V";
  var rotor4 = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
  var rotor4Notch = "J";
  var rotor5 = "VZBRGITYUPSDNHLXAWMJQOFECK";
  var rotor5Notch = "Z";

  var rotorDict = {"I":rotor1,"II":rotor2,"III":rotor3,"IV":rotor4,"V":rotor5};
  var rotorNotchDict = {"I":rotor1Notch,"II":rotor2Notch,"III":rotor3Notch,"IV":rotor4Notch,"V":rotor5Notch};

  var reflectorB = {"A":"Y","Y":"A","B":"R","R":"B","C":"U","U":"C","D":"H","H":"D","E":"Q","Q":"E","F":"S","S":"F","G":"L","L":"G","I":"P","P":"I","J":"X","X":"J","K":"N","N":"K","M":"O","O":"M","T":"Z","Z":"T","V":"W","W":"V"};
  var reflectorC = {"A":"F","F":"A","B":"V","V":"B","C":"P","P":"C","D":"J","J":"D","E":"I","I":"E","G":"O","O":"G","H":"Y","Y":"H","K":"R","R":"K","L":"Z","Z":"L","M":"X","X":"M","N":"W","W":"N","Q":"T","T":"Q","S":"U","U":"S"};

  var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var rotorANotch = false;
  var rotorBNotch = false;
  var rotorCNotch = false;

  if(reflector=="UKW-B"){
    var reflectorDict=reflectorB;
  }else{
    var reflectorDirt = reflectorC;
  }

  var rotorA = rotorDict[rotors[0]];
  var rotorB = rotorDict[rotors[1]];
  var rotorC = rotorDict[rotors[2]];
  // rotorANotch = rotorNotchDict[rotors[0]];
  // rotorBNotch = rotorNotchDict[rotors[1]];
  // rotorCNotch = rotorNotchDict[rotors[2]];

  var rotorALetter = ringPositions[0];
  var rotorBLetter = ringPositions[1];
  var rotorCLetter = ringPositions[2];

  var rotorASetting = ringSettings[0];
  var offsetASetting = alphabet.index(rotorASetting);
  var rotorBSetting = ringSettings[1];
  var offsetBSetting = alphabet.index(rotorBSetting);
  var rotorCSetting = ringSettings[2];
  var offsetCSetting = alphabet.index(rotorCSetting);

  rotorA = caesarShift(rotorA,offsetASetting);
  rotorB = caesarShift(rotorB,offsetBSetting);
  rotorC = caesarShift(rotorC,offsetCSetting);

  if (offsetASetting>0){
    rotorA = rotorA[26-offsetASetting:] + rotorA[0:26-offsetASetting];
  }
  if (offsetBSetting>0){
    rotorB = rotorB[26-offsetBSetting:] + rotorB[0:26-offsetBSetting];
  }
  if (offsetCSetting>0){
    rotorC = rotorC[26-offsetCSetting:] + rotorC[0:26-offsetCSetting];
  }
  var ciphertext = "";

  //Converplugboard settings into a dictionary
  var plugboardConnections = plugboard.upper().split(" ");
  var plugboardDict = {};

}


String caesarShift(str,amount){
  var output="";
  for (var i = 0; i < str.length; i++) {
    var c=str[i];
    var code=str.codeUnitAt(i);
    if((code>=65)&&(code<=90)){
      c=String.fromCharCode(((code - 65 + amount) % 26) + 65);
    }
    output = output + c;
  }
  return output;
}