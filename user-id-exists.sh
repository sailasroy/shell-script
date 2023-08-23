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

   
if id -u "$1" >/dev/null 2>&1; then
  echo "user exists"
else
  echo "user does not exist"
   useradd ramesh
fi
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