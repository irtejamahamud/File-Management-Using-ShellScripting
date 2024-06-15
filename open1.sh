password_file="password.txt"

# Default password

# Check if the password file exists, create it if not
if [ ! -e "$password_file" ]; then
    echo "$password" > "$password_file"
fi


read_password() {
    if [ -f "$password_file" ]; then
        read -r -s password < "$password_file"
    else
        password=""
    fi
}

# Function to write the password to the file
write_password() {
    echo "$password" > "$password_file"
}

# Default password
read_password

echo "Enter Password to Login"
read -s current_password

if [ "$current_password" == "$password" ]; then
    ./main.sh
else
    echo "Incorrect current password. Try again"
fi

change_password() {
    echo "Enter the current password:"
    read -s current_password

    if [ "$current_password" == "$password" ]; then
        echo "Enter the new password:"
        read -s new_password
        password="$new_password"
        write_password
        echo "Password changed successfully."
    else
        echo "Incorrect current password. Password not changed."
    fi
}

# Main menu
while true; do
    echo "1. Try Again"
    echo "2. Change Password"
    echo "3. Exit"
    read -r choice

    case $choice in
        1)
            ./open.sh
            ;;
        2)
            change_password
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

