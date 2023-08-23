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

  USER_ROBOSHOP=$(id roboshop)
if [ $? -ne 0 ];
then 
    echo -e "$Y...USER roboshop is not present so creating one now..$N"
    useradd roboshop &>>$LOGFILE
else 
    echo -e "$G...USER roboshop is already present so  skipping now.$N"
 fi

#write a condition to check directory already exist or not
VALIDATE_APP_DIR=$(cd /app)
#write a condition to check directory already exist or not
if [ $? -ne 0 ];
then 
    echo -e " $Y /app directory not there so creating one $N"
    mkdir /app &>>$LOGFILE   
else
    echo -e "$G /app directory already present so skipping ....$N" 
    fi

#   for i in $@
#   do
#   id $i
#   if [ $? -ne 0 ]
#  then
#  echo "User name does not exist"
#  useradd $i
#  else 
#  echo "Username already exists"
#  fi
#  done
