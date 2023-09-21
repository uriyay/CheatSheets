# NodeJS
# Install
The best way is to download the latest version from [nodejs site](https://nodejs.org/en/download).
If you are running on linux, copy the relevant files to /usr through:
```bash
sudo cp -r directory_name/{bin,include,lib,share} /usr/
```
(source: [](https://stackoverflow.com/a/66166866))
## Debugging nodejs
### node inspect
Run your module with:
```bash
node inspect <your-module.js>
```
You can insert breakpoints through the cli by writing the filename and the line number.
You can also insert a breakpoint by writing ```debugger;```.

### debug native
You can debug native by using [llnode](https://github.com/nodejs/llnode)
Notice that [they do not support EOL versions](https://github.com/nodejs/llnode/issues/355#issuecomment-608160543), and that the version that can be install through apt in ubuntu is not always the latest.

First you need lldb, you can get it with:
```bash
sudo apt install lldb liblldb-dev
```

Install llnode by:
```bash
npm install llnode
```
