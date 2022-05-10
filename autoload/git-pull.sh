for dir in ~/bin ~/我的笔记 ~/我的GTD ~/MyLisp ~/github/* ~/Daily ~/.spacemacs.d
do
if [ -d $dir ];then
(echo $dir && cd $dir && git pull) &
fi
done
