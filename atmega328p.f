\ ***************************************************************************
\ File: ATMega328p.f -- Definitions for the Atmel328P
\ MCU: ATMega328P
\ ***************************************************************************

-atmega328p
marker -atmega328p

$23 constant PINB  \ PortB Input Register
$24 constant DDRB  \ PortB Dara Direction Register
$25 constant PORTB \ PortB Output Register
$26 constant PINC  \ PortC Input Register
$27 constant DDRC  \ PortC Data Direction Register
$28 constant PORTC \ PortC Output Register
$29 constant PIND  \ PortD Input Register
$30 constant DDRD  \ PortD Data Direction Register
$31 constant PORTD \ PortD Output Register

%10000000 constant PIN7
%01000000 constant PIN6
%00100000 constant PIN5
%00010000 constant PIN4
%00001000 constant PIN3
%00000100 constant PIN2
%00000010 constant PIN1
%00000001 constant PIN0
