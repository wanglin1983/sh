#!/bin/bash

sortType=""
if [ $# -gt 0 ];then
  sortType=$1
fi

array=(0 6 4 3 1 2 9 5 8 7)
arrLen=${#array[*]}

InsertSort() {
  echo "InsertSort"
  echo ${array[*]}
  i=1
  while [ $i -lt $arrLen ]
  do
    key=${array[$i]}
    let j=i-1
    while [ $j -ge 0 ]
    do
      value=${array[$j]}
      if [ $value -gt $key ];then
        array[$j+1]=$value
      else
        break
      fi
      let j-=1
    done
    if [ $j -ne ${i-1} ];then
      array[$j+1]=$key
    fi
    let i+=1
  done
  echo ${array[*]}
}

BubbleSort() {
  echo "BubbleSort"
  echo ${array[*]}
  i=0
  while [ $i -lt $arrLen ]
  do
    let j=i+1
    while [ $j -lt $arrLen ]
    do
      if [ ${array[j]} -lt ${array[i]} ];then
        # swap i & j
        temp=${array[j]}
        array[j]=${array[i]}
        array[i]=$temp
      fi
      let j+=1
    done
    let i+=1
  done
  echo ${array[*]}
}

if [ "$sortType" == "INSERT" ];then
  InsertSort
elif [ "$sortType" == "BUBBLE" ];then
  BubbleSort
else
  InsertSort
fi
