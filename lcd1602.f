\ ***************************************************************************
\ File: lcd1602.f -- Control an LCD1602 module
\ MCU: ATMega328P
\ ***************************************************************************
\ The LCD is operated in 4-Bit Mode

\ Requires atmega328p.f

-lcd1602
marker -lcd1602

\ ATMega connections to LCD
\ PC0 -> D4
\ PC1 -> D5
\ PC2 -> D6
\ PC3 -> D7
\ PB0 -> RS
\ PB1 -> E
\ PB2 -> RW

: lcd.RS PIN0 PORTB ;
: lcd.RW PIN1 PORTB ;
: lcd.E  PIN2 PORTB ;
: lcd.D4 PIN0 PORTC ;
: lcd.D5 PIN1 PORTC ;
: lcd.D6 PIN2 PORTC ;
: lcd.D7 PIN3 PORTC ;

\ LCD Dataport is connected to the lower 4 bits of PORTC
PORTC constant lcd.dataport
DDRC constant lcd.datadir

\ LCD Control registers are connected to the lower 2 bits of PORTB
PORTB constant lcd.controlport
DDRB constant lcd.controldir

: lcd.data-in ( -- ) \ Input into LCD dataport
    lcd.datadir c@ $0f
    or
    lcd.datadir c!
;

: lcd.data-out ( -- ) \ Output from LCD dataport
    lcd.datadir c@ $f0
    and
    lcd.datadir c!
;

: lcd.put-nibble ( c -- )   \ Output the lower 4-bits to the datapport
    $0f and                 \ just the lower 4-bits of c
    lcd.dataport c@ $f0 and \ read the high bits
    or                      \ merge with our lower 4-bits
    lcd.dataport c!         \ output back to dataport
;

: lcd.delay ( -- ) \ A short delay 
    \ #15 ms
    #18 for r@ drop next
;

: lcd.Estrobe ( -- )
    lcd.E mset
    #20 ms
    lcd.E mclr
;

: lcd.getc ( -- c) \ Get a byte from the data port
    lcd.data-in
    lcd.RW mset lcd.delay
    lcd.E mset lcd.dataport c@ #4 lshift lcd.E mclr lcd.delay \ high nibble
    lcd.E mset lcd.dataport c@ lcd.E mclr lcd.delay \ low nibble
    or
    lcd.RW mclr lcd.delay
;

: lcd.putc ( c -- ) \ Put a byte through the data port
    dup $f0 and #4 rshift \ Get the high nibble
    lcd.data-out
    lcd.RW mclr lcd.delay
    lcd.put-nibble lcd.delay lcd.Estrobe lcd.delay
    $0f and \ low nibble
    lcd.put-nibble lcd.delay lcd.Estrobe lcd.delay
    lcd.data-in
;

: lcd.ready? ( -- f ) \ read RS and check for busy bit
    lcd.RS mclr lcd.delay
    lcd.getc $80 and 0=
;

: lcd.wait ( -- )
    begin lcd.ready? cwd until
;

: lcd.init ( -- )
    lcd.data-in \ enable dataport on LCD for input
    lcd.RS mclr
    lcd.RW mclr
    lcd.E mclr
    lcd.controldir c@ %111 or lcd.controldir c! \ Enable controlport
    #50 ms \ power on delay
    \ Get the LCD's attention
    %011 lcd.put-nibble lcd.Estrobe #5 ms
    %011 lcd.put-nibble lcd.Estrobe #1 ms
    %011 lcd.put-nibble lcd.Estrobe #1 ms
    \ Switch to 4-bit mode
    %010 lcd.put-nibble lcd.Estrobe #1 ms

    \ 2 display lines, 5x7 font
    lcd.wait
    %00101000 lcd.putc

    

;
