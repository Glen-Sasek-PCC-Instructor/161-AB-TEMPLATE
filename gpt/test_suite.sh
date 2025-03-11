#!/bin/bash

echo "Running test cases for Miles Tracker Program"

g++ -o fin fin.cpp  # Compile the C++ program

if [ $? -ne 0 ]; then
    echo "Compilation failed. Exiting."
    exit 1
fi

# Test case 1: Goal met exactly
echo -e "50\n10\n10\n10\n10\n10\n10\n10" > test1.txt
./fin < test1.txt > output1.txt

echo "Test 1 completed: Goal met exactly"

# Test case 2: Goal exceeded
echo -e "50\n15\n15\n15\n15\n15\n15\n15" > test2.txt
./fin < test2.txt > output2.txt

echo "Test 2 completed: Goal exceeded"

# Test case 3: Goal missed
echo -e "50\n5\n5\n5\n5\n5\n5\n5" > test3.txt
./fin < test3.txt > output3.txt

echo "Test 3 completed: Goal missed"

# Test case 4: Negative miles entered initially
echo -e "50\n-5\n10\n10\n10\n10\n10\n10\n10" > test4.txt
./fin < test4.txt > output4.txt

echo "Test 4 completed: Handles negative miles"

# Test case 5: Goal is zero
echo -e "0" > test5.txt
./fin < test5.txt > output5.txt

echo "Test 5 completed: Zero goal"

echo "All test cases executed. Check output files for results."
