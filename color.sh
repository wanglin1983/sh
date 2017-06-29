NONE="\033[0m"
BLACK="\033[0;30m"
DARK_GRAY="\033[1;30m"
BLUE="\033[0;34m"
LIGHT_BLUE="\033[1;34m"
GREEN="\033[0;32m"
LIGHT_GREEN="\033[1;32m"
CYAN="\033[0;36m"
LIGHT_CYAN="\033[1;36m"
RED="\033[0;31m"
LIGHT_RED="\033[1;31m"
PURPLE="\033[0;35m"
LIGHT_PURPLE="\033[1;35m"
BROWN="\033[0;33m"
YELLOW="\033[1;33m"
LIGHT_GRAY="\033[0;37m"
WHITE="\033[1;37m"

colored()
{
  echo -ne $1$2$NONE
}

function color_echo()
{
    echo -e $1$2$NONE;
}

log_info()
{
    color_echo $YELLOW "$@"
}

log_error()
{
    color_echo $RED "$@"
}

log_debug()
{
    color_echo $LIGHT_GREEN "$@"
}

function show_color_table()
{
    M='m'
    T='RGB' # The test text
    echo  "\033[        ;                                                                      m"
    echo  "             default  40      41      42      43      44      45      46      47 "
    ## FGs ...(foreground)., BG ...(background).
    for FGs in '    ' '   1' '   6' '   7'\
               '  30' '1;30' '6;30' '7;30'\
               '  31' '1;31' '6;31' '7;31'\
               '  32' '1;32' '6;32' '7;32'\
               '  33' '1;33' '6;33' '7;33'\
               '  34' '1;34' '6;34' '7;34'\
               '  35' '1;35' '6;35' '7;35'\
               '  36' '1;36' '6;36' '7;36'\
               '  37' '1;37' '6;37' '7;37'
        do
            FG=$(echo $FGs|tr -d ' ')
            echo -en "      $FGs \033[$FG$M  $T  "
            for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
                do
                    echo -en " \033[$FG;$BG  $T  \033[0m"
                done
                echo
        done
        echo
}

function show_color_table_ex()
{
    echo
    for STYLE in 0 1 2 3 4 5 6 7; do
        for FG in 30 31 32 33 34 35 36 37; do
            for BG in 40 41 42 43 44 45 46 47; do
                CTRL="\033[${STYLE};${FG};${BG}m"
                echo -en "${CTRL}"
                echo -n "${CTRL}"
                echo -en "\033[0m"
            done
            echo
        done
        echo
    done
    # Reset
    echo -e "\033[0m"
}

alias cecho='color_echo'
alias sct='show_color_table'
alias scte='show_color_table_ex'
