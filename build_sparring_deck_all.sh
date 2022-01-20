#!/bin/bash

res=$(jq '.parameterSets | keys| .[]' sparring_deck_old.json)

for i in $res; do

#echo ${i}
#echo "sparring_deck_${i//*(\")/}"

openscad -o "sparring_deck_${i//*(\")/}.stl" -p sparring_deck.json -P ${i//*(\")/} sparring_deck.scad


done
