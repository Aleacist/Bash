#!/bin/bash
#Comentario de relleno para tener el minimo de un comentario en el script
script1(){
	# No cae
        echo "Di un numero:"
	read num
        fact=1
        while [ $num -gt 1 ]
        do
                fact=$((fact * num))
                ((num--))
        done
        echo $fact
}

script2(){
	echo "Que anyo quieres comprobar"
	read anyo
	if [[ $(($anyo%400)) -eq 0 || $(($anyo%4)) -eq 0 && $(($anyo%100)) -ne 0 ]]; then
		echo "Es bisiesto"
	else
		echo "no es bisiesto"
	fi
}

script3(){
	echo "Copia y pega del netplan"
}

script4(){
	alea=$(($RANDOM %100 + 1))
	echo $alea
	num=-1
	while [ $alea -ne $num ]
	do
		echo "Di un numero"
		read num
		((contador++))
		if [ $num -lt $alea ]; then
			echo "tu numero es mas pequeño"
		elif [ $num -gt $alea ]; then
			echo "tu numero es mas grande"
		else
			echo "los numeros son iguales y los has adivinado ne el intento"$contador
			break
		fi
	done
}

script5(){
	echo "Di una edad"
	read edad
	if [ $edad -lt 3 ]; then
		echo "Niñez"
	elif [ $edad -lt 10 ]; then
		echo "Infancia"
	elif [ $edad -lt 18 ]; then
		echo "Adolescencia"
	elif [ $edad -lt 40 ]; then
		echo "Juventud"
	elif [ $edad -lt 65 ]; then
		echo "Madurez"
	else
		echo "Vejez"
	fi
}

script6(){
	echo "Digame el fichero"
	read fichero
	ls -shiFA $fichero && df $fichero | awk '{print $8,$NF}'
}

script7(){
	echo "Archivo a contar"
	read fichero
	existe=$(find / -name $fichero -type f)
	if [ $existe ]; then
	grep -o [aeiouAEIOU] $fichero | wc -l
	else
	echo "no existe"
	fi
}

script8(){
	echo "Diga el directorio"
	read directorio
	find $directorio -type f | wc -l
}

script9(){
	echo "Diga el usuario"
	read user
	user=$(id $user)
	if [[ "$user" == *"sudo"* || "$user" == *"wheel"* || "$user" == *"root"* ]]; then
		echo "es superusuario"
	else
		echo "es usuario normal"
	fi
}

script10(){
	echo "Di un numero"
	read decnum
	while [ $decnum -gt 0 ] ; do
		if [ $decnum -ge 100 ] && [ $decnum -lt 201 ] ; then
			romanum="$romanum""C"
			decnum=$(( $decnum - 100 ))
		elif [ $decnum -ge 90 ] ; then
			romanum="$romanum""XC"
			decnum=$(( $decnum - 90 ))
		elif [ $decnum -ge 50 ] ; then
			romanum="$romanum""L"
			decnum=$(( $decnum - 50 ))
		elif [ $decnum -ge 40 ] ; then
			romanum="$romanum""XL"
			decnum=$(( $decnum - 40 ))
		elif [ $decnum -ge 10 ] ; then
			romanum="$romanum""X"
			decnum=$(( $decnum - 10 ))
		elif [ $decnum -ge 9 ] ; then
			romanum="$romanum""IX"
			decnum=$(( $decnum - 9 ))
		elif [ $decnum -ge 5 ] ; then
			romanum="$romanum""V"
			decnum=$(( $decnum - 5 ))
		elif [ $decnum -ge 4 ] ; then
			romanum="$romanum""IV"
			decnum=$(( $decnum - 4 ))
		elif [ $decnum -ge 1 ] ; then
			romanum="$romanum""I"
			decnum=$(( $decnum - 1 ))
		fi
	done
	echo $romanum
}

script11(){
	if [ "$(ls -A /mnt/usuarios)" ]; then
		for file in /mnt/usuarios; do
			filema=$(basename "$file")
			useradd filename
			while read -r line; do
				mkdir -p "/home/$filename/$line"
			done < "$file"
			rm "$file"
		done
	else
		echo "Esta vacio"
	fi
}

script12(){
	file_name=${1:-fichero_vacio}
	file_size=${2:-1024}
	fallocate -l $file_size $file_name
}

script13(){
	file_name=${1:-fichero_vacio}
	file_size=${2:-1024}
	if [ -e $file_name ]; then
		echo "Existe un fichero con ese nombre"
		i=1
		while [ -e $file_name$i ]; do
			if [ $i -eq 9 ]; then
				echo "Limite alcanzado, no se creara el archivo"
				return
			fi
			((i++))
		done
		echo "Se ha creado el archivo $file_name$i"
		fallocate -l $file_size $file_name$i
	else
		fallocate -l $file_size $file_name
	fi
}

