# bingo-vim
一个强大的配置好ycm可在win下使用的vim
# Bingo的VIM
Bingo的VIM。All In Vim!目前仅适配windows版本，正在努力兼容linux。
![](http://i3.tietuku.com/71e2f001fa795e33.png)
<!--more-->
# 安装
## 简易安装
1. 点击右侧Download Zip按钮，下载后解压在e盘的根目录下，将e:/vim加入环境变量。(务必是e盘根目录)
2. 下载ycm插件所需的[额外文件](http://pan.baidu.com/s/1mgs0RWW).将安装包中的ctags58文件夹以及TDM-GCC-64文件夹整个复制到e:/vim目录下.将安装包内的bundle.zip下的所有文件复制到e:/vim/vimfiles/bundle目录下
3. 安装python 2.7.6,并将其安装目录加入系统path路径
4. 安装MinGW，并将其bin目录加入系统path路径。若你安装了codeblocks，可以选择直接将codeblocks自带MinGW加入系统路径。例如，我的路径为
``` 
C:\Program Files (x86)\CodeBlocks\MinGW\bin
```
5. 进入./vim/vim74文件夹下，将快捷方式gvim.exe移动到你的桌面上。 
6. 进入./vim文件夹下，用gvim打开_vimrc文件找到这一段
```
"if g:isWIN
"    exec 'cd ' . fnameescape('f:\workspace') 
"else 
"    exec 'cd ' . fnameescape('~\workspace')
"endif
```
将其反注释并改为自己的默认工作目录(若不存在，需要自己新建一个)。
7. 打开gvim。执行
```
:PluginClean 
```
执行完毕后。执行。
```
:PluginInstall
```
8. 至此，安装完毕。享受编程的愉悦吧。有任何问题欢迎访问我的博客acbingo.cn进行留言咨询。
# 功能介绍与插件说明
Todo
## 先说几个功能先用着
目前支持c,cpp,java,python的编译与运行。F9或是\rr键一键编译并运行
支持ycm自动补全。没错！vim所有插件中最最最吊的也是最最最最难配置的插件，ycm For windows，该vim已经帮你编译并配置好了。
F12一键换肤
F3打开文件树
ctrl+p 打开文件搜索功能
F2打开工具栏
普通模式下，tb，打开tagbar，tl，打开tlist
支持snippets补全，在cpp文件下，键入init然后按tab键试试？在md文件下呢？更多补全命令先自行参考snippets文件夹
ctrl+up,ctrl+down，透明度调整
alt+up，alt+down，字号调整
暂时想到这么多。。。。

# 感谢
感谢[Ruchee](https://github.com/ruchee/vimrc)
感谢[Fingertap]()
