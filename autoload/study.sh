function study
{
    mkdir -p ~/study
    cd ~/study || exit 1
    dirName=$1
    if [ ! -z $dirName ];then
	if [[ ! -d $dirName ]];then
	    mkdir $dirName
	fi
	cd $dirName
    fi

}
