#System alias
WORKDIR=/home/pi/WorkDir
wd=$WORKDIR

tizen="review.tizen.org"

alias cc='clear'
alias ll='ls -lh'
alias lla='ls -alhF'
alias la='ls -Ah'
alias l='ls -CFh'
alias lld='ls -l -d */'
alias ld='ls -d */'
alias cd..='cd ..'

alias cdco='cd $wd/cobalt'
alias cdcodes='cd ~/Codes'
alias cdwd='cd $wd'
alias cdsh='cd $wd/sh'
alias cdpy='cd $wd/python'
alias cdtp='cd /home/wanglin0408/WorkDir/P4'
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

show_wifi_list()
{
    sudo iwlist wlan0 scan | grep ESSID
}

edit_wifi()
{
    cat wpa_supplicant.conf
    sudo vim /etc/wpa_supplicant/wpa_supplicant.conf
}

update_apps()
{
    sudo apt-get update && sudo apt-get upgrade -y
}

alias mcp='mkdir_copy'
alias ep='enable_proxy'
alias dp='disable_proxy'
alias kp='kill_process'
alias fif='find_in_file'
alias f='fire_fox'
