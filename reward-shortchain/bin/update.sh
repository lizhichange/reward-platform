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


scp  /home/fulihui/code/${project}${path}/reward-shortchain/config/*  /home/fulihui/micro-sevr/${project}/reward-shortchain/config/.

scp  /home/fulihui/code/${project}${path}/reward-shortchain/target/reward-shortchain.jar  /home/fulihui/micro-sevr/${project}/reward-shortchain/.


