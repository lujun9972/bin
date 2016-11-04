for dir in ~/我的笔记 ~/我的GTD ~/MyLisp ~/github/*
do
if [ -d $dir ];then
(echo $dir && cd $dir && git pull) &
fi
done
