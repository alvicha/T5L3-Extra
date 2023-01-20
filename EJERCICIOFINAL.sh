#!/bin/bash
num=$1;

if [[ -n $1 ]]; then
if [[ $num =~ ^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$ ]]; 
then
 pos=`expr ${#1} - 1` 
prev=0 
result=0 
while [ $pos -ge 0 ];do 
	case "${1:$pos:1}"
	in 
		M) factor=1000 ;; 
		D) factor=500 ;; 
		C) factor=100 ;; 
		L) factor=50 ;; 
		X) factor=10 ;; 
		V) factor=5 ;; 
		I) factor=1 ;; 
	esac 

	if [ $factor -lt $prev ];then 
		result=`expr $result - $factor` 
	else 
		result=`expr $result + $factor` 
	fi 
	prev=$factor 
	pos=`expr $pos - 1`
done
echo "El numero $1 en decimal és: $result"
 elif [[ $num =~ ^[0-9]+$ ]]; then
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
 else
 echo "No hi ha ningú tipus de parametre introduït."
 fi
