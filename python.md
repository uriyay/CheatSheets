### json to object
```py
import json
from collections import namedtuple

json.loads(data, object_hook=lambda d: namedtuple('X', d.keys())(*d.values()))
```
[from this stackoverflow answer](https://stackoverflow.com/a/15882327)

It works also with json.load()
