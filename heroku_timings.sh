heroku logs -n 1500 --source heroku --remote production |  gawk 'BEGIN {print "connect\tservice\tpath";} NR==1 {start_time=$1} //{match ($0, /path=([^[:space:]]*).*connect=([0-9]*).*service=([0-9]*)/, a); connect=a[2]; service=a[3]; path= a[1]; num++; t_c+=connect; t_s+=service; print connect "\t" service "\t" path;} END { print "\n\n------------------\nTOTAL REQUESTS\t" num "\nAVG CONNECT\t" (t_c/num) "\nAVG SERVICE\t" (t_s/num); print "start time\t" start_time; print "end time\t" $1}'
