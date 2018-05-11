N EQU 5
 AREA mycode, CODE, READONLY
 ENTRY
 EXPORT __main
__main
 LDR R0, =STR	 ; load address of array into R0
 MOV R1, #N		 ; copy the value N into R1
 MOV R4, R0		 ;backup value
 MOV R5, R1		 ;backup value
 BL somer_func	 ;call function
 LDR R1, =RST	 ;load adress of space into R1
 STR R0, [R1]	 ;store the summation into R1
STOP
 BAL STOP		 ; infinite loop
somer_func
 STMFD SP!, {R4, R5, R6, R7, LR}   ;   backup the registers
 MOV R4, #0   ; accumalator
 MOV R5, #0   ; offset
 MOV R7, #0   ; counter
LOOP
 CMP R7, R1   ; compare with length of array
 BEQ OUT      
 LDR R6, [R0,R5] ; load the next value
 ADD R4, R4, R6  ; add the value into summation
 ADD R7, R7, #1  ; incrase the counter by 1
 ADD R5, R5, #4  ; increase the offset by 4 because of DCD 
 BAL LOOP 
OUT
 MOV R0, R4      ; copy the summation value into R0 
 LDMFD SP!, {R4, R5, R6, R7, LR}   ; reload the register values
 MOV PC, LR
STR DCD 3, 5, 1, 1, 8
 AREA data, DATA, READWRITE
RST SPACE 4
 END
