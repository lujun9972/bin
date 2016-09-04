split_byte=$1
file=$2
total_byte=$(wc -c <$file)
prefix=$file.split.
i=1
begin_byte=1
while [ $begin_byte -le $total_byte ]
do
    dd of=$prefix$i bs=$split_byte count=1 2>/dev/null
    i=$(echo "$i+1" |bc)
    begin_byte=$(echo "$begin_byte+$split_byte" |bc)
done <$file
