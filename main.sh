./mainOption.sh
read -r choice

case $choice in
    1)
        ./file.sh
        ;;
    2)
        ./dirHandling.sh
        ;;
    3)
        ./advance.sh
        ;;
    0)
            echo "Good Bye.."
            echo "Successfully Exit"
            ;;
    *)
        echo "Invalid option. Exiting."
        ;;
esac
