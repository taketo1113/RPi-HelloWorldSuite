#!/bin/sh

# '.'(dit) / '-'(dah) / ' '(between letters) / '_'(between words)
str_m='.... . .-.. .-.. --- --..--_.-- --- .-. .-.. -..' # hello, world

# for LED
echo "4" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio4/direction

echo "input: hello, world"
echo -n "$str_m" | sed 's/\./=./g' | sed 's/-/===./g' | sed 's/\. / /g' | sed 's/ /.../g' | sed 's/\._/_/g' | sed 's/_/......./g'| sed 's/./&\n/g' | while read state; do
    if [ "$state" = '=' ]; then
	echo -n =
	echo 1 > /sys/class/gpio/gpio4/value; sleep 0.05
    else
	echo -n .
	echo 0 > /sys/class/gpio/gpio4/value; sleep 0.05
    fi
done

# echo "4" > /sys/class/gpio/unexport
