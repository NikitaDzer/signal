#!/bin/bash

make

echo "./sync 10 sender.txt receiver.txt"
./sync 10 sender.txt receiver.txt
