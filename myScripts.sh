#!/bin/sh
#Start <Code Area>
#start <Functions area>
database="./shapeDatabase.txt"
validator(){
       # regular expression that accepts only positve integer values
       re='^[+]?[0-9]+$'
       # regular expression that regects negative integer values
       re1='^[-][0-9]+$'
       if [[ $1 =~ $re1 ]]
       then 
              echo " Please Enter a Positive value!"
       elif  ! [[ $1 =~ $re ]]
       then
              echo " Please Enter a Numarical value!"
       elif  [[ $1 == 0 ]]
       then
              echo " Please Enter a non zero value!"
       else  
              return 1
       fi      
}

squareArea(){
       
read -p " Enter Square length: " length
validator $length
ret=$?
if [ $ret == 1 ]
then 
       area=$(($length*$length))
       echo " The square area is: $area"
       echo "Square: $area" >> $database
fi 
}

rectangleArea(){

read -p " Enter rectangle Length: " length
validator $length
ret=$?
if [ $ret == 1 ]
then      
       read -p " Enter rectangle Height: " height 
       validator $height
       ret=$?
       if [ $ret == 1 ]
       then
              area=$(($length*$height))
              echo " The rectangle area is: $area"
              echo "Reactangle: $area" >> $database             
       fi      
fi 
}

circuleArea(){
     
read -p " Enter circule radius: " radius
validator $radius
ret=$?
if [ $ret == 1 ]
then      
       area=$(($radius*$radius*22/7))
       echo " The circule area is: $area"
       echo "Circule: $area" >> $database   
fi        
}

triangleArea(){

read -p " Enter triangle Base length: " base
validator $base
ret=$?
if [ $ret == 1 ]
then
       read -p " Enter triangle Height: " height
       validator $height
       ret=$?
       if [ $ret == 1 ]
       then
              area=$(($base*$height/2))
              echo " The triangle area is: $area"
              echo "Triangle: $area" >> $database 
       fi
fi        
}

finish(){

    echo
    index=0  
    if [ -f $database ]
    then
       while IFS= read -r line
       do
              AREAS[$index]="$line"
              index=$((index+1))
       done < "$database"

       for i in "${AREAS[@]}"
       do
              echo $i
       done 
       rm "./shapeDatabase.txt"
    fi
    exit 0
}
#end <Functions area>
#infinite loop to read the shape type
while true 
do
#print the user Guide
    echo  -e "Choose your shape: \n Enter 1 for square \n Enter 2 for rectangle \n Enter 3 for circle \n Enter 4 for triangle \n Enter 0 to exit"
    read -p "Enter your Option: " input   
    case $input in
        1)squareArea ;;
        2)rectangleArea ;;
        3)circuleArea ;;
        4)triangleArea ;;
        0)finish ;;
        *)
        echo " Enter numbers from 0 to 4 only!"           
    esac    
done
#End of <Code Area>
