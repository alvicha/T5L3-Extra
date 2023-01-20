#!/bin/bash
num=$1
if [[ $num =~ ^[0-9]+$ ]]; then
  if [[ $num -lt 1 || $num -gt 1999 ]]; then
    echo "El número té que ser de l´1 fins al 1999"
  else
  romano=""
  numerals=(M CM D CD C XC L XL X IX V IV I)
  values=(1000 900 500 400 100 90 50 40 10 9 5 4 1)
  for i in ${!values[@]}; 
  do
    while [[ $num -ge ${values[i]} ]]; 
    do
      romano+="${numerals[i]}"
      num=$((num - ${values[i]}))
    done
  done
  echo "El número $1 en romà és: $romano";
 fi
 else
 echo "El número no és correcte o no és ni decimal ni romà"
 fi