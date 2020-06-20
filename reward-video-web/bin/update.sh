path=

project=reward-platform
if [ ! -n "$1" ]; then
  echo "NULL"
else
  path=$1
fi

cd //home/fulihui/code/${project}${path}

git pull

mvn clean package -DskipTests

scp /home/fulihui/code/${project}${path}/reward-video-web/config/* /home/fulihui/micro-sevr/${project}/reward-video-web/config/.

scp /home/fulihui/code/${project}${path}/reward-video-web/target/reward-video-web.jar /home/fulihui/micro-sevr/${project}/reward-video-web/.
