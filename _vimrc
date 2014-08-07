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

"�Զ���vim�������

"pathogen�������
execute pathogen#infect()
syntax on   "�﷨����
filetype plugin indent on

"������ɫ����
if has('gui_running')
"    set background=light
    set background=dark
else
    set background=dark
endif

colorscheme solarized
"==============================================================================
"���ÿ�ݼ�ǰ׺Ϊ��,��
let mapleader = ","
"==============================================================================
"��������_vimrc
map <silent> <leader>ss :source D:\Program files\openvim\_vimrc<CR>
"==============================================================================

"���ô���͸��������
"����͸����Ϊ230
map <silent> <leader>tm :call libcallnr("vimtweak.dll", "SetAlpha", 230)<CR>
"��͸��
map <silent> <leader>btm :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
"�������
map <silent> <leader>fd :call libcallnr("vimtweak.dll", "EnableMaximize", 1)<CR>
"������С
map <silent> <leader>sx :call libcallnr("vimtweak.dll", "EnableMaximize", 0)<CR>
"==============================================================================

"����taglist��ݼ��Լ�����
nmap tl :Tlist<CR>
"let Tlist_Auto_Open = 1 "����gvim�Զ���taglist
let Tlist_Auto_Update = 0
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 20

"==============================================================================

"����nerdtree��ݼ��Լ�����
nmap nd :NERDTree<CR>
nmap nc :NERDTreeClose<CR>
"==============================================================================
