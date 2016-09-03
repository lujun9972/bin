nextgrep(){
	pattern=$1
	file=$2
	count=$3 #打出下面几行
	#
	cat $file |awk '$0~/'$pattern'/{(for i=0;i<'$count';i++){getline;print $0;}}'
}
