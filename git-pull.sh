for dir in 我的笔记 我的GTD emacs-init MyLisp 
do
cd ~/$dir
git pull /media/lujun9972/TOSHIBA/$dir
done

for dir in elake Text-Game-Maker el-webchat el-todo el-typing-game elog
do
cd ~/github/$dir
git pull /media/lujun9972/TOSHIBA/$dir
done
