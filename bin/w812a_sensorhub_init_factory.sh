#!/system/bin/sh
PKG_DIR=/system/lib/modules
APP_DIR=/system/bin

cd $PKG_DIR
CUR_PKG_DIR=`pwd`
echo "CUR_PKG_DIR = $CUR_PKG_DIR"

cd $APP_DIR
CUR_APP_DIR=`pwd`
echo "CUR_APP_DIR = $CUR_APP_DIR"

#Program the Sensor hub 
echo "SensorHub Programming using loader APP"
sleep 1
./qlulpsh_loader_app -i ./ulpsh_s2_main_Jiaxiang_W812A_kxtik1009.shexe -b 1 -s 1 -t 10 -d
sleep 1
./qlulpsh_loader_app -c 1 -a 0002

echo "Starting SensorHub..."
echo 1 > /sys/devices/virtual/QL_Sensors/qlulpsh/intr_enable
echo 16 > /sys/devices/virtual/QL_Sensors/qlulpsh/FFE_RunCnt
sleep 1

cd /sys/devices/virtual/input/input4
echo 1 > enable

echo "Starting sensorservice..."
sensorservice &
