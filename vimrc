"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示
"winpos 5 5 " 设定窗口位置
"set lines=40 columns=155 " 设定窗口大小
set go= " 不要图形按钮
set guifont=Courier_New:h10:cANSI " 设置字体
syntax on " 语法高亮
autocmd InsertLeave * se nocul " 用浅色高亮当前行
autocmd InsertEnter * se cul " 用浅色高亮当前行
set ruler " 显示标尺
set showcmd " 输入的命令显示出来，看的清楚些
"set cmdheight=1 " 命令行（在状态行下）的高度，设置为1
"set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界(不建议)
"set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
set novisualbell " 不要闪烁(不明白)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} "状态行显示的内容
set laststatus=2 " 启动显示状态行(1),总是显示状态行(2)
"set background=dark "背景使用黑色
set nocompatible "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
set helplang=cn
set encoding=utf-8
endif
" 设置配色方案
set t_Co=256
"colorscheme desert
colorscheme neon
"colorscheme autumn
"colorscheme dracula

"字体
"if (has("gui_running"))
" set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行
nnoremap <F2> :g/^\s*$/d<CR>
"比较文件
nnoremap <C-F2> :vert diffsplit
"新建标签
map <M-F2> :tabnew<CR>
"打开树状文件目录
map <C-F3> \be
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!g++ % -o %<"
exec "! ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "! ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!java %<"
elseif &filetype == 'sh'
:!./%
endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
exec "w"
exec "!g++ % -g -o %<"
exec "!gdb ./%<"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"-- QuickFix setting --
" 按下F6，执行make clean
map <F6> :make clean<CR><CR><CR>
" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
map <F7> :make<CR><CR><CR> :copen<CR><CR>
" 按下F8，光标移到上一个错误所在的行
map <F8> :cp<CR>
" 按下F9，光标移到下一个错误所在的行
map <F9> :cn<CR>
" 以上的映射是使上面的快捷键在插入模式下也能用
imap <F6> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>
"代码补全
set completeopt=preview,menu
"允许插件
filetype plugin on
"共享剪贴板
set clipboard+=unnamed
"从不备份
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler " 打开状态栏标尺
set cursorline " 突出显示当前行
set magic " 设置魔术
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=4
set foldmethod=indent
set foldlevel=3
set foldenable " 开始折叠
" 使用空格键折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"如果有大写字母，不忽略大小写
set smartcase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为c程序提供自动缩进
set smartindent
"自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
" if getline('.')[col('.') - 1] == a:char
"  return "\<Right>"
" else
"  return a:char
"endif
"endfunction
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType java set tags+=D:\tools\java\tags
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags
"设置tags
set tags=tags
"set autochdir
" 按下F5重新生成tag文件，并更新taglist
map <c-F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <c-F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags+=./tags " add current directory's generated tags file
" set tags+=~/arm/linux-2.6.24.7/tags "add new tags file

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""""
let Tlist_Auto_Open=1  " 默认打开Taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Sort_Type = "name" " 按照名称排序
let Tlist_Compart_Format = 1 " 压缩方式
let Tlist_Exist_OnlyWindow = 1 " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close = 0 " 不要关闭其他文件的tags
let Tlist_Enable_Fold_Column = 0 " 不要显示折叠树
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
""""""""""""""""""""""""""""""
" minibufexpl 插件的一般设置
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1 " 可以用<C-h,j,k,l>切换到上下左右的窗口中
let g:miniBufExplMapWindowNavArrows = 1 " 用<C-箭头键>切换到上下左右窗口中去
let g:miniBufExplMapCTabSwitchBufs = 1 " <C-Tab> 向前循环切换到每个buffer上,并在当前窗口打开;<C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""
" Runtime Path Manipulation
""""""""""""""""""""""""""""""""
""execute pathogen#infect()

""""""""""""""""""""""""""""""""
" Vundle
" https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Lokaltog/vim-powerline.git'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim'}
""Plugin 'Valloric/YouCompleteMe.git'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'A.vim'
Plugin 'grep.vim'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'
Plugin 'bufexplorer.zip'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""
" plugin SuperTab
""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"
""""""""""""""""""""""""""""""""""
" plugin NERDTree
""""""""""""""""""""""""""""""""""
let NERDChristmasTree=1 " 让Tree把自己给装饰得多姿多彩漂亮点
let NERDTreeMouseMode=2 "  指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeShowBookmarks=1 " 是否默认显示书签列表
let NERDTreeShowFiles=1 "是否默认显示文件
let NERDTreeShowHidden=1 " 是否默认显示隐藏文件
" shortcut to open NERDTree
" map <C-t> :NERDTreeToggle<CR>
" map <C-t> :NERDTreeMirror<CR>
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""""""""""""""""""""""""
" powerline
""""""""""""""""""""""""""""""""""
"powerline{
set guifont=Powerline " Symbols for Powerline
set nocompatible
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'
"}
"""""""""""""""""""""新文件标题"""""""""""""""""""""""""""""""""""""""""
" 新建文件，自动插入文件头
autocmd BufNewFile *.c,*.py,*.cpp,*.h,*.sh,*.java exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
func SetTitle()
let l:var1 = 1
if &filetype == 'sh'
call setline(1,	"\#########################################################################")
call append(line("."),	"\# File Name:\t\t".expand("%"))
call append(line(".")+var1,	"\# Author:\t\tDennisGao")
let l:var1 = var1+1
call append(line(".")+var1, "\# mail:\t\t\tDennisGao")
let l:var1 = var1+1
call append(line(".")+var1, "\# Created Time:\t\t".strftime("%Y/%m/%d %H:%M:%S"))
let l:var1 = var1+1
call append(line(".")+var1, "\# Last modified:\t".strftime("%Y/%m/%d %H:%M:%S"))
let l:var1 = var1+1
call append(line(".")+var1, "\#########################################################################")
let l:var1 = var1+1
call append(line(".")+var1, "")
elseif &filetype == 'python'
call setline(1,	"\#!/usr/bin/env python")
call append(line("."),	"\# -*- coding: utf-8 -*-")
call append(line(".")+var1, "")
let l:var1 = var1+1
call append(line(".")+var1, "' module description '")
let l:var1 = var1+1
call append(line(".")+var1, "")
let l:var1 = var1+1
call append(line(".")+var1, "__author__ = 'DennisGao'")
let l:var1 = var1+1
call append(line(".")+var1, "")
else
call setline(1,	"/************************************************************************")
call append(line("."),	" * File Name:\t".expand("%"))
call append(line(".")+var1, " * Author:\t\tDennisGao")
let l:var1 = var1+1
call append(line(".")+var1, " * Mail:\t\tDennisGao ")
let l:var1 = var1+1
call append(line(".")+var1, " * Created Time:\t".strftime("%Y/%m/%d %H:%M:%S"))
let l:var1 = var1+1
call append(line(".")+var1, " * Last modified:\t".strftime("%Y/%m/%d %H:%M:%S"))
let l:var1 = var1+1
call append(line(".")+var1, " ***********************************************************************/")
let l:var1 = var1+1
call append(line(".")+var1, "")
endif
if &filetype == 'cpp'
if expand("%:e") == 'h'
let l:var1 = var1+1
call append(line(".")+var1, "#ifndef _".toupper(expand("%:t:r"))."_H_")
let l:var1 = var1+1
call append(line(".")+var1, "#define _".toupper(expand("%:t:r"))."_H_")
let l:var1 = var1+1
call append(line(".")+var1, "#ifdef __cplusplus")
let l:var1 = var1+1
call append(line(".")+var1, "extern \"C\"")
let l:var1 = var1+1
call append(line(".")+var1, "{")
let l:var1 = var1+1
call append(line(".")+var1, "#endif")
let l:var1 = var1+1
call append(line(".")+var1, "")
let l:var1 = var1+1
call append(line(".")+var1, "#ifdef __cplusplus")
let l:var1 = var1+1
call append(line(".")+var1, "}")
let l:var1 = var1+1
call append(line(".")+var1, "#endif")
let l:var1 = var1+1
call append(line(".")+var1, "#endif //".toupper(expand("%:t:r"))."_H_")
let l:var1 = var1+1
call append(line(".")+var1, "")
else
let l:var1 = var1+1
call append(line(".")+var1, "#include <iostream>")
let l:var1 = var1+1
call append(line(".")+var1, "#include \"".expand("%:t:r").".h\"")
let l:var1 = var1+1
call append(line(".")+var1, "using namespace std;")
let l:var1 = var1+1
call append(line(".")+var1, "int main(int argc, char** argv)")
let l:var1 = var1+1
call append(line(".")+var1, "{")
let l:var1 = var1+1
call append(line(".")+var1, "\treturn 0;")
let l:var1 = var1+1
call append(line(".")+var1, "}")
let l:var1 = var1+1
call append(line(".")+var1, "")
endif
elseif &filetype == 'c'
let l:var1 = var1+1
call append(line(".")+var1, "#include <stdio.h>")
let l:var1 = var1+1
call append(line(".")+var1, "#include \"".expand("%:t:r").".h\"")
let l:var1 = var1+1
call append(line(".")+var1, "int main(int argc, char** argv)")
let l:var1 = var1+1
call append(line(".")+var1, "{")
let l:var1 = var1+1
call append(line(".")+var1, "\treturn 0;")
let l:var1 = var1+1
call append(line(".")+var1, "}")
let l:var1 = var1+1
call append(line(".")+var1, "")
elseif &filetype == 'sh'
let l:var1 = var1+1
call append(line(".")+var1, "\#!/bin/bash")
let l:var1 = var1+1
call append(line(".")+var1, "")
endif
endfunc
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/local/bin/cscope " 指定用来执行cscope的命令
  set csto=1 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
  set cst " 同时搜索cscope数据库和标签文件
  set cspc=0
  set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out .
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif

" 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数的函数
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找指定的字符串
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找egrep模式，相当于egrep功能，但查找速度快多了
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" 查找并打开文件，类似vim的find功能
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 查找包含本文件的文件
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
" 查找本函数调用的函数
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
" nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

""""""""""""""""""""""""""""""""""
" winmanager
""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList' " 设置我们要管理的插件
let g:winManagerWidth = 30 " 设置winmanager的宽度，默认为25
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
" let g:AutoOpenWinManager = 1 " 在进入vim时自动打开winmanager
nmap wm :WMToggle<cr>

""""""""""""""""""""""""""""""""""
" grep.vim
"""""""""""""""""""""""""""""""""" 
nnoremap <silent> <F3> :Grep<CR>

""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""" 
