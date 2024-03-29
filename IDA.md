## Solve common troubles
1. Pseudo-code doesn't display strings as strings, but as global variables

=> Modify the segment attributes so it will be read+exec (disable the write permission for the segment)

2. BL instruction shows with separator after it, breaking the function in the middle

=> Make sure that the callee function doesn't marked as a non-returning function (Alt+P on the function)

And use the "force BL call" feature:

https://www.hex-rays.com/products/ida/support/idapython_docs/idc.html#idc.force_bl_jump

(Edit -> Other -> force BL call)

3. The analysis run for too long time and I just want to checkout the CFG of a specific function

=> Run this python snippet:

```py
idc.set_flag(INF_GENFLAGS, INFFL_AUTO, 0)
```

(Credit: https://www.reddit.com/user/_emoose_/comments/131balg/ida_pausestop_analysis_command/)


## IDAPython tricks

### Find Loops
```
import sark
import networkx as nx

def has_cycles(f):
    #@f: sark Function object
    graph = sark.get_nx_graph(f.ea)
    try:
        nx.cycles.find_cycle(graph)
        return True
    except nx.NetworkXNoCycle:
        pass
    return False
```
