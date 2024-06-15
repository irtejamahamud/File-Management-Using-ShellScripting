# Create a directory named "archived" if it doesn't exist
if [ ! -d "archived" ]; then
    mkdir archived
fi

# Find files larger than 20KB in the current directory
files=$(find . -type f -size +20k)

# Compress and move files larger than 20KB to the "archived" folder
for file in $files; do
    gzip -c "$file" > "archived/$(basename "$file").zip"
    rm "$file" # Remove the original file after compression
done

echo "Large Files Archived Successfully."

./advance.sh
