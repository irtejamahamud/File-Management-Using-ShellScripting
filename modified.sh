#!/bin/bash

list_files() {
    echo "List all files and Directories here.."
    echo "Showing all files and directories...."
    sleep 3
    echo "Loading.."
    sleep 3
    echo "-------------------------------OutPut-------------------------"
    ls
    echo " "
}

create_files() {
    echo "Create New Files here.."
    echo "Which type of file you want to create !"
    echo "1- .c"
    echo "2- .sh"
    echo "3- .txt"
    echo "Enter your choice from 1-3"
    read -r filechoice

    case $filechoice in
        1)
            create_file_with_extension ".c"
            ;;
        2)
            create_file_with_extension ".sh"
            ;;
        3)
            create_file_with_extension ".txt"
            ;;
        *)
            echo "Invalid Input..Try Again."
            echo " "
            ;;
    esac
}

create_file_with_extension() {
    extension=$1
    echo "Enter File Name without $extension Extension"
    read -r filename
    touch "$filename$extension"
    echo "-------------------------------OutPut-------------------------"
    echo "File Created Successfully"
    echo " "
}

delete_files() {
    echo "Delete existing files here.. "
    echo "Enter name of File you want to Delete!"
    echo "Note: Please Enter the full Name with Extension."
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
}

rename_files() {
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
}

edit_file_content() {
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
}

search_files() {
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
}

details_of_file() {
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
}

view_content_of_file() {
    echo "View content of file here.."
    echo "Enter File Name : "
    read -r readfile
    echo "-------------------------------OutPut-------------------------"
    if [ -f "$readfile" ]; then
        echo "Showing file content.."
        sleep 3
        cat "$readfile"
    else
        echo "$readfile does not exist"
    fi
    echo " "
}

sort_file_content() {
    echo "Sort files content here.."
    echo "Enter File Name with Extension to sort :"
    read -r sortfile
    echo "-------------------------------OutPut-------------------------"
    if [ -f "$sortfile" ]; then
        echo "Sorting File Content.."
        sleep 3
        sort "$sortfile"
    else
        echo "$sortfile File does not exist..Try again."
    fi
    echo " "
}

list_directories() {
    echo "-------------------------------OutPut-------------------------"
    echo "List of all Directories here.."
    echo "showing all Directories..."
    echo "Loading.."
    sleep 3
    ls -d */
    echo " "
}

list_files_with_extension() {
    echo "List of Files with Particular extensions here.."
    echo "Which type of file list you want to see?"
    echo "1- .c"
    echo "2- .sh"
    echo "3- .txt"
    echo "Enter your choice from 1-3"
    read -r extopt
    echo "-------------------------------OutPut-------------------------"
    case $extopt in
        1)
            echo "List of .c Files shown below."
            echo "Loading.."
            sleep 3
            ls *.c
            ;;
        2)
            echo "List of .sh Files shown below."
            echo "Loading.."
            sleep 3
            ls *.sh
            ;;
        3)
            echo "List of .txt Files shown below."
            echo "Loading.."
            sleep 3
            ls *.txt
            ;;
        *)
            echo "Invalid Input..Try again.."
            ;;
    esac
    echo " "
}

total_directories() {
    echo "-------------------------------OutPut-------------------------"
    echo "Total number of Directories here.."
    echo "Loading all directories.."
    sleep 3
    echo "Counting.."
    sleep 3
    echo "Number of Directories are : "
    echo */ | wc -w
    echo " "
}

total_files_in_current_directory() {
    echo "-------------------------------OutPut-------------------------"
    echo "Total Numbers of Files in Current Directory here.."
    echo "Loading all files.."
    sleep 3
    echo "Number of Files are : "
    ls -l | grep -v 'total' | grep -v '^d' | wc -l
    echo " "
}

sort_files() {
    echo "-------------------------------OutPut-------------------------"
    echo "Sort Files here.."
    echo "Your Request of Sorting file is Generated."
    echo "Sorting.."
    sleep 3
    ls | sort
    echo " "
}

archive_largeFiles() {
# Create a directory named "archived" if it doesn't exist
if [ ! -d "archived" ]; then
    mkdir archived
fi

# Find files larger than 20KB in the current directory
files=$(find . -type f -size +20k)

# Compress and move files larger than 20KB to the "archived" folder
for file in $files; do
    gzip -c "$file" > "archived/$(basename "$file").gz"
    rm "$file" # Remove the original file after compression
done
}
i=0

while [ $i -lt 100 ]; do
    ./hi.sh
    read -r opt1

    case $opt1 in
        1)
            list_files
            ;;
        2)
            create_files
            ;;
        3)
            delete_files
            ;;
        4)
            rename_files
            ;;
        5)
            edit_file_content
            ;;
        6)
            search_files
            ;;
        7)
            details_of_file
            ;;
        8)
            view_content_of_file
            ;;
        9)
            sort_file_content
            ;;
        10)
            list_directories
            ;;
        11)
            list_files_with_extension
            ;;
        12)
            total_directories
            ;;
        13)
            total_files_in_current_directory
            ;;
        14)
            sort_files
            ;;
            
        15)
            archive_largeFiles
            ;;    
        0)
            echo "Good Bye.."
            echo "Successfully Exit"
            break
            ;;
        *)
            echo "Invalid Input..Try again...."
            ;;
    esac

    i=$((i + 1))
done

