## Decompiler

1. Mark all occurences of a symbol - click on the middle button in the mouse on this symbol
2. Change data to a different type, for example change byte to char - go to the disassembly and change it by right click on the data operand -> Convert -> Char sequence or whatever.
3. Highlight disassembly instructions that matches the decompiled lines - select the decompiled lines.
4. Highlight decompiled lines that matches the disassembly instructions - select the disassembly instructions.

## What I need in Ghidra

Here is a list of things that I need that Ghidra will have (by a core functionality or plugins) that I have in IDA:
1. show xrefs to a variable in the decompiler window
2. navigate to functions more faster
In my free time I will try to find tools/ways to implement these features

## Ghidra Python Cheat Sheet

### Import Ghidra functions to IDA
1. Dump Ghidra functions start addresses:

```py
import json
with open(r'C:\Temp\funcs.json', 'w') as fp:
    json.dump([x.entryPoint.offset for x in currentProgram.getListing().getFunctions(True)], fp)
```
    
2. Then you can use it in IDA and import all of the functions:

```py
import json
import idc
funcs = json.load(open(r'C:\Temp\funcs.json')) as fp:
for addr in funcs:
    idc.MakeFunction(addr)
```

You can also attach the function name when exporting from Ghidra:
```py
import json
with open(r'C:\Temp\funcs.json', 'w') as fp:
    json.dump([(x.entryPoint.offset, x.name.encode()) for x in currentProgram.getListing().getFunctions(True)], fp)
```
And in IDA:
```py
import json
import idc
funcs = json.load(open(r'C:\Temp\funcs.json')) as fp:
for addr, name in funcs:
    idc.MakeFunction(addr)
    idc.set_name(addr, name)
```

### Import functions from IDA to Ghidra
1. Dump IDA functions:
```py
import sark
import json
funcs = [(f.ea, f.name) for f in sark.functions()]
json.dump(funcs, open('funcs.json', 'w'))
```

2. Load the json and import to Ghidra:
```py
from __main__ import * # needed for using flat API
import json

funcs = json.load(open('funcs.json'))
for ea, name in funcs:
    createFunction(toAddr(ea), name)
```
