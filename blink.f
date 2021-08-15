\ ***************************************************************************
\ File: blink.f -- the hello world of microcontrollers
\ MCU: ATMega328P
\ ***************************************************************************
\ Simpy blinks the LED on PORTB bit5 (Pin 19)

\ Requires hal.f

-blink
marker -blink

\ Setup some constants for the ATMega pins for us to use

: init ( -- )
    PIN5 DDRB mset ; \ Make PB5 as an output

: on ( -- )
    PIN5 PORTB mset ;

: off ( -- )
    PIN5 PORTB mclr ;

: toggle ( pin -- )
    PIN5 PINB mset ;

\ Main loop
: blink ( pin -- )
    init 
    begin
        toggle #500 ms
    again ;

