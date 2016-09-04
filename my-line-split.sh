split_line=$1
file=$2
total_line=$(wc -l <$file)
prefix=$file.split.
i=1
begin_line=1
while [ $begin_line -le $total_line ]
do
    end_line=$(echo "$begin_line+$split_line-1" |bc)
    sed "$begin_line,$end_line!d" $file >$prefix$i
    i=$(echo "$i+1" |bc)
    begin_line=$(echo "$end_line+1"|bc)
done
