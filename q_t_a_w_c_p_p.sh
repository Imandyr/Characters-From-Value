#!/bin/bash

# A bash script to compile, link, and execute file, that uses an assembly function a C++ code.
# Use: ./q_t_a_w_c_p_p.sh quad_to_ascii_1 use_q_t_a_1

ass_file="$1"
cpp_file="$2"

as "${ass_file}".s -o "${ass_file}".o
g++ "${cpp_file}".cpp -o "${cpp_file}".o -c
g++ "${ass_file}".o "${cpp_file}".o -o "${cpp_file}"

eval "./${cpp_file}"
