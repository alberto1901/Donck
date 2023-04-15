#!/usr/bin/env bash

#convert obj to ac and adjust texture directory, list model parts

input=/home/jeff/models/3d_models/ships/Donck/donck.obj
output=/home/jeff/FlightGear/Aircraft/Donck/Models/Donck.ac
parts=/home/jeff/FlightGear/Aircraft/Donck/Models/model_parts.txt

echo "CONVERTING:";
echo $input;
echo $output;

#convert file
ruby /home/jeff/models/UVF-7-original/convert2.rb $input $output;
echo "FINISHED CONVERSION.";

#change texture path to FGFS airplane livery directory
echo 'EDITING TEXTURE PATH:'
find $output -type f -exec sed -i 's/texture "/texture "Liveries\//g' {} \;

echo 'CREATING PARTS LIST FILE (model_parts.txt):'
grep 'name "' $output > tmp.txt
sort tmp.txt > $parts
rm tmp.txt
sed -i 's/name "/<object-name>/' $parts
sed -i 's/"/<\/object-name>/' $parts

echo "ALL DONE.";
