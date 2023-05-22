#!/bin/bash
#Factorial      
	echo "Di un numero:"
	read num
       fact=1
        while [ $num -gt 1 ]
        do
                fact=$((fact * num))
                ((num--))
        done
        echo $fact