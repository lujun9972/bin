for dir in ~/bin ~/我的笔记 ~/我的GTD ~/MyLisp ~/github/* ~/Daily ~/.spacemacs.d
do
if [ -d $dir ];then
(cd $dir && git pull && pwd) &
fi
done
