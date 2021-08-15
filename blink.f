\ ***************************************************************************
\ File: blink.f -- the hello world of microcontrollers
\ MCU: ATMega328P
\ ***************************************************************************
\ Simpy blinks the LED on PORTB bit5 (Pin 19)

-blink
marker -blink

\ Setup some constants for the ATMega pins for us to use
$0024 constant DDRB
$0025 constant PORTB
1 #5 lshift constant bit5

: init ( -- )
    bit5 DDRB mset ; \ Make DDRB bit5 an output

: toggle ( -- )
    PORTB c@ bit5 xor PORTB c! ; \ Toggle bit5 on PORTB

\ Main loop
: blink ( -- )
    init 
    begin
        toggle #500 ms 
    again ;

