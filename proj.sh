#!/bin/bash

i="0"

while [ $i -lt 100 ]; do
    gcc project.c -o proj
    ./proj
    read -r opt1

    if [ "$opt1" == 1 ]; then
        echo "List all files and Directories here.."
        echo "Showing all files and directories...."
        sleep 3
        echo "Loading.."
        sleep 3
        echo "-------------------------------OutPut-------------------------"
        ls
        echo " "
    elif [ "$opt1" == 2 ]; then
        echo "Create New Files here.."
        echo "Which type of file you want to create !"
        echo "1- .c"
        echo "2- .sh"
        echo "3- .txt"
        echo "Enter your choice from 1-3"
        read -r filechoice

        if [ "$filechoice" == 1 ]; then
            echo "Enter File Name without .c Extension"
            read -r filename
            touch "$filename.c"
            echo "-------------------------------OutPut-------------------------"
            echo "File Created Successfully"
            echo " "
        elif [ "$filechoice" == 2 ]; then
            echo "Enter File Name without .sh Extension"
            read -r filename2
            touch "$filename2.sh"
            echo "-------------------------------OutPut-------------------------"
            echo "File Created Successfully"
            echo " "
        elif [ "$filechoice" == 3 ]; then
            echo "Enter File Name without .txt Extension"
            read -r filename3
            touch "$filename3.txt"
            echo "-------------------------------OutPut-------------------------"
            echo "File Created Successfully"
            echo " "
        else
            echo "Invalid Input..Try Again."
            echo " "
        fi
    elif [ "$opt1" == 3 ]; then
        echo "Delete existing files here.. "
        echo "Enter name of File you want to Delete!"
        echo "Note: Please Enter full Name with Extension."
        read -r delfile
        echo "-------------------------------OutPut-------------------------"
        if [ -f "$delfile" ]; then
            rm "$delfile"
            echo "Successfully Deleted."
            echo " "
        else
            echo "File Does not Exist..Try again"
            echo " "
        fi
    elif [ "$opt1" == 4 ]; then
        echo "-------------------------------OutPut-------------------------"
        echo "Rename files here.."
        echo "Enter Old Name of File with Extension.."
        read -r old
        echo "Checking for file..."
        sleep 3
        if [ -f "$old" ]; then
            echo "Ok File Exist."
            echo "Now Enter New Name for file with Extension"
            read -r new
            mv "$old" "$new"
            echo "Successfully Rename."
            echo "Now Your File Exist with $new Name"
        else
            echo "$old does not exist..Try again with correct filename."
        fi
        echo " "
    elif [ "$opt1" == 5 ]; then
        echo "Edit file content here.."
        echo "Enter File Name with Extension : "
        read -r edit
        echo "-------------------------------OutPut-------------------------"
        echo "Checking for file.."
        sleep 3
        if [ -f "$edit" ]; then
            echo "Opening file.."
            sleep 3
            nano "$edit"
            echo " "
        else
            echo "$edit File does not exist..Try again."
        fi
    # Continue with similar structures for other options (6
    elif [ "$opt1" == 6 ]; then
            echo "Search files here.."
            echo "Enter File Name with Extension to search"
            read -r f
            echo "-------------------------------OutPut-------------------------"
            if [ -f "$f" ]; then
                echo "Searching for $f File"
                echo "File Found."
                find /home -name "$f"
                echo " "
            else
                echo "File Does not Exist..Try again."
                echo " "
            fi
        elif [ "$opt1" == 7 ]; then
            echo "Detail of file here.."
            echo "Enter File Name with Extension to see Detail : "
            read -r detail
            echo "-------------------------------OutPut-------------------------"
            echo "Checking for file.."
            sleep 4
            if [ -f "$detail" ]; then
                echo "Loading Properties.."
                stat "$detail"
            else
                echo "$detail File does not exist..Try again"
            fi
        
            echo " "
        elif [ "$opt1" == 0 ]; then
            
            echo "Program Terminated"
            break
        else
            echo "Invalid Input..Try something valid...."
        fi

        i=$((i + 1))
    done
