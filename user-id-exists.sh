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

    useradd roy

for i in $@
do  
id $i >>$LOGFILE
if [ $? -ne 0 ]
then
echo "User $i not exists"
useradd $i
VALIDATE $? "Creating user"
else
echo "user $i already exists"
fi