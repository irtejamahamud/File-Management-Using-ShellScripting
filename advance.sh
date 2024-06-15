./advanceOption.sh

read -r choice

case $choice in
    1)
        ./filelock.sh
        ;;
    2)
        ./folderlock.sh
        ;;
    3)
        ./archiveFiles.sh
        ;;
    0)
        ./main.sh
        ;;
    *)
        echo "Invalid option. Exiting."
        ;;
esac
