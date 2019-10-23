#!/bin/bash

fallos=0;

dir="./Cuad3"

echo "AVL ..."

for tad in `ls tads/avl`  
do
	echo "Probando [ $tad  ] ..." 
  
  g++ -Wall tads/avl/${tad} ${dir}/lib/tcalendario.cpp ${dir}/lib/tvectorcalendario.cpp ${dir}/lib/tlistacalendario.cpp ${dir}/lib/tavlcalendario.cpp -I./${dir}/include -o main 
  ./main > salida/avl/${tad}.sal
 
  comp=$(diff -b salida/avl/${tad}.sal salida_ok/avl/${tad}.sal)
  if [ "$comp" != "" ]; then
    echo "ERROR: "
    echo $comp;
    let fallos++;
  else
    echo "OK"
	fi

	echo ""
done

echo "NUM. FALLOS: $fallos";