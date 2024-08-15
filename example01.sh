#!/bin/bash

echo -e "$_"; ## Absolute name of the file which is being executed

test=("abacate" "apple" "pear" "peach" "watermelon" "pineapple")

for str in ${test[@]}; do
	echo $str
done

echo ${#test[1]}

echo ${#test[@]}

echo ${test[@]:0:3}



myvar="hey voce ai"

#slice ${string:position:length}

echo ${myvar:2}
echo ${myvar:2:5}


filename="bash.string.txt"
echo ${filename#.*}
echo ${filename%.*}

echo "After deletion of longest match from front:" ${filename##*.}
echo "After deletion of longest match from back:" ${filename%%.*}


# Replace first match ${string/pattern/replacement}

echo "After Replacement:" ${filename/str*./operations.}

# Replace all matches ${string//pattern/replacement}

filename="Path of the bash is /bin/bash"

echo "After Replacement:" ${filename//bash/sh}

# Replace beginning and end ${string/#pattern/replacement} and ${string/%pattern/replacement}

filename="/root/admin/monitoring/process.sh"

echo "Replaced at the beginning:" ${filename/#\/root/\/tmp}
echo "Replaced at the end": ${filename/%.*/.ksh}

# Bash expansion

echo last{mce,boot,xorg}.log

da=`date +%F`

echo $da.log{,.bak}


echo {oct,hex,dec,bin}

cat /var/log/messages.{1..3}
echo {a..f}{1..9}.txt

# Print 1 to 4 using sequences.
for i in {1..4}
do
        echo $i
done


# Print 1 to 4 using through variables
# Brace expansion does not expand bash variables, 
#   because the brace expansion is the very first step of the shell expansion, 
#   variable will be expanded later. It works for ksh.

start=1
end=4

echo "Sequences expressed using variables"
for i in {$start..$end}
do
        echo $i
done


# Special and Positional parameters

export IFS=$'\n'

# Printing the data available in $*
# $* within a pair of double quotes is equivalent to the list of positional parameters, 
#   separated by the first character of IFS “$1c$2c$3…”.

echo "Values of \"\$*\":"
for arg in "$*"
do
  echo "$arg"
done

cnt=1


# Printing the data available in $@
# $@ within a pair of double quotes is equivalent to the list of positional parameters, 
#   separated by unquoted spaces, i.e., “$1” “$2″..”$N”.

echo "Values of \"\$@\":"
for arg in "$@"
do
  echo "Arg #$cnt= $arg"
  let "cnt+=1"
done


# $# is the special parameter in bash which gives you the number of positional parameter in decimal.

if [ $# -lt 2 ]
then
  echo "Usage: $0 arg1 arg2"
  #exit
fi

echo -e  "\$1=$1"
echo -e "\$2=$2"

let add=$1+$2
let sub=$1-$2
let mul=$1*$2
let div=$1/$2

echo -e "Addition=$add\nSubtraction=$sub\nMultiplication=$mul\nDivision=$div\n"

# Process ID and Background process ID

echo -e "Process ID=$$"

sleep 1000 &

echo -e "Background Process ID=$!"

/usr/local/bin/dbhome  # execute the command.
#check the exit status of dbhome
if [ "$?" -ne "0" ]; then
  echo "Sorry, Command execution failed !"
fi

echo -e "$-"; #Set options - hB

echo -e $_  # Last argument of the previous command.


test=$(ls -lh)

echo $test


echo "arg0:$0"
echo "arg1:$1"
echo "arg2:$2"

#######

cnt=1

echo "Number of param: $#"
echo "Arg #0= $0"

for arg in "$@"
do
  echo "Arg #$cnt= $arg"
  let "cnt+=1"
done

#####

var=6

for num in {000..$var}; do echo "$num"; done

######

if [[ ${var} == 6 ]];
then
    echo "Six"
else
    echo "Not six"
fi

if [[ ${var} != 6 ]];
then
    echo "Not six"
else
    echo "Six"
fi

if [[ ${var} -eq 6 ]];
then
    echo "Six"
else
    echo "Not six"
fi

if [[ ${var} -ge 6 ]];
then
    echo "Six"
else
    echo "Not six"
fi

if [[ ${var} -le 6 ]];
then
    echo "Six"
else
    echo "Not six"
fi

svar=""

if [[ -z ${svar} ]];
then
    echo "0 length"
else
    echo "Not 0 length"
fi

a="rodrigo99"

if [[ $a =~ .*99  ]]; then
        echo "matches";
else
        echo "it does not match"
fi

b=8

case $b in
	6 | 7) 
		echo "6 | 7";;
	8) 
		echo "Equal 8";;
	*) 
		echo "Case";;
esac

case $? in

  "0")
    echo "Response was: Success"
    echo "Do appropriate processing in here"
    ;;

  "1")
    echo "Response was: Error"
    echo "Do appropriate error handling in here"
    ;;

  *)
    echo "Unrecognised response: $?"
    ;;
esac


for i in 1 2 3 4 ;do
        var7=`echo var$i`
        echo $var7
done

for i in 1 2 3 4 ;do
        var7=`echo $i`
        echo $var7
        var5=$[ $var7 * 2]
        echo $var5
done

for num in {0..2}; do echo "$num"; done

file="names1.txt"

for var in `cat $file`; do
	echo $var
done



export IFS=','


# Printing the data available in $*
# $* within a pair of double quotes is equivalent to the list of positional parameters, 
#   separated by the first character of IFS “$1c$2c$3…”.

echo "Values of \"\$*\":"
for arg in "$*"
do
  echo "Args= $arg"
done


var1=0

echo "While"
while [[ $var1 -lt 10 ]]; do
  echo $var1
  var1=$[ $var1 + 1 ]
  if [[ $var1 == 5 ]]; 
  then
        break
  fi
done

var1=0

echo "Until"
until [[ $var1 -eq 10 ]]; do
     echo $var1
     var1=$[ $var1 + 1 ]
done


echo $0

base=`basename $0`
echo $base

# Prints last param
echo ${!#}

# Shift params

#count=1

#while [ -n "$1" ]; do
#	echo "Parameter $count = $1"
#	count=$[ $count + 1 ]
#	shift
#done

count=1
for param in $@
do
	echo "Parameter $count: $param"
	count=$[ $count + 1 ]
done


for param in $@
do
        echo $param
done

read -t 5 -p "Please enter your age:" age
days=$[ $age * 365 ]
echo "That makes you over $days days old!"


count=1
cat names2.txt | while read line
do
	echo "Line $count: $line"
	count=$[ $count + 1]
done
echo "Finished processing the file"

for line in `cat names2.txt`; do
        echo $line
done


# redirecting output to different locations
exec 3>&1
exec 2>testerror
echo "This is the start of the script"
echo "now redirecting all output to another location"
exec 1>testout
echo "This output should go to the testout file"
echo "but this should go to the testerror file" >&2

# it redirects STDOUT and STDERR to log.txt
exec >log.txt 2>&1
echo "it redirects STDOUT and STDERR to log.txt"

exec 1>log2.txt 2>log3.txt
echo "teste output"
echs "test"

exec 1>&3

####### Functions

function Test {
        echo "My first function"
}

Test

echo $?

function AddArray {
        local sum=0
        local newarray

        newarray=("$@")

        #echo ${newarray[@]}
        #echo ${#newarray[@]}

        for value in ${newarray[@]}
        do
                #echo $value
                sum=$[ $sum + $value ]
        done
        echo $sum
}

myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[@]}"
#AddArray "${myarray[@]}"
result=$(AddArray "${myarray[@]}")
echo "The result is $result"


function DoubleArray {
        local sum=0
        local newarray
        local resultarray

        newarray=("$@")

        #echo ${newarray[@]}
        #echo ${#newarray[@]}

        cnt=0

        for value in ${newarray[@]}
        do
                #echo $value
                #echo $cnt
                double=$[ 2 * $value ]
                resultarray[cnt]=$double
                #echo ${resultarray[@]}
                cnt=$[ $cnt + 1 ]
        done
        echo "${resultarray[@]}"
}

myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[@]}"
#DoubleArray "${myarray[@]}"
result=$(DoubleArray "${myarray[@]}")
echo "The result is $result"


function factorial {
	if [ $1 -eq 1 ]
	then
		echo 1
	else
		local temp=$[ $1 - 1 ]
		local result=`factorial $temp`
		echo $[ $result * $1 ]
	fi
}

mynumber=4
result=`factorial ${mynumber}`
echo "The factorial of ${mynumber} is ${result}"







