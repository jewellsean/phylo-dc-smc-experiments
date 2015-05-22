#!/bin/bash

# Order of input variables
# 1. template file
# 2. out file
# 3. %WALL_TIME%
# 4. %MEMORY%
# 5. %FILE%

sed -e "s;%WALL_TIME%;$3;g" -e "s;%MEMORY%;$4;g" -e "s;%FILE%;$5;g" $1 > $2 
