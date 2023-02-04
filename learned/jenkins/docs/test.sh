#!/bin/bash

read -r input_string

result=`echo $input_string | sed 's/[-> ]//g' | tr -s '/'`

echo $result
