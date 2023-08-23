if id "$1" >/dev/null 2>&1; then
    echo "User exists"
else
    echo "User does not exist"
fi