/**
 * D header file for POSIX.
 *
 * Copyright: Public Domain
 * License:   Public Domain
 * Authors:   Sean Kelly
 * Standards: The Open Group Base Specifications Issue 6, IEEE Std 1003.1, 2004 Edition
 */
module core.sys.posix.termios;

import core.sys.posix.config;
public import core.sys.posix.sys.types; // for pid_t

extern (C):

alias ubyte cc_t;
alias uint  speed_t;
alias uint  tcflag_t;

const NCCS  = 32;

struct termios
{
    tcflag_t   c_iflag;
    tcflag_t   c_oflag;
    tcflag_t   c_cflag;
    tcflag_t   c_lflag;
    cc_t       c_line;
    cc_t[NCCS] c_cc;
    speed_t    c_ispeed;
    speed_t    c_ospeed;
}

const VEOF      = 4;
const VEOL      = 11;
const VERASE    = 2;
const VINTR     = 0;
const VKILL     = 3;
const VMIN      = 6;
const VQUIT     = 1;
const VSTART    = 8;
const VSTOP     = 9;
const VSUSP     = 10;
const VTIME     = 5;

const BRKINT    = 0000002;
const ICRNL     = 0000400;
const IGNBRK    = 0000001;
const IGNCR     = 0000200;
const IGNPAR    = 0000004;
const INLCR     = 0000100;
const INPCK     = 0000020;
const ISTRIP    = 0000040;
const IXOFF     = 0010000;
const IXON      = 0002000;
const PARMRK    = 0000010;

const OPOST     = 0000001;

// Posix baudrates
const B0        = 0000000;
const B50       = 0000001;
const B75       = 0000002;
const B110      = 0000003;
const B134      = 0000004;
const B150      = 0000005;
const B200      = 0000006;
const B300      = 0000007;
const B600      = 0000010;
const B1200     = 0000011;
const B1800     = 0000012;
const B2400     = 0000013;
const B4800     = 0000014;
const B9600     = 0000015;
const B19200    = 0000016;
const B38400    = 0000017;

// Non-Posix baudrates
const B115200   = 0010002;
const B230400   = 0010003;
const B460800   = 0010004;
const B500000   = 0010005;
const B576000   = 0010006;
const B921600   = 0010007;
const B1000000  = 0010010;
const B1152000  = 0010011;
const B1500000  = 0010012;
const B2000000  = 0010013;
const B2500000  = 0010014;
const B3000000  = 0010015;
const B3500000  = 0010016;
const B4000000  = 0010017;

const CSIZE     = 0000060;
const   CS5     = 0000000;
const   CS6     = 0000020;
const   CS7     = 0000040;
const   CS8     = 0000060;
const CSTOPB    = 0000100;
const CREAD     = 0000200;
const PARENB    = 0000400;
const PARODD    = 0001000;
const HUPCL     = 0002000;
const CLOCAL    = 0004000;

const ECHO      = 0000010;
const ECHOE     = 0000020;
const ECHOK     = 0000040;
const ECHONL    = 0000100;
const ICANON    = 0000002;
const IEXTEN    = 0100000;
const ISIG      = 0000001;
const NOFLSH    = 0000200;
const TOSTOP    = 0000400;

const TCSANOW   = 0;
const TCSADRAIN = 1;
const TCSAFLUSH = 2;

const TCIFLUSH  = 0;
const TCOFLUSH  = 1;
const TCIOFLUSH = 2;

const TCIOFF    = 2;
const TCION     = 3;
const TCOOFF    = 0;
const TCOON     = 1;

speed_t cfgetispeed(in termios*);
speed_t cfgetospeed(in termios*);
int     cfsetispeed(termios*, speed_t);
int     cfsetospeed(termios*, speed_t);
int     tcdrain(int);
int     tcflow(int, int);
int     tcflush(int, int);
int     tcgetattr(int, termios*);
int     tcsendbreak(int, int);
int     tcsetattr(int, int, in termios*);

const IXANY     = 0004000;

const ONLCR     = 0000004;
const OCRNL     = 0000010;
const ONOCR     = 0000020;
const ONLRET    = 0000040;
const OFILL     = 0000100;
const NLDLY     = 0000400;
const   NL0     = 0000000;
const   NL1     = 0000400;
const CRDLY     = 0003000;
const   CR0     = 0000000;
const   CR1     = 0001000;
const   CR2     = 0002000;
const   CR3     = 0003000;
const TABDLY    = 0014000;
const   TAB0    = 0000000;
const   TAB1    = 0004000;
const   TAB2    = 0010000;
const   TAB3    = 0014000;
const BSDLY     = 0020000;
const   BS0     = 0000000;
const   BS1     = 0020000;
const VTDLY     = 0040000;
const   VT0     = 0000000;
const   VT1     = 0040000;
const FFDLY     = 0100000;
const   FF0     = 0000000;
const   FF1     = 0100000;

pid_t   tcgetsid(int);