script14(){
        echo $1 | tr 'aeiou' '12345'
}

script15(){
        user=$(ls /home/ | grep -v "copiaseguridad")
	echo "Hay $(echo $user | wc -w) usuarios en el sistema."
	echo "Los usuarios son: $user"
	read -p "selecione un usuario: " eleuser
	if echo $user | grep -wq $eleuser ; then
		sudo tar czf "/home/copiaseguridad/$eleuser""_""$(date +%Y-%m-%d-%T).tgz" /home/$eleuser
		echo "La copia de seguridad de $eleuser ha sido creada en $backup_dir/$backup_name"
	else
 		echo "El usuario seleccionado no existe en el sistema."
	fi
}

script16(){
	aprobados=0
	suspensos=0
	notas=0
        echo "Numero de alumnos"
	read num
	for (( i=0; i<$num; i++ )) ; do
		read -p "nota del alumno: " nota
		if [ $nota -lt 0 ] || [ $nota -gt 10 ]; then
			echo "Las notas dadas no son validas"
			return
		elif [ $nota -lt 5 ]; then
			((suspensos++))
		else
			((aprobados++))
		fi
			notas=$((notas+nota))
	done
	media=$((notas/num))
	echo "Suspendidos: $suspensos, aprobados: $aprobados,media: $media"
}

script17(){
	find $1 -name "* *" -type f | sort -rz |\
  	while read -d $'\0' f; do
		fclean=$(echo $f | tr " " "_")
		mv -v "$f" "$fclean"
	 done
}

script18(){
	for (( j=0 ; j<$3 ; j++ )); do
		valor=""
		for (( i=0 ; i<$2 ; i++ )); do
			valor+=$1
		done
		echo $valor
	done
}

script19(){ 
        echo "no"
}

script20(){
	comprobacion() {
		path=$1/*
		for file in $path; do
			if [ -d $file ]; then
        	        	comprobacion $file $2
        		else
        			((i++))
        		   	mv $file /home/proyecto/$2/$file
        		        echo $file | sed "s|/home/$2/|$i:|g"  >> /var/log/bajas.log
        		fi
        	done
	}
	i=0
        if ! [ -e $1 ]; then
		echo "el fichero no existe"
		return;
	fi
	if [ $# -ne 1 ]; then
		echo "solo un parametro"
		return;
	fi
	while IFS=':' read -r nombre apellido segundoapellido usuario; do
		if [[ $(getent passwd $usuario) ]]; then
			mkdir /home/proyecto/$usuario
			echo "$(date +%d/%m/%Y-%T)-$usuaro-/home/proyecto/$usuario" >> /var/log/bajas.log
			comprobacion /home/$usuario $usuario
			chown -R root:root /home/proyecto/$usuario
			userdel $usuario
			rm -r /home/$usuario
		else
			echo "$(date +%d/%m/%Y-%T)-$usuario-$apellido-$segundoapellido-/home/proyecto/$usuario-No existe en el sistema" >> /var/log/bajaserror.log
		fi
	done < "$1"
	echo "El total de ficheros movidos es $i" >> /var/log/bajas.log
}

Opt=0
echo "Elije el numero del script a ejecutar"
for i in {1..20}; do
	echo $i".- Para el script "$i
done
echo "21.- Salir"
while [ $Opt != 21 ]
do
	echo "Di numero del script"
	read Opt
	case $Opt in
		1) script1;;
		2) script2;;
		3) script3;;
        	4) script4;;
        	5) script5;;
        	6) script6;;
        	7) script7;;
        	8) script8;;
        	9) script9;;
		10) script10;;
 		11) script11;;
		12)
		read -p "indical en nombre del fichero: " fichero
		read -p "indica el tamaño del fichero " tamanio
		script12 $fichero $tamanio
		sleep 1;;
		13) 
		read -p "indical en nombre del fichero: " fichero
		read -p "indica el tamaño del fichero " tamanio
		script13 $fichero $tamanio;;
 		14)
 		read -p "pase el texto: " texto
 		script14 $texto;;
 		15) script15;;
 		16) script16;;
 		17) 
 		echo "Diga el directorio"
 		read directorio
 		script17 $directorio;;
 		18)
		read -p "Parametro 1 " p1
		read -p "Parametro 2 " p2
		read -p "Parametro 3 " p3
		script18 $p1 $p2 $p3 ;;
		19) script19;;
 		20)
		read -p "fichero  " p1
		script20 $p1;;
 		21) echo "Saliste";;
		*) echo " no sirve este numero";;
	esac
done
