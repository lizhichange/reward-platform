

path=

project=reward-platform
if [ ! -n "$1" ];then
  echo "NULL"
else
 path=$1
fi


cd  //home/fulihui/javacode/${project}${path}

git pull

mvn clean package -DskipTests


scp  /home/fulihui/javacode/${project}${path}/eureka-server/config/*  /home/fulihui/micro-svr/${project}/eureka-server/config/.

scp  /home/fulihui/javacode/${project}${path}/eureka-server/target/eureka-server.jar  /home/fulihui/micro-svr/${project}/eureka-server/.
