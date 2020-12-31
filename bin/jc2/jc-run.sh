#!/bin/sh

WD=`dirname $0`
WD=`realpath ${WD}`

# in JC_JVM java parameters -Dxxx=yyy
# in JC_CLI additional cli parameters

JCLIBDIR=${WD}/lib
CP=
CP=${CP}:${JCLIBDIR}/jandcode-commons-launcher.jar
CP=${CP}:${JCLIBDIR}/commons-io.jar
CP=${CP}:${JCLIBDIR}/commons-vfs2.jar
CP=${CP}:${JCLIBDIR}/gson.jar
CP=${CP}:${JCLIBDIR}/slf4j-api.jar
CP=${CP}:${JCLIBDIR}/jcl-over-slf4j.jar
CP=${CP}:${JCLIBDIR}/logback-core.jar
CP=${CP}:${JCLIBDIR}/logback-classic.jar
CP=${CP}:${JCLIBDIR}/jandcode-commons.jar
CP=${CP}:${JCLIBDIR}/jansi.jar
CP=${CP}:${JCLIBDIR}/jandcode-commons-jansi.jar
CP=${CP}:${JCLIBDIR}/groovy.jar
CP=${CP}:${JCLIBDIR}/groovy-ant.jar
CP=${CP}:${JCLIBDIR}/groovy-json.jar
CP=${CP}:${JCLIBDIR}/groovy-xml.jar
CP=${CP}:${JCLIBDIR}/groovy-templates.jar
CP=${CP}:${JCLIBDIR}/jandcode-commons-groovy.jar
CP=${CP}:${JCLIBDIR}/jandcode-commons-moduledef.jar
CP=${CP}:${JCLIBDIR}/ant-launcher.jar
CP=${CP}:${JCLIBDIR}/ant.jar
CP=${CP}:${JCLIBDIR}/jandcode-jc.jar

JVM= 
JVM="${JVM} -cp ${WD}/lib/jandcode-commons-launcher.jar"
JVM="${JVM} -Djandcode.launcher.classpath=${CP}"
JVM="${JVM} -Djandcode.launcher.main=jandcode.jc.Main"
JVM="${JVM} -Djandcode.jc.appdir=${WD}"
JVM="${JVM} -Dfile.encoding=UTF-8"

java ${JVM} ${JC_JVM} jandcode.jc.Main ${JC_CLI} $*
