#!/bin/bash

lock_folder() {
    echo "Enter the name of the folder to lock:"
    read -r folder_name
    folder_path=$(find . -name "$folder_name" -type d)

    if [ -n "$folder_path" ]; then
        echo "Enter a password to lock the folder:"
        read -s password
        tar cz "$folder_path" | gpg --symmetric --cipher-algo AES256 --batch --yes --passphrase "$password" -o "${folder_path}.tar.gz.gpg"
        echo "Folder locked successfully."
        rm -r "$folder_path"  # Delete the original folder
        echo "Original folder deleted."
    else
        echo "Folder not found."
    fi
}

unlock_folder() {
    echo "Enter the name of the locked folder:"
    read -r locked_folder
    echo "Enter the password to unlock the folder:"
    read -s password
    gpg --decrypt --batch --yes --passphrase "$password" -o "${locked_folder}.tar.gz" "${locked_folder}.tar.gz.gpg"
    tar xzvf "${locked_folder}.tar.gz"
    rm "${locked_folder}.tar.gz"  # Delete the unlocked file
    echo "Unlocked folder deleted."
}

echo "Choose an option:"
echo "1. Lock a folder"
echo "2. Unlock a folder"
read -r choice

case $choice in
    1)
        lock_folder
        ;;
    2)
        unlock_folder
        ;;
    0)
        ./advance.sh
        ;;
    *)
        echo "Invalid option. Exiting."
        ;;
esac

