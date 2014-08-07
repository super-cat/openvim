set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"自定义vim插件配置

"pathogen插件配置
execute pathogen#infect()
syntax on   "语法高亮
filetype plugin indent on

"更改配色方案
if has('gui_running')
"    set background=light
    set background=dark
else
    set background=dark
endif

colorscheme solarized
"==============================================================================
"设置快捷键前缀为“,”
let mapleader = ","
"==============================================================================
"快速重载_vimrc
map <silent> <leader>ss :source D:\Program files\openvim\_vimrc<CR>
"==============================================================================

"设置窗口透明盒缩放
"设置透明度为230
map <silent> <leader>tm :call libcallnr("vimtweak.dll", "SetAlpha", 230)<CR>
"不透明
map <silent> <leader>btm :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
"窗口最大化
map <silent> <leader>fd :call libcallnr("vimtweak.dll", "EnableMaximize", 1)<CR>
"窗口缩小
map <silent> <leader>sx :call libcallnr("vimtweak.dll", "EnableMaximize", 0)<CR>
"==============================================================================

"设置taglist快捷键以及配置
nmap tl :Tlist<CR>
"let Tlist_Auto_Open = 1 "启动gvim自动打开taglist
let Tlist_Auto_Update = 0
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 20

"==============================================================================

"设置nerdtree快捷键以及配置
nmap nd :NERDTree<CR>
nmap nc :NERDTreeClose<CR>
"==============================================================================
