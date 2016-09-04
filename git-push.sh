for dir in 我的笔记 我的GTD emacs-init MyLisp 
do
cd /media/lujun9972/TOSHIBA/$dir
git pull ~/$dir
done

for dir in  elake Text-Game-Maker el-webchat el-todo el-typing-game elog
do
cd /media/lujun9972/TOSHIBA/$dir
git pull ~/github/$dir
done
