\ ***************************************************************************
\ File: morse-code-hello.f -- display hello world in morse code
\ MCU: ATMega328P
\ ***************************************************************************
\ Blinks the LED on PORTB bit5 (Pin 19) with morse code of "Hello World"

-morse-hello
marker -morse-hello

\ Setup some constants for the ATMega pins for us to use
$0024 constant DDRB
$0025 constant PORTB
1 #5 lshift constant bit5

variable ms_count 

: init ( -- )
    bit5 DDRB mset ; \ Make DDRB bit5 an output

: led-on ( -- ) \ Turn on the LED
    bit5 PORTB mset ;

: led-off ( -- ) \ Turn off the LED
    bit5 PORTB mclr ;

: gap ( -- ) \ Pause for ms_count miliseconds
    ms_count @ ms ;

: gap2 ( -- )  \ Double the gap
    gap gap ;

: gap4 ( -- ) \ Double the gap2
    gap2 gap2 ;

: dit ( -- )
    led-on gap2 led-off gap4 ;

: dah ( -- ) 
    led-on gap4 led-off gap4 ;

\ Morse code
: H dit dit dit dit gap ;
: e dit gap ;
: l dit dit gap ;
: o dah dah dah gap ;
: W dit dah dah gap ;
: r dit dah dit gap ;
: d dah dit dit gap ;

: hello ( -- )
    H e l l o gap W o r l d gap2 ;

\ Main loop
: main ( n -- ) \ where n is the delay between blinks
    ms_count !
    init 
    begin
        hello
    again ;

