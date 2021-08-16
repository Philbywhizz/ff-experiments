\ ***************************************************************************
\ File: tools.f -- General tools
\ MCU: ATMega328P
\ ***************************************************************************
\ This files just contains some helpful tools that I've copied from
\ the flashforth repo and added them here for convenience

-tools
marker -tools

: forget ( --- name ) \ Forget a work - helpful for quick testing
    bl word latest @ (f) ?abort?
    c>n 2- dup @ ?abort?
    dup flash dp ! @ latest ! ram
;

: .free ( -- ) \ Display how much memory is free for each type
    decimal
    cr ." == Memory Status == " cr
    cr ."   Flash: " flash hi here - u. ." bytes"
    cr ."  Eeprom: " eeprom hi here - u. ." bytes"
    cr ."     Ram: " ram hi here - u. ." bytes" cr
;

