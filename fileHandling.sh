
list_files() {
    echo "List of files..."
    ls -p | grep -v /
    echo " "
}

create_single_file() {
    echo "Enter the name for the file:"
    read -r filename
    touch "$filename"
    echo "File '$filename' created successfully."
}

create_files() {
    echo "1- Single File Creation"
    echo "2- Multiple File Creation"
    read -r num

    if [ "$num" -eq 1 ]; then
        create_single_file
    else
        echo "Enter the number of files to create:"
        read -r num_files

        for ((i = 1; i <= num_files; i++)); do
            echo "Enter the name for file $i:"
            read -r filename
            touch "$filename"
            echo "File '$filename' created successfully."
        done

        echo "-------------------------------OutPut-------------------------"
        ls
        echo " "
    fi
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



i=0

while [ $i -lt 100 ]; do
    ./fileOption.sh
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
            list_files_with_extension
            ;;
          
        0)
            ./main.sh
            ;;
        *)
            echo "Invalid Input..Try again...."
            ;;
    esac
done
#./fileHandling.sh

