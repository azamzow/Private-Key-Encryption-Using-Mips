#Avery Zamzow
#Computer Architecture 3327
#2/24/18


.data
	prompt1: .asciiz "ENTER THE ENCRYPTION KEY (A NUMBER BETWEEN 1 and 15):"
	prompt2: .asciiz "INPUT A MESSAGE OF NO MORE THAN 80 CHARACTERS. WHEN DONE, PRESS <ENTER>"
	disp1: .asciiz "\nEncrypted string is\n"
	disp2: .asciiz "\n\nDecrypted string is\n"
	buffer: .space 80
	result: .space 256
.text

#prompt 
la $a0, prompt1
li $v0, 4
syscall

#get key
li $v0, 5
move $s0, $v0
syscall

#prompt 
la $a0, prompt2
li $v0, 4
syscall

#get input
la $a0, buffer
la $a1, 80
li $v0, 8 #get input
move $s1, $a0 #move to t0
syscall

la $s2, result #prtepare output buffer
la $s4, buffer #prtepare output buffer - decrypt
li $s3, 0
j encrypt

encrypt:
lb $t0, ($s1)
beqz $t0, resetAddreses
xor $t1, $t0, $s0
#move $t1, $t0
sb $t1, ($s2) #store char in s2
addi $s1, $s1, 1 #go to next char
addi $s2, $s2, 1 #increment address
addi $s3, $s3, 1 #count of chars
j encrypt

resetAddreses:
sub $s2, $s2, $s3 #reset to first char address
sub $s1, $s1, $s3 #reset to first address
j decrypt

decrypt:
lb $t0, ($s2)
beqz $t0, displayResult
xor $t1, $t0, $s0
#move $t1, $t0
sb $t1, ($s4) #store char in s2
addi $s4, $s4, 1 #go to next char
addi $s2, $s2, 1 #increment address

j decrypt

displayResult:
#sb $t0, ($s2) #copy terminator
sub $s2, $s2, $s3 #reset to first address
sub $s4, $s4, $s3 #reset to first address
#display result encryption
la $a0, disp1 
li $v0, 4
syscall
move $a0, $s2
li $v0, 4
syscall
#display result decryption
la $a0, disp2
li $v0, 4
syscall
move $a0, $s4
li $v0, 4
syscall



