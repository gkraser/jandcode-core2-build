
export JAVA_HOME=$HOME/pf/jdk17
export JC_RUN=${WD}/bin/jc2/jc-run.sh
export JC_JVM=

# ---------------------------------------------------------------
if [[ -f "$WD/_env.sh" ]]; then
    source "$WD/_env.sh"
fi
# ---------------------------------------------------------------

export PATH=${JAVA_HOME}/bin:${PATH}
