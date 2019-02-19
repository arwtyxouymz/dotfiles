
get_password() {
    printf "Password: "
    read -s PASSWORD
    echo
    printf "Confirm : "
    read -s PASSWORD_CONFIRM
    echo
    if [ "$PASSWORD" != "$PASSWORD_CONFIRM" ]; then
        echo -e "\e[31mPassword is not same.\e[0m"
        exit 1
    fi
    export $PASSWORD
}
