# >>> conda init >>>
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/recsys/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/recsys/chenmingming/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/recsys/chenmingming/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/recsys/chenmingming/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

check_ret()
{
    ret=$1
    com=$2
    if [ ${ret} -eq 1 ] ; then
        echo ${com}
        exit 1
    fi
}

export -f check_ret

check_and_alarm()
{
    ret=$1
    com=$2
    if [ ${ret} -eq 1 ] ; then
        python /home/recsys/chenmingming/common/alarm.py "newsrec284: ${com}"
        exit 1
    fi
}

export -f check_ret
export -f check_and_alarm

source /home/recsys/chenmingming/opensource/bashmarks/bashmark.sh