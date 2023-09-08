alias ozc='/Applications/Mozart2.app/Contents/Resources/bin/ozc'
alias ozemulator='/Applications/Mozart2.app/Contents/Resources/bin/ozemulator'
alias ozem='/Applications/Mozart2.app/Contents/Resources/bin/ozemulator'
alias ozengine='/Applications/Mozart2.app/Contents/Resources/bin/ozengine'
alias ozwish='/Applications/Mozart2.app/Contents/Resources/bin/ozwish'
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

