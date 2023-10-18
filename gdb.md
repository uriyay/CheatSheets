#### break on library load or prcoess load: 
set stop-on-solib-events 1

http://visualgdb.com/gdbreference/commands/set_stop-on-solib-events 

disable by set it to 0 

#### PythonAPI:
https://sourceware.org/gdb/onlinedocs/gdb/Python-API.html#Python-API 

common use: 
```py
a = gdb.parse_and_eval('(void *)malloc(5)') 
gdb.execute('set *(char *)a = 0x10') 
gdb.selected_inferior().write_memory(a, b'hello')
```

hexdump:
```py
from hexdump import hexdump
hexdump(bytes(inferior.read_memory(0xdeadbeef, 64)))
```

### useful commands
`stepi/si` - step one instruction, entering functions if the instruction is a call

`nexti/ni` - step one instruction without entering functions, might not return if the function doesn't return

`until` - run until location, for example "until *0xdeadbeef" will run until this instruction. Useful for skipping over calls.

`x/FMT address` - eXamine memory

  examples:
  
  `x/10i $pc` - disas next 10 instructions
    
  `x/10xb $r0` - hex dump r0 for 10 bytes
    
  `x/10xa $esp` - dump 10 addresses

`display /FMT address` - set display parameters. FMT is like "x" command
  example: `display/i $pc` - will display disassembly for current instruction for each step
  
`target remote ip:port` - remote debugging

`set follow-fork-mode child/parent` - when a fork happens, debug the child or the parent

`set print asm-demangle` - enable demangled names (for C++)

`set disassembly-flavor intel` - sets the asm to be intel instead of AT&T

### Continue without paging
If you assign a command or condition to a breakpoint, gdb will still print a line every time the BP is called.
gdb by default will suspend the execution every time the screen is filled.
In order to continue regardless to the screen status, instead of pressing ENTER to continue, press "c" and then ENTER.

In order to disable paging:

`set pagination off`

### Catch exceptions

`catch event` - allows you to catch all sort of events, such as exceptions.

https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_30.html

Useful example:

`catch throw` - catch the *throw* in cpp, so you don't need to guess where this exception came from and you will have the whole backtrace of the thrower, which is much more interesting than the backtrace of the catcher..
