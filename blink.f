\ ***************************************************************************
\ File: blink.f -- the hello world of microcontrollers
\ MCU: ATMega328P
\ ***************************************************************************
\ Simpy blinks the LED on PORTB bit5 (Pin 19)

-blink
marker -blink

\ Setup some constants for the ATMega pins for us to use
$0023 constant PINB
$0024 constant DDRB
$0025 constant PORTB

%00100000 constant PB5

: init ( -- )
    PB5 DDRB mset ; \ Make PB5 as an output

: on ( pin -- )
    PORTB mset ;

: off ( pin -- )
    PORTB mclr ;

: toggle ( pin -- )
    PINB mset ;

\ Main loop
: blink ( pin -- )
    init 
    begin
        dup 
        toggle #500 ms
    again ;

