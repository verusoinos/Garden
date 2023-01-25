#!/bin/bash

RNUM=$(($RANDOM % 7))

for ((run=1; run <= RNUM + 1; run++))
do
  # Generate 5 random strings
  for i in {1..5}; do
    random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    echo $random_string >> a.txt
  done

  /usr/bin/git -C ~/garden/ add a.txt
  /usr/bin/git -C ~/garden/ commit -m "Added random strings to a.txt"
done

bash ~/garden/commit.sh
/usr/bin/git -C ~/garden push -u https://{github:token}/{verusoinos:name}/{Garden:repos}.git main
