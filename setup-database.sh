#!/bin/bash

echo -n "Enter MySQL/MariaDB Username: "
read db_username

echo -n "Enter MySQL/MariaDB Password: "
read db_password

mysql --user="${db_username}" --password="${db_password}" -e exit
echo $?
