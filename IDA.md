### Solve common troubles
1. Pseudo-code doesn't display strings as strings, but as global variables
=> Modify the segment attributes so it will be read+exec (disable the write permission for the segment)
