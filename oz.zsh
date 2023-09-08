function oz() {
    local filename
    filename=$(find . -type f -name "*$1*.oz" -not -name "*$1*.ozf")
    if [ -z "$filename" ]; then
        echo "No matching .oz file found."
    else
        ozc -c "$filename" && ozem "${filename%.oz}.ozf"
    fi
}
alias oz=oz

