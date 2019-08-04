[TOC]

## **（一）vi/vim是什么？**    

Linux世界几乎所有的配置文件都是以纯文本形式存在的，而在所有的Linux发行版系统上都有vi编辑器，因此利用简单的文字编辑软件就能够轻松地修改系统的各种配置了，非常方便。vi就是一种功能强大的文本编辑器，而vim则是高级版的vi，不但可以用不同颜色显示文字内容，还能进行诸如shell脚本、C语言程序编辑等功能，可以作为程序编辑器。        

## **（二）为什么要学习vi/vim？**    

首先所有的Linux发行版系统上都会默认内置vi编辑器，而不一定带有其他文本编辑器，非常通用；其次，很多软件的编辑接口都会默认调用vi；第三，vi具有程序编辑的能力；最后，vi程序简单，编辑速度相当快速。    

## **（三）vi的三种模式及各个模式之间的转换关系**

```
+----------------------+    i,o,a(插 入 ),R(替 换 )+------------------------+
|                      +-------------------------->   【 编 辑 模 式 】      |
|   【 一 般 模 式 】    <--------------------------+ 以 插 入 或 替 换 的 方 式|
|                      |         [ESC]            | 来 编 辑 文 件 内 容     |
|    光 标 的 移 动      |                          +------------------------+
|    搜 索 与 替 换      |
|删 除 字 符 、删 除 整 行|
|复 制 粘 贴 字 符 、整 行|         :/?              +-----------------------+
|                      +-------------------------->                       |
|                      |                          |  【 命 令 行 模 式 ]    |
|                      |                          |   读 取 /保 存 文 件    |
|                      <--------------------------+  其 他 额 外 的 功 能   |
|                      |         [ESC]            |                       |
+----------------------+                          +-----------------------+
```

## **（四）一般模式常用操作**    

【h(或向左方向键)】 光标左移一个字符        
【j(或向下方向键)】 光标下移一个字符        
【k(或向上方向键)】 光标上移一个字符        
【l(或向右方向键)】 光标右移一个字符        

【[Ctrl] + f】 屏幕向下移动一页（相当于Page Down键）        
【[Ctrl] + b】 屏幕向上移动一页（相当于Page Up键）        

【[0]或[Home]】 光标移动到当前行的最前面        
【[$]或[End]】 光标移动到当前行的末尾        

【G】 光标移动到文件的最后一行（第一个字符处）        
【nG】 n为数字（下同），移动到当前文件中第n行        
【gg】 移动到文件的第一行，相当于"1G"        
【n[Enter]】 光标向下移动n行        

【/word】 在文件中查找内容为word的字符串（向下查找）        
【?word】 在文件中查找内容为word的字符串（向上查找）        
【[n]】 表示重复查找动作，即查找下一个        
【[N]】 反向查找下一个        
【:n1,n2s/word1/word2/g】 n1、n2为数字，在第n1行到第n2行之间查找word1字符串，并将其替换成word2        
【:1,$s/word1/word2/g】 从第一行（第n行同理）到最后一行查找word1注册，并将其替换成word2        
【:1,$s/word1/word2/gc】 功能同上，只不过每次替换时都会让用户确认        

【x,X】 x为向后删除一个字符，相当于[Delete]，X为向前删除一个字符，相当于[Backspace]        
【dd】 删除光标所在的一整行        
【ndd】 删除光标所在的向下n行        

【yy】 复制光标所在的那一行        
【nyy】 复制光标所在的向下n行        
【p,P】 p为将已经复制的数据在光标下一行粘贴；P为将已经复制的数据在光标上一行粘贴        

【u】 撤消上一个操作        
【[Ctrl] + r】 多次撤消        
【.】 这是小数点键，重复上一个操作     

## **（五）一般模式切换到编辑模式的操作**    

* 进入插入模式（６个命令）

【i】 从目前光标所在处插入     
【I】 从目前光标     
【a】 从当前光标所在的下一个字符处开始插入     
【A】 从光标所在行的最后一个字符处开始插入     
【o】 英文小写字母o，在目前光标所在行的下一行处插入新的一行并开始插入     
【O】 英文大写字母O，在目前光标所在行的上一行处插入新的一行并开始插入     
* 进入替换模式（2个命令）     

【r】 只会替换光标所在的那一个字符一次     
【R】 会一直替换光标所在字符，直到按下[ESC]键为止     
【[ESC]】 退出编辑模式回到一般模式     

## **（六）一般模式切换到命令行模式**  

【:w】 保存文件     
【:w!】 若文件为只读，强制保存文件     
【:q】 离开vi     
【:q!】 不保存强制离开vi     
【:wq】 保存后离开     
【:wq!】 强制保存后离开     
【:! command】 暂时离开vi到命令行下执行一个命令后的显示结果     
【:set nu】 显示行号     
【:set nonu】 取消显示行号     
【:w newfile】 另存为     

# **(十一)vim配置文件**  

vim的配置文件为/etc/vimrc，但一般不建议直接修改这个文件，而是在用户根目录下创建一个新的隐藏文件：    
```
$ vim ~/.vimrc  

# 然后编辑这个文件，常用的配置如下：
"双引号后面的内容为注释
set ts=4      " 设置tab为4个空格
set expandtab " TAB替换为空格
%retab!       " 加!是用于处理非空白字符之后的TAB，即所有的TAB，若不加!，则只处理行首的TAB。
set nu "显示行号
set hlsearch "查找的字符串反白显示
set backspace=2 "可随时用退格键进行删除
set autoindent "自动缩排
set ruler "在最下方一行显示状态
set showmode "在左下角显示模式
set bg=dark "显示不同的底色，还可以为light
syntax on "语法检验，颜色显示
---------------------------------
set nocompatible " 关闭 vi 兼容模式
syntax on " 自动语法高亮
colorscheme molokai " 设定配色方案
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on " 开启插件
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\    
" 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠
```

### 参考链接    

http://www.cnblogs.com/jiayongji/p/5771444.html      
http://www.cnblogs.com/wangj08/archive/2013/03/13/2957309.html



编写

https://blog.csdn.net/qq_38597315/article/details/80627439

https://lzw.me/a/vim-shortcut.html

https://blog.csdn.net/ljx_5489464/article/details/50896080

https://blog.csdn.net/xyw_blog/article/details/15550149