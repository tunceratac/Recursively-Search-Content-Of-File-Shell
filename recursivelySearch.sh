#!/bin/bash

read -p "Enter the name of the directory: " FILE
read -p "Enter the keyword: " KEYWORD

question2 () {
    rm -f "$FILE/Found/modification_details.txt"
    touch "$FILE/Found/modification_details.txt"
    counter=0;
    for files in "$FILE/Found/"*.txt;
    do
        counter=$((counter+1));
        time=$(date -r "$files" +"%B %d, %Y at %H:%M"),
        user=$(stat -f "%Su" "$files")
        echo "FILE $counter $(basename $files) was modified by $user on $time"
        echo "FILE $counter $(basename $files) was modified by $user on $time" >> "$FILE/Found/modification_details.txt"
    done

}

question1 () {
    if [ ! -d "Found" ] 
    then
        mkdir Found
    else
        rm -f "$FILE/Found/"*
    fi
    find="$(grep -rl "$KEYWORD" "$FILE")"
    if [ -n "$(grep -r "$KEYWORD" "$FILE")" ]
        then
            echo "Files were copied to the Found directory!"
            cp $find $FILE/Found
            for file in "$FILE/Found/"*.txt;
            do
            mv "$file" "$FILE/Found/found_$(basename $file)"
            done
            question2

    else
        echo "Keyword not found in files!"
    fi 
}
question1







