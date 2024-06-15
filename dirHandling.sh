#!/bin/bash




create_directory() {
    extension=$1
    echo "Enter Directory Name"
    read -r dirname
    mkdir "$dirname"
    echo "-------------------------------OutPut-------------------------"
    echo "Directory Created Successfully"
    echo " "
}


delete_directory() {
    echo "Enter Directory Name to delete:"
    read -r dirname

    if [ -d "$dirname" ]; then
        rm -r "$dirname"
        echo "-------------------------------OutPut-------------------------"
        echo "Directory '$dirname' deleted successfully."
        echo " "
    else
        echo "Directory '$dirname' not found."
        echo " "
    fi
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


search_directories() {
    echo "Enter the keyword to search for directories:"
    read -r keyword

    # Use find to search for directories with the specified keyword
    found_directories=$(find . -type d -name "*$keyword*")

    if [ -n "$found_directories" ]; then
        echo "-------------------------------OutPut-------------------------"
        echo "Found directories matching '$keyword':"
        echo "$found_directories"
        echo " "
    else
        echo "No directories found matching '$keyword'."
        echo " "
    fi
}

# Example usage:
# Uncomment the line below to use the function in your script
# search_directories



i=0

while [ $i -lt 100 ]; do
    ./dirOption.sh
    read -r opt1

    case $opt1 in
        
        1)
            list_directories
            ;;
            
        2)
            create_directory
            ;;
        3)
            total_directories
            ;;
        4)
            total_files_in_current_directory
            ;;
        5)
            sort_files
            ;;
            
        6)
            delete_directory
            ;;
            
        7) 
            search_directories
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
./main.sh

