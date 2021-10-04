@echo off

rem in JC_JVM java parameters -Dxxx=yyy
rem in JC_CLI additional cli parameters

set JCLIBDIR=%~dp0lib
set CP=
set CP=%CP%;%JCLIBDIR%\jandcode-commons-launcher.jar
set CP=%CP%;%JCLIBDIR%\commons-io.jar
set CP=%CP%;%JCLIBDIR%\commons-lang3.jar
set CP=%CP%;%JCLIBDIR%\commons-vfs2.jar
set CP=%CP%;%JCLIBDIR%\gson.jar
set CP=%CP%;%JCLIBDIR%\slf4j-api.jar
set CP=%CP%;%JCLIBDIR%\jcl-over-slf4j.jar
set CP=%CP%;%JCLIBDIR%\logback-core.jar
set CP=%CP%;%JCLIBDIR%\logback-classic.jar
set CP=%CP%;%JCLIBDIR%\jandcode-commons.jar
set CP=%CP%;%JCLIBDIR%\jansi.jar
set CP=%CP%;%JCLIBDIR%\jandcode-commons-jansi.jar
set CP=%CP%;%JCLIBDIR%\groovy.jar
set CP=%CP%;%JCLIBDIR%\groovy-ant.jar
set CP=%CP%;%JCLIBDIR%\groovy-json.jar
set CP=%CP%;%JCLIBDIR%\groovy-xml.jar
set CP=%CP%;%JCLIBDIR%\groovy-templates.jar
set CP=%CP%;%JCLIBDIR%\jandcode-commons-groovy.jar
set CP=%CP%;%JCLIBDIR%\jandcode-commons-moduledef.jar
set CP=%CP%;%JCLIBDIR%\ant-launcher.jar
set CP=%CP%;%JCLIBDIR%\ant.jar
set CP=%CP%;%JCLIBDIR%\jandcode-jc.jar

set JVM= 
set JVM=%JVM% -cp %~dp0lib\jandcode-commons-launcher.jar
set JVM=%JVM% -Djandcode.launcher.classpath=%CP%
set JVM=%JVM% -Djandcode.launcher.main=jandcode.jc.Main
set JVM=%JVM% -Djandcode.jc.appdir=%~dp0
set JVM=%JVM% -Dfile.encoding=UTF-8

java %JVM% %JC_JVM% jandcode.commons.launcher.Launcher %JC_CLI% %*
