#!/bin/bash

PROGRAMS_DIR="./programs"
REPORT_FILE="test_report.txt"

echo "Test Report - $(date)" > $REPORT_FILE
echo "=====================================" >> $REPORT_FILE

echo "Compiling and testing all C++ programs in $PROGRAMS_DIR..."

# Loop through all .cpp files in the directory
for cpp_file in $PROGRAMS_DIR/*.cpp; do
    if [ -f "$cpp_file" ]; then
        exe_file="${cpp_file%.cpp}"
        
        echo "Compiling $cpp_file..."
        g++ -o "$exe_file" "$cpp_file" 2>> $REPORT_FILE
        
        if [ $? -eq 0 ]; then
            echo "Running tests on $exe_file..."
            
            for i in {1..5}; do
                TEST_INPUT="test${i}.txt"
                TEST_OUTPUT="${exe_file}_output${i}.txt"
                
                echo "Running test case $i for $exe_file..."
                ./$exe_file < $TEST_INPUT > "$TEST_OUTPUT"
                
                echo "Test results for $cpp_file - Test $i:" >> $REPORT_FILE
                cat "$TEST_OUTPUT" >> $REPORT_FILE
                echo "-------------------------------------" >> $REPORT_FILE
                rm $TEST_OUTPUT
            done
            rm "$exe_file"
        else
            echo "Compilation failed for $cpp_file!" >> $REPORT_FILE
        fi
    fi
done

echo "Testing complete. Check $REPORT_FILE for details."
