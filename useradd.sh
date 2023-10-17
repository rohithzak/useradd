#!/bin/bash

usernames=("user")

for username in "${usernames[@]}"; do
    home_dir="/home/$username"

    sudo useradd -m -d "$home_dir" -s /bin/bash "$username"

    cd "$home_dir"

    sudo -u "$username" ssh-keygen -t rsa -b 2048 -f "$home_dir/.ssh/id_rsa" -N ""

    sudo -u "$username" cp "$home_dir"/.ssh/id_rsa.pub "$home_dir"/.ssh/authorized_keys

    echo "User '$username' added with home directory '$home_dir'."
done

