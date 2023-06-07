Notice: this doc is focused in VSCode.

## Quick Start
`mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false`
Make sure you change the groupId and the artifactId

## Tricks
### Debug maven rules
You can debug maven rules by right-click on the rule from the maven window in VSCode and choose "Debug".
If you want to debug classes without source code you can add a dependency to pom.xml and then press Ctrl+T and enter the class name that you want to debug,
VSCode will decompile the class automatically.

## Problem Solving
### Plugins are not refreshed in maven plugins
Quick fix - remove pluginmanaement node from the pom.xml:
https://github.com/microsoft/vscode-maven/issues/480