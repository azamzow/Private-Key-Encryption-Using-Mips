# Merge/Match Using Files Project

### Description

A MIPS assembly language, an encryption/decryption program. The program prompts the user for two separate inputs from the keyboard. 

1. Prompt #1 : ENTER THE ENCRYPTION KEY (A NUMBER BETWEEN 1 and 15):

   The user will input a number. (Assuming the user is not an idiot, and actually enters an integer value). However, if the user is actually an idiot and enters a value greater than 15, the program uses a bitmask of 0xF to force to the number to be less than16.  It stores this somewhere safe, because it is the encryption/decryption key.

2. Prompt #2 : INPUT A MESSAGE OF NO MORE THAN 80 CHARACTERS. WHEN DONE, PRESS <ENTER>· The user will input a character string from the keyboard, terminating the message with the<ENTER> key.

   The program stores the message in an array that is allocated and is big enough to hold 80  characters. 

   One constraint: Once again, we assuming the user is not a complete idiot and that the length of the message is indeed less than or equal to 80 characters. 

**Algorithm**

The encryption algorithm is as follows. 

​	Each ASCII code in the message is transformed as follows: 

​		For each character in the string, the program performs the exclusive-OR on that character. This will encrypt a plaintext string. It will also decrypt a ciphertext string.



### To Run

Using a Mac, you can open Mars4_5.jar file given. Once opened, you can open the Encryption.asm file. First you need to click the Run dropdown option on the toolbar at the top and select Assemble. After you have assembled the program, you can click the green start button to  execute it.



### Output

The program outputs the encrypted or decrypted message to the screen.

EX output given below:

```
ENTER THE ENCRYPTION KEY (A NUMBER BETWEEN 1 and 15): 5
INPUT A MESSAGE OF NO MORE THAN 80 CHARACTERS. WHEN DONE, PRESS <ENTER>: This is a test

Encrypted string is
%Qmlv%lv%d%q`vq

Decrypted string is
 This is a test

-- program is finished running (dropped off bottom) --
```