#!/bin/bash

print_args()
{
  echo "\$*:"$*
  echo "\$@:"$@
  for arg in "$*"
  do
     echo $arg
  done
  for arg in "$@"
  do
   echo $arg
  done
}

parse_args()
{
  while getopts "ab:c:" arg
  do
    case $arg in
      a)
        echo "a"
        ;;
      b)
        echo "b"
        echo "b's arg:$OPTARG"
        ;;
      c)
        echo "c"
        echo "c's arg:$OPTARG"
        ;;
      ?)
        echo "Unknown arg"
        ;;
    esac
  done
}

parse_args $*
