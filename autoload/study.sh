function study
{
    cd ~/study
    dirName=$@
    if [ ! -z $dirName ];then
	if [[ -d $dirName ]];then
	    cd $dirName
	else
	    mkdir $dirName
	    cd $dirName
	fi
    fi

}
