ECHO_HIGHLIGHT()
{
    if [ "$2" = "LINE" ] ; then
        if [ "$3" = "RED"   ] ; then
            echo -e "\e[31m"
            echo -e "================================================"
            echo -e " $1 "
            echo -e "================================================"
            echo -e "\e[m"
        elif [ "$3" = "BLUE"    ] ; then
            echo -e "\e[34m"
            echo -e "================================================"
            echo -e " $1 "
            echo -e "================================================"
            echo -e "\e[m"
        else
            echo -e "\e[32m COLOR \e[m"
            echo -e "\e[32m"
            echo -e "================================================"
            echo -e " $1 "
            echo -e "================================================"
            echo -e "\e[m"
        fi
    else
        if [ "$2" = "RED"   ] ; then
            echo -e "\e[31m$1\e[m"
        elif [ "$2" = "BLUE"    ] ; then
            echo -e "\e[34m$1\e[m"
        else
            echo -e "\e[32m$1\e[m"
        fi
    fi
}

ECHO_HIGHLIGHT `dirname $0` "RED"

a=(1 2 3 4 5)
echo ${a[*]}

for i in {1000..5000}
do
   echo "extern int RUN_PROBLEM($i);"
done
