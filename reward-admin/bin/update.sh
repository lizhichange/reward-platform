

path=

project=reward-platform
if [ ! -n "$1" ];then
  echo "NULL"
else
 path=$1
fi


cd  //home/fulihui/code/${project}${path}

git pull

mvn clean package -DskipTests


scp  /home/fulihui/code/${project}${path}/reward-admin/config/*  /home/fulihui/micro-sevr/${project}/reward-admin/config/.

scp  /home/fulihui/code/${project}${path}/reward-admin/target/reward-admin.jar  /home/fulihui/micro-sevr/${project}/reward-admin/.


