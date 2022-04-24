npm init --yes
でpackage.jsonをつくる

--yesなしをつけないと
```
Press ^C at any time to quit.
package name: (nodecli) 
version: (1.0.0) 
description: 
entry point: (main.js) 
test command: 
git repository: 
keywords: 
author: 
license: (ISC) 
About to write to /Users/tfukushi/Documents/tukushi/nodecli/package.json:

{
  "name": "nodecli",
  "version": "1.0.0",
  "description": "",
  "main": "main.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}


Is this OK? (yes) 
```

と聞かれる

---
npm install commander

