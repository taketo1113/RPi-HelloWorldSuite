#!/bin/sh

# for LED
echo "4" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio4/direction

while true; do
    echo DEBUG: LED ON
    echo 1 > /sys/class/gpio/gpio4/value
    sleep 0.5

    echo DEBUG: LED OFF
    echo 0 > /sys/class/gpio/gpio4/value
    sleep 0.5
done

# echo "4" > /sys/class/gpio/unexport
