USERID=$(id -u)
   
if [ $USERID -ne 0 ]
    then
    echo "ERROR :: sign in with root access"
    exit 1
    fi 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $2 ....$R FAILURE $N"
         exit 1
    else
         echo -e " Installing $2 ....$G SUCCESS $N"
    fi

}

    DATE=$(date +%F)
    SCRIPT_NAME=$0
    LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
    R="\e[31m"
    G="\e[32m"
    N="\e[0m"

  ##USERNAME=$(id $@)

  for i in $@
  do
  id $i
  if [ $? -ne 0 ]
 then
 echo "User name does not exist"
 useradd $i
 else 
 echo "Username already exists"
 fi
 done
# useradd karan
# if [ "id $1" -ne 0 ] ;
# then
# echo "User name does not exist"
# else
# echo "Username exists"

# fi
# for i in $@
# do
# if getent passwd $1 > /dev/null 2>&1; then
#     echo "yes the user exists"
# else
#     echo "No, the user does not exist"
     
##useradd rustfuckam
fi
done
# if id "$1" &>/dev/null; 
# then
#     echo 'user found'
# else
#     echo 'user not found'
# fi
# for i in $@
# do
# id $i
# if [ $? -ne 0 ]
# then
# echo "Username does not exist"
# ##useradd moses
# else
# echo "Username exists"
# fi
# done
# # getent passwd $@  

# if [ $? -ne 0 ]; then
#     echo "No, the user does not exist"
# else
#     echo "yes the user exists"
# fi
##sh user-exists.sh
#     if getent passwd $1 > /dev/null 2>&1; then
#     echo "yes the user exists"
# else
#     echo "No, the user does not exist"
# fi

#  for i in $@
#  do  
#  id $i 
#  if [ $? -ne 0 ]
#  then
#  echo "User $i not exists"
#  echo "Creating user $i"
#  else
#  echo "user $i already exists"
#  fi
#  done