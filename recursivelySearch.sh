#!/bin/bash

# Prompts the user to enter the name of the directory and the keyword.
read -p "Enter the name of the directory: " FILE
read -p "Enter the keyword: " KEYWORD

question2 () {
    # Deletes old modification_details.txt file
    rm -f "$FILE/Found/modification_details.txt"
    # Creates new modification_details.txt file
    touch "$FILE/Found/modification_details.txt"
    counter=0;
    for files in "$FILE/Found/"*.txt;
    do
        counter=$((counter+1));
        # Gets the last modification date of the file
        time=$(date -r "$files" +"%B %d, %Y at %H:%M"),
        # Gets the user who last modified the file
        user=$(stat -f "%Su" "$files")
        # Prints the last modification info of the file both on the screen and the file
        echo "FILE $counter $(basename $files) was modified by $user on $time"
        echo "FILE $counter $(basename $files) was modified by $user on $time" >> "$FILE/Found/modification_details.txt"
    done

}

question1 () {
    # Creates a directory named "Found" if it doesn't exist, if it does exist clears it
    if [ ! -d "Found" ] 
    then
        mkdir Found
    else
        rm -f "$FILE/Found/"*
    fi
    # Searches for the specified keyword in the directory
    find="$(grep -rl "$KEYWORD" "$FILE")"
    if [ -n "$(grep -r "$KEYWORD" "$FILE")" ]
        then
            # If the keyword is found, copies the files to the "Found" directory and changes their names
            echo "Files were copied to the Found directory!"
            cp $find $FILE/Found
            for file in "$FILE/Found/"*.txt;
            do
            mv "$file" "$FILE/Found/found_$(basename $file)"
            done
            question2

    else
        # If the keyword is not found, informs the user
        echo "Keyword not found in files!"
    fi 
}
# Calls the question1 function
question1







