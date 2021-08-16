\ ***************************************************************************
\ File: blink-var.f -- a variable blink
\ MCU: ATMega328P
\ ***************************************************************************
\ Simpy blinks the LED on PORTB bit5 (Pin 19)


-blink-var
marker -blink-var

variable ms_count 

: init ( -- )
    PIN5 DDRB mset ; \ Make DDRB bit5 an output

: toggle ( -- )
    PIN5 PINB mset ;

: wait ( -- )
    ms_count @ ms ;

: blink-var ( n -- ) \ where n is the ms delay between blinks
    ms_count !
    init 
    begin
        toggle wait
    again ;
