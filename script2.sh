read -p "enter the device where you want your partition (like sdb1)"  answer
bash res/createPartition.sh $answer | tee logFiles/log3

if grep -q 'WARNING' logFiles/log3; then
   exit 1
fi
bash res/setLfsVar.sh
bash res/mountPartition.sh $answer
if grep -q 'ERROR' logFiles/mountPartLog; then
    printf "\n mountPartition.sh script error, see mountPartLog \n"
    exit 1
fi

echo "now log as root(su root) and execute next script (script3.sh)"

su root
