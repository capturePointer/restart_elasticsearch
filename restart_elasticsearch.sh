#/bin/sh
case "$(ps aux | grep elasticsearch | grep java | grep -v "grep" | wc -l)" in
0)  echo "+++++++++++start elasticsearch++++++++++"
	nohup /sbin/service elasticsearch start 1>/dev/null 2>&1 &
	sleep 1
    ;;
1)  # all ok
    ;;
*)  pids=(`ps aux | grep "elasticsearch" | grep -v "grep" | awk '{print $2}'`)
	length=${#pids[*]}
	j=0
	while [ $j -lt $length ]; do
		pid=${pids[$j]}
		kill -9 $pid
		j=`expr $j + 1`
	done
    ;;
esac


