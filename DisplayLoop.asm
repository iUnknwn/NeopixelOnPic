#include <xc.inc>
    
; Sends a single byte (from the W register) out to a NeoPixel.
; 
; You can call this function from C with the signature: send_byte(uint8_t value)
; 
; Note: This function requires that the PIC be running with a 32MHz clock
;
; The function is currently written to output on pin RA5 on a PIC12F1572, but
; you can easily set the OUTPUT_PIN and OUTPUT_PORT as needed for your device.
; You may also need to adjust the psect holding tmp_var so that it is in
; the same memory bank as your chosen port (this function as written is using 
; RA5 of PORTA, which is located in BANK0 - therefore the psect holding temp_var 
; is also in BANK0).


    
#define OUTPUT_PIN 0x5
#define OUTPUT_PORT PORTA
    
GLOBAL _send_byte
    
PSECT bss0,local,class=BANK0,space=1
    tmp_var: DS 1

PSECT code0,class=CODE,delta=2
_send_byte:
    BANKSEL OUTPUT_PORT
    MOVWF tmp_var
   
    BIT_7_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x7
    BRA BIT_7_HIGH
    
    BIT_7_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_6_START
    
    BIT_7_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_6_START
    
    BIT_6_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x6
    BRA BIT_6_HIGH
    
    BIT_6_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_5_START
    
    BIT_6_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_5_START
    
    BIT_5_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x5
    BRA BIT_5_HIGH
    
    BIT_5_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_4_START
    
    BIT_5_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_4_START
    
    BIT_4_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x4
    BRA BIT_4_HIGH
    
    BIT_4_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_3_START
    
    BIT_4_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_3_START
    
    BIT_3_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x3
    BRA BIT_3_HIGH
    
    BIT_3_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_2_START
    
    BIT_3_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_2_START
    
    BIT_2_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x2
    BRA BIT_2_HIGH
    
    BIT_2_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_1_START
    
    BIT_2_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_1_START
    
    BIT_1_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x1
    BRA BIT_1_HIGH
    
    BIT_1_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    BRA BIT_0_START
    
    BIT_1_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    BRA BIT_0_START
    
    BIT_0_START:
    BSF OUTPUT_PORT, OUTPUT_PIN
    
    BTFSC tmp_var, 0x0
    BRA BIT_0_HIGH
    
    BIT_0_LOW:
    // low case - 3 cycles after high
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // low case - 6 cycles after switching low
    NOP
    NOP
    NOP
    NOP
    RETURN
    
    BIT_0_HIGH:
    // high case - 5 cycles after high
    NOP
    NOP
    BCF OUTPUT_PORT, OUTPUT_PIN
    
    // high case - 3 cycles after switching low
    NOP
    RETURN

