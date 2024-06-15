#!/bin/bash

lock_file() {
    echo "Enter the name of the file to lock:"
    read -r file_name
    file_path=$(find . -name "$file_name" -type f)

    if [ -n "$file_path" ]; then
        echo "Enter a password to lock the file:"
        read -s password
        gpg --symmetric --cipher-algo AES256 --batch --yes --passphrase "$password" -o "${file_path}.gpg" "$file_path"
        echo "File locked successfully."
        rm "$file_path"  # Delete the original file
        echo "Original file deleted."
    else
        echo "File not found."
    fi
}

unlock_file() {
    echo "Enter the name of the locked file:"
    read -r locked_file
    echo "Enter the password to unlock the file:"
    read -s password
    gpg --decrypt --batch --yes --passphrase "$password" -o "${locked_file}" "${locked_file}.gpg"
    rm "${locked_file}.gpg"  # Delete the locked file
    echo "Unlocked file deleted."
}

echo "Choose an option:"
echo "1. Lock a file"
echo "2. Unlock a file"
read -r choice

case $choice in
    1)
        lock_file
        ;;
    2)
        unlock_file
        ;;
    *)
        echo "Invalid option. Exiting."
        ;;
esac

./advance.sh

