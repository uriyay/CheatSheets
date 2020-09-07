# break on library load or prcoess load: 
set stop-on-solib-events 1 
http://visualgdb.com/gdbreference/commands/set_stop-on-solib-events 
disable by set it to 0 

# PythonAPI:
https://sourceware.org/gdb/onlinedocs/gdb/Python-API.html#Python-API 
common use: 
a = gdb.parse_and_eval('(void *)malloc(5)') 
gdb.execute('set *(char *)a = 0x10') 
gdb.selected_inferior().write_memory(a, b'hello')

# useful commands
stepi/si - step one instruction, entering functions if the instruction is a call
nexti/ni - step one instruction without entering functions, might not return if the function doesn't return
x/FMT address - eXamine memory
  example:
    "x/10i $pc" - disas next 10 instructions 
    "x/10xb $r0" - hex dump r0 for 10 bytes

display /FMT address - set display parameters. FMT is like "x" command
  example: "display/i $pc" - will display disassembly for current instruction for each step
  
target remote ip:port - remote debugging

set follow-fork-mode child/parent - when a fork happens, debug the child or the parent
