#!/bin/bash
chmod +x ./get_inf.sh
source ./get_inf.sh

echo -e "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n$TOP_FOLDERS"
echo -e "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo -e "Configuration files (with the .conf extension) = $CONF"
echo -e "Text files = $TEXT"
echo -e "Executable files = $EXEC"
echo -e "Log files (with the extension .log) = $EXEC"
echo -e "Archive files = $ARCH"
echo -e "Symbolic links = $SYMB"
echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):\n$MAXIMUM_SIZE_FILES"
echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n$MAXIMUM_SIZE_EXEC"

