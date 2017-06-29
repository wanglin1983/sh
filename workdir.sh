#!/bin/bash
declare -A map=();

for i in {1..100}
do
    alias cw$i="cw $i";
done

for i in {1..100}
do
    alias vf$i="vf $i";
    alias vf$i'h'="vf $i h";
done

for i in {1..100}
do
    alias ff$i="ff $i";
    alias ff$i'h'="ff $i h";
done

function list_workdir()
{
    line_num=0;
    for line in `cat $WORKDIR/sh/workdirs.txt`
    do
        let line_num+=1;
        if [ $# -eq 0 ]; then
            log_debug "$line_num: $line";
        fi
        map[$line_num]=$line;
    done
}

function cd_workdir()
{
    list_workdir $1;
    dirNum=0;
    if [ $# -ne 0 ]; then
        dirNum=$1;
    else
        read -p "Enter dir number:" dirNum;
    fi

    cd ${map[$dirNum]};
}

function list_workfiles()
{
    flag="["
    line_num=0;
    WORKFILE="workfiles.txt"
    if [ ! -f $WORKFILE ];then
      WORKFILE="$WORKDIR/sh/workfiles.txt"
    fi
    for line in `cat $WORKFILE`
    do
        linetmp=$line
        flagline=${line:0:1}
        line=$linetmp
        if [ $flag == $flagline ]; then
            if [ $# -eq 0 ]; then
                if [ $line_num -ne 0 ];then
                    log_debug ""
                fi
                log_debug "$line"
            fi
            continue
        fi
        let line_num+=1;
        if [ $# -eq 0 ]; then
            filename=`basename $line`;
            log_debug "$line_num: $filename";
        fi
        map[$line_num]=$line;
    done
}

cur_filename=""
function find_workfile()
{
    list_workfiles $1;
    fileNum=0;
    flag="c"
    if [ $# -ne 0 ]; then
        fileNum=$1;
    else
        read -p "Enter file number:" fileNum;
        len=`echo $fileNum |wc -L`
        flag=`echo $fileNum | cut -c$len`
        if [ $flag == "h" ]; then
            let len=len-1
            fileNum=`echo $fileNum | cut -c1-$len`
        fi
    fi

    fullfile=${map[$fileNum]}

    if [ -z "$fullfile" ]; then
        log_error "Index error, please check workdirs.txt!"
        return
    fi

    filename=`basename $fullfile`
    if [ $# -eq 2 ]; then
        flag="h"
    fi
    if [ $flag == "h" ]; then
        filename=${filename%.*}.h
    fi
    log_info "Finding [$filename], please wait..."
    cur_filename=`find -name $filename`
    if [ -z $cur_filename ]; then
        log_error "Can not find $filename in current dir."
        return
    fi

    log_info "$cur_filename"
}

function view_workfile()
{
    cur_filename=""
    find_workfile $*
    if [ -n "$cur_filename" ]; then
        vim "$cur_filename"
    fi
}


alias lw='list_workdir'
alias cw='cd_workdir'
alias lf='list_workfiles'
alias vf='view_workfile'
alias ff='find_workfile'
