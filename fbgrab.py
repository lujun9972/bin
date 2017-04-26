#! /usr/bin/env python3
'''
不知道为何,在X41上用fbgrab抓取emacs,w3m,mplayer时,生成的png文件中alpha通道为0,造成图片透明.
这个脚本抓取png文件后,会修改png文件的alpha通道,重新设置alpha通道的值为255.
'''
import subprocess
import sys
from PIL import Image

png_file = sys.argv[-1]
cmd = ['fbgrab'] + sys.argv[1:]
subprocess.check_output(cmd)

# 重新设置alpha通道的值
img = Image.open(png_file)
img.putalpha(255)
img.save(png_file)

