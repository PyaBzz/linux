ds4prefix="0003:054C:09CC.*"
ledR=$ds4prefix:red/brightness
ledG=$ds4prefix:green/brightness
ledB=$ds4prefix:blue/brightness

cd /sys/class/leds

FILES=("$ds4prefix:*/brightness")

for FILE in $FILES; do
    if [[ $(stat -c "%a" $FILE) != 777 ]]; then
        sudo chmod 777 $FILE
    fi
done

if [[ $# > 0 ]]; then
    echo $1 >$ledR
fi

if [[ $# > 1 ]]; then
    echo $2 >$ledG
fi

if [[ $# > 2 ]]; then
    echo $3 >$ledB
fi
