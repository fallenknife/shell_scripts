#!/bin/bash
START=$(date +%s)

TARGET=$1

TOTAL_FOLDERS=$(find "$TARGET" -type d | wc -l)
TOP_FOLDERS=$(sudo du -h "$TARGET"* | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')
TOTAL_FILES=$(sudo find "$TARGET" -type f | wc -l)
CONF=$(sudo find "$TARGET" -type f -name "*.conf" | wc -l)
TEXT=$(sudo find "$TARGET" -type f -exec file {} \; | grep -c "text")
EXEC=$(sudo find "$TARGET" -type f -executable | wc -l)
LOG=$(sudo find "$TARGET" -type f -name "*.log" | wc -l)
ARCH=$(sudo find "$TARGET" -type f \( -iname "*.tar" -o -iname "*.gz" -o -iname "*.zip" -o -iname "*.rar" -o -iname "*.7z" \) | wc -l)
SYMB=$(sudo find "$TARGET" -type l | wc -l)

MAXIMUM_SIZE_FILES=$(
  COUNTER=1
  sudo find "$TARGET" -type f -exec du -b {} + 2>/dev/null | sort -nr | head -n 10 | while read size file; do
    TYPE=$(file -b "$file" | awk '{print tolower($1)}')
    HR_SIZE=$(numfmt --to=iec --format="%.0f" "$size" | sed -E 's/([A-Z])$/ \1B/')
    echo "$COUNTER - $file, $HR_SIZE, $TYPE"
    COUNTER=$((COUNTER + 1))
  done
)

MAXIMUM_SIZE_EXEC=$(
  COUNTER=1
  sudo find "$TARGET" -type f -executable -exec du -b {} + 2>/dev/null | sort -nr | head -n 10 | while read size file; do
    HASH=$(md5sum "$file" | awk '{print $1}')
    HR_SIZE=$(numfmt --to=iec --format="%.0f" "$size" | sed -E 's/([A-Z])$/ \1B/')
    echo "$COUNTER - $file, $HR_SIZE, $HASH"
    COUNTER=$((COUNTER + 1))
  done
)
