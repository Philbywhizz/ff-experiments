\ ***************************************************************************
\ File: blink-var.f -- a variable blink
\ MCU: ATMega328P
\ ***************************************************************************
\ Simpy blinks the LED on PORTB bit5 (Pin 19)


-blink-var
marker -blink-var

$0024 constant DDRB
$0025 constant PORTB
1 #5 lshift constant bit5
variable ms_count 

: init ( -- )
    bit5 DDRB mset ; \ Make DDRB bit5 an output

: toggle ( -- )
    PORTB c@ bit5 xor PORTB c! ;

: wait ( -- )
    ms_count @ ms ;

: blink-var ( n -- ) \ where n is the ms delay between blinks
    ms_count !
    init 
    begin
        toggle wait
    again ;
