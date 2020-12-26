

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


scp  /home/fulihui/code/${project}${path}/reward-mp/config/*  /home/fulihui/micro-sevr/${project}/reward-mp/config/.

scp  /home/fulihui/code/${project}${path}/reward-mp/target/reward-mp.jar  /home/fulihui/micro-sevr/${project}/reward-mp/.
