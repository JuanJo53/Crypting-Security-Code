def vigenere_enc():
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    input_string = ""
    enc_key = ""
    enc_string = ""

    # Takes encrpytion key from user
    enc_key = input("Please enter encryption key: ")
    enc_key = enc_key.lower()

    # Takes string from user
    input_string = input("Please enter a string of text: ")
    input_string = input_string.lower()

    # Lengths of input_string
    string_length = len(input_string)

    # Expands the encryption key to make it longer than the inputted string
    expanded_key = enc_key
    expanded_key_length = len(expanded_key)

    while expanded_key_length < string_length:
        # Adds another repetition of the encryption key
        expanded_key = expanded_key + enc_key
        expanded_key_length = len(expanded_key)

    key_position = 0

    for letter in input_string:
        if letter in alphabet:
            # cycles through each letter to find it's numeric position in the alphabet
            position = alphabet.find(letter)
            # moves along key and finds the characters value
            key_character = expanded_key[key_position]
            key_character_position = alphabet.find(key_character)
            key_position = key_position + 1
            # changes the original of the input string character
            new_position = position + key_character_position
            if new_position > 26:
                new_position = new_position - 26
            new_character = alphabet[new_position]
            enc_string = enc_string + new_character
        else:
            enc_string = enc_string + letter
    return(enc_string)


def vigenere_dec():
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    input_string = ""
    dec_key = ""
    dec_string = ""

    # Takes encrpytion key from user
    dec_key = input("Please entcriptiier encryption key: ")
    dec_key = dec_key.lower()

    # Takes string from user
    input_string = input("Please enter a string of text: ")
    input_string = input_string.lower()

    # Lengths of input_string
    string_length = len(input_string)

    # Expands the encryption key to make it longer than the inputted string
    expanded_key = dec_key
    expanded_key_length = len(expanded_key)

    while expanded_key_length < string_length:
        # Adds another repetition of the encryption key
        expanded_key = expanded_key + dec_key
        expanded_key_length = len(expanded_key)

    key_position = 0

    for letter in input_string:
        if letter in alphabet:
            # cycles through each letter to find it's numeric position in the alphabet
            position = alphabet.find(letter)
            # moves along key and finds the characters value
            key_character = expanded_key[key_position]
            key_character_position = alphabet.find(key_character)
            key_position = key_position + 1
            # changes the original of the input string character
            new_position = position - key_character_position
            if new_position > 26:
                new_position = new_position + 26
            new_character = alphabet[new_position]
            dec_string = dec_string + new_character
        else:
            dec_string = dec_string + letter
    return(dec_string)


# Testing
print(vigenere_enc())
print(vigenere_dec())