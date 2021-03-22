/*String enigma(String plaintext, String rotor1, String rotor2, String rotor3, String refl, String ringS, String ringP, String plugB) {

  print(encode(plaintext));
}*/


String enigma_algo(plaintext){
  var LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var rotors = ["I","II","III"];
  var reflector = "UKW-B";
  var ringSettings ="ABC";
  var ringPositions = "DEF" ;
  var plugboard = "AT BS DE FM IR KN LZ OW PV XY";
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
  var rotorANotch;
  var rotorBNotch;
  var rotorCNotch;
  var reflectorDict;
  if(reflector=="UKW-B"){
    reflectorDict=reflectorB;
  }else{
    reflectorDict = reflectorC;
  }

  var rotorA = rotorDict[rotors[0]];
  var rotorB = rotorDict[rotors[1]];
  var rotorC = rotorDict[rotors[2]];
  rotorANotch = rotorNotchDict[rotors[0]];
  rotorBNotch = rotorNotchDict[rotors[1]];
  rotorCNotch = rotorNotchDict[rotors[2]];

  var rotorALetter = ringPositions[0];
  var rotorBLetter = ringPositions[1];
  var rotorCLetter = ringPositions[2];

  var rotorASetting = ringSettings[0];
  var offsetASetting = alphabet.indexOf(rotorASetting);
  var rotorBSetting = ringSettings[1];
  var offsetBSetting = alphabet.indexOf(rotorBSetting);
  var rotorCSetting = ringSettings[2];
  var offsetCSetting = alphabet.indexOf(rotorCSetting);

  rotorA = caesarShift(rotorA,offsetASetting);
  rotorB = caesarShift(rotorB,offsetBSetting);
  rotorC = caesarShift(rotorC,offsetCSetting);
  if (offsetASetting>0){
    rotorA = rotorA.substring(26-offsetASetting,rotorA.length) + rotorA.substring(0,26-offsetASetting);
  }
  if (offsetBSetting>0){
    rotorB = rotorB.substring(26-offsetBSetting,rotorB.length) + rotorB.substring(0,26-offsetBSetting);
  }
  if (offsetCSetting>0){
    rotorC = rotorC.substring(26-offsetCSetting,rotorC.length) + rotorC.substring(0,26-offsetCSetting);
  }
  var ciphertext = "";

  //Converplugboard settings into a dictionary
  var plugboardConnections = plugboard.toUpperCase().split(" ");
  var plugboardDict = {};

  for (var pair in plugboardConnections){
    if(pair.length==2){
      plugboardDict[pair[0]] = pair[1];
      plugboardDict[pair[1]] = pair[0];
    }
  }
  plaintext = plaintext.toUpperCase();

  plaintext.runes.forEach((int rune) {
    var letter=new String.fromCharCode(rune);
    var encryptedLetter = letter;
    if (alphabet.contains(letter)){
      //Rotate Rotors - This happens as soon as a key is pressed, before encrypting the letter!
      var rotorTrigger = false;
      //Third rotor rotates by 1 for every key being pressed
      if (rotorCLetter == rotorCNotch){
        rotorTrigger = true;
      }
      rotorCLetter = alphabet[(alphabet.indexOf(rotorCLetter) + 1) % 26];
      //Check if rotorB needs to rotate
      if (rotorTrigger){
        rotorTrigger = false;
        if (rotorBLetter == rotorBNotch){
          rotorTrigger = true;
        }
        rotorBLetter = alphabet[(alphabet.indexOf(rotorBLetter) + 1) % 26];
        //Check if rotorA needs to rotate
        if (rotorTrigger){
          rotorTrigger = false;
          rotorALetter = alphabet[(alphabet.indexOf(rotorALetter) + 1) % 26];
        }
      }else{
        //Check for double step sequence!
        if (rotorBLetter == rotorBNotch){
          rotorBLetter = alphabet[(alphabet.indexOf(rotorBLetter) + 1) % 26];
          rotorALetter = alphabet[(alphabet.indexOf(rotorALetter) + 1) % 26];
        }
      }
      //Implement plugboard encryption!
      if (plugboardDict.keys.contains(letter)){
        if (plugboardDict[letter]!=""){
          encryptedLetter = plugboardDict[letter];
        }
      }
      //Rotors & Reflector Encryption
      var offsetA = alphabet.indexOf(rotorALetter);
      var offsetB = alphabet.indexOf(rotorBLetter);
      var offsetC = alphabet.indexOf(rotorCLetter);

      // Wheel 3 Encryption
      var pos = alphabet.indexOf(encryptedLetter);
      var let = rotorC[(pos + offsetC)%26];
      pos = alphabet.indexOf(let);
      encryptedLetter = alphabet[(pos - offsetC +26)%26];

      // Wheel 2 Encryption
      pos = alphabet.indexOf(encryptedLetter);
      let = rotorB[(pos + offsetB)%26];
      pos = alphabet.indexOf(let);
      encryptedLetter = alphabet[(pos - offsetB +26)%26];

      // Wheel 1 Encryption
      pos = alphabet.indexOf(encryptedLetter);
      let = rotorA[(pos + offsetA)%26];
      pos = alphabet.indexOf(let);
      encryptedLetter = alphabet[(pos - offsetA +26)%26];

      // Reflector encryption!
      if (reflectorDict.keys.contains(encryptedLetter)){
        if (reflectorDict[encryptedLetter]!=""){
          encryptedLetter = reflectorDict[encryptedLetter];
        }
      }

      // Back through the rotors
      // Wheel 1 Encryption
      pos = alphabet.indexOf(encryptedLetter);
      let = alphabet[(pos + offsetA)%26];
      pos = rotorA.indexOf(let);
      encryptedLetter = alphabet[(pos - offsetA +26)%26];

      // Wheel 2 Encryption
      pos = alphabet.indexOf(encryptedLetter);
      let = alphabet[(pos + offsetB)%26];
      pos = rotorB.indexOf(let);
      encryptedLetter = alphabet[(pos - offsetB +26)%26];

      // Wheel 3 Encryption
      pos = alphabet.indexOf(encryptedLetter);
      let = alphabet[(pos + offsetC)%26];
      pos = rotorC.indexOf(let);
      encryptedLetter = alphabet[(pos - offsetC +26)%26];

      //Implement plugboard encryption!
      if (plugboardDict.keys.contains(encryptedLetter)){
        if (plugboardDict[encryptedLetter]!=""){
          encryptedLetter = plugboardDict[encryptedLetter];
        }
      }
    }
    ciphertext = ciphertext + encryptedLetter;
  });
  return ciphertext;
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