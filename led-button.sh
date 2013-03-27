#!/bin/sh

# for LED
echo "4" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio4/direction

# for Button
echo "17" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio17/direction

while true; do
    if [ `cat /sys/class/gpio/gpio17/value` -eq 1 ]; then
	echo DEBUG: LED ON
	echo 1 > /sys/class/gpio/gpio4/value
	sleep 0.1
    else
	echo DEBUG: LED OFF
	echo 0 > /sys/class/gpio/gpio4/value
	sleep 0.1
    fi
done

# echo "4" > /sys/class/gpio/unexport
# echo "17" > /sys/class/gpio/unexport
