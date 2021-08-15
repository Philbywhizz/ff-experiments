# FlashForth Experiments
Experiments and learnings with [FlashForth](https://flashforth.com/) on the ATMega328P microcontroller

This repository contains all my little experiments and forth source code that I have developed for the ATMega328P. I am no expert in forth but feel it would be helpful to have a repository of flashforth code (as I haven't found many examples). Feel free to use these files as you like.

## Hardware Setup
My hardware setup is an ATMeta328P microcontroller on a breadboard as outlined [here](https://www.arduino.cc/en/main/standalone). Instead of running the Arduino bootloader I've reflashed the microcontroller with [FlashForth](https://flashforth.com/) and am communicating over serial with a FTDI cable.

I am currently running EFlashForth 5 ATmega328 11.11.2020

## Communications

I am using [gtkterm](https://github.com/Jeija/gtkterm) hosted on Regolith linux setup with these port configurations:

    /dev/ttyUSB0 38400-8-N-1
    Flow Control: Xon/Xoff
    End of line Delay: 250ms

The 'end of line delay' allows me to 'Send RAW files' over serial to the microcontroller
