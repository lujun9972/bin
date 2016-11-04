function study
{
    cd ~/study || exit 1
    dirName=$1
    if [ ! -z $dirName ];then
	if [[ -d $dirName ]];then
	    cd $dirName
	else
	    mkdir $dirName
	    cd $dirName
	fi
    fi

}
