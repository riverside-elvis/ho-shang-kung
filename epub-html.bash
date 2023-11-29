# Add css to the raw markdown.
while IFS= read -r line; do
    if [[ "$line" =~ ^#[[:space:]]Ch.* ]]; then
        echo "${line} {.hsg}"
    else
        echo "$line"
    fi
done < "$1"
