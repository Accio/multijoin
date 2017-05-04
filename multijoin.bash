#!/bin/sh

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
key_field=1
value_field=2
header=""
unset debug

show_help()
{
  echo "Usage: -k KEY_FIELD -v VALUE_FIELD -H"
}

while getopts "dh?k:v:H" opt; do
  case "$opt" in
    d)
	echo "Debugging mode"
	debug="DEBUG"
	;;
    h|\?)
	show_help
	exit 0
	;;
    k)
	key_field=$OPTARG
	;;
    v)
	value_field=$OPTARG
	;;
    H)
	header='--header'
	;;
    esac
done

shift $((OPTIND-1))

if [ ! -z $debug ]; then
  echo KEY_FIELD = "${key_field}"
  echo VALUE_FIELD = "${value_field}"
  echo HEADER = "${header}"
fi

## file list in $@
function sortWithHeader() {
  res=/tmp/mj-`basename $1`
  awk 'NR==1; NR>1{print $0|"sort -n"}' $1 > ${res}
  echo "$res"
}


## check length
if [ $# -lt 2 ]; then
  echo At least two files are needed as input. Program exists
  exit 1
fi

if [ ${header}=="header" ]; then
  f1=$(sortWithHeader $1)
  f2=$(sortWithHeader $2)
else
  f1=$1
  f2=$2
fi

TMPS=()
TMPS+=($f1)
TMPS+=($f2)

joinOpts="${header} -a 1 -a 2 -j ${key_field} -o auto -e NA"
comm="join ${joinOpts} -e NA ${f1} ${f2}"
shift; shift;

for afile in "$@"; do
  tmpfile=$(sortWithHeader $afile)
  TMPS+=($tmpfile)
  comm="${comm} | join ${joinOpts} - ${tmpfile}"
done

if [ ! -z $debug ]; then
   echo COMM=$comm
fi

eval $comm

## remove tmp files
for tmp in "${TMPS[@]}"; do
  rm -f ${tmp}
done

exit 0

