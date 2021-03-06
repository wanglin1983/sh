#System alias
wd=$WORKDIR

tizen="review.tizen.org"

alias t=$tizen

alias cc='clear'
alias ll='ls -lh'
alias lla='ls -alhF'
alias la='ls -Ah'
alias l='ls -CFh'
alias lld='ls -l -d */'
alias ld='ls -d */'
alias cd..='cd ..'

alias cdco='cd $wd/Cobalt'
alias cdcodes='cd ~/Codes'
alias cdwd='cd $wd'
alias cdsh='cd $wd/sh'
alias cdsht='cd $wd/sh-tizen'
alias cdpy='cd $wd/python'
alias cdt3='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl'
alias cdt4='cd /home/wanglin0408/WorkDir/Tizen4.0/chromium-efl'
alias cdtl='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-latest'
alias cdtdev='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-development'
alias cdte='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-experimental'
alias cdtd='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-dvb'
alias cdta='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-atsc'
alias cdti='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-isdb'
alias cdtv='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-av'
alias cdtdb='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-dtmb'
alias cdtha='cd /home/wanglin0408/WorkDir/Tizen3.0/chromium-efl-hawka'
alias cdtp='cd /home/wanglin0408/WorkDir/P4'
alias cdtpa='cd /home/wanglin0408/WorkDir/P4/Tizen3.0_ATSC'
alias cdtpd='cd /home/wanglin0408/WorkDir/P4/Tizen3.0_DVB'
alias cdtpi='cd /home/wanglin0408/WorkDir/P4/Tizen3.0_ISDB'
alias cdtpv='cd /home/wanglin0408/WorkDir/P4/Tizen3.0_AV'
alias cdtpdb='cd /home/wanglin0408/WorkDir/P4/Tizen3.0_DTMB'
alias cdtpha='cd /home/wanglin0408/WorkDir/P4/Tizen3.0_HAWKA'
alias cdt22='cd /home/wanglin0408/WorkDir/Tizen2.2'
alias cdt24='cd /home/wanglin0408/WorkDir/Tizen2.4'
alias hp='cat /home/wanglin0408/WorkDir/sh/helper.txt'

for i in {2..9}
do
    cdcmd="cd ";
    j=1;
    while [ $j -le $i ]
    do
        cdcmd+="../";
        j=`expr $j + 1`
    done
    alias cd$i..="$cdcmd";
done

mgrep()
{
    color_echo $YELLOW "\ngrep $* begins...\n"
    grep --color=auto $@
}

enable_proxy()
{
    color_echo $YELLOW "Enable proxy..."
    export http_proxy=10.240.210.99:3128
    export https_proxy=10.240.210.99:3128
}

disable_proxy()
{
    color_echo $YELLOW "Diable proxy..."
    unset http_proxy
    unset https_proxy
}

mkdir_copy()
{
    num=$#
    dest=${!num}
    color_echo $YELLOW "DestDir : [$dest]"
    for ((i=1;i<$num;i++))
    do
        cur_file=$1
        color_echo $YELLOW "Copy [$cur_file] to [$dest/`dirname $cur_file`]"
        mkdir -p $dest/`dirname $cur_file` && cp $cur_file "$_"
        shift
    done
}

find_in_file()
{
    find -name $1 | xargs grep $2 --color
}

fire_fox()
{
  firefox $* &
}

kill_process()
{
    process_name=$1
    process_list=`ps aux | grep $process_name | grep -v grep | awk '{print $2}'`
    if [ ! -n "$process_list" ]; then
        log_debug "No $process_name process is found..."
    else
        log_info "Kill $process_name process..."
        for psid in $process_list;
        do
            log_debug "Killing ""$psid"
            kill -9 $psid
        done
    fi
}

alias mcp='mkdir_copy'
alias ep='enable_proxy'
alias dp='disable_proxy'
alias kp='kill_process'
alias fif='find_in_file'
alias f='fire_fox'
