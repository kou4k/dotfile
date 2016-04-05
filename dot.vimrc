" -------------------------------------------------
" dein関連 
" http://qiita.com/delphinus35/items/00ff2c0ba972c6e41542#_reference-b5863a53d77df63b23d4
" -------------------------------------------------

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
call dein#begin(s:dein_dir)

" プラグインリストを収めた TOML ファイル
let s:toml      = '~/.vim/rc/dein.toml'
let s:lazy_toml = '~/.vim/rc/dein_lazy.toml'

" TOML を読み込み、キャッシュしておく
if dein#load_cache([expand('<sfile>:p:h'), s:toml, s:lazy_toml])
" if dein#load_cache([s:toml, s:lazy_toml])
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#save_cache()
endif

" 設定終了
call dein#end()

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" -------------------------------------------------
" settings
" -------------------------------------------------
syntax on
colorscheme molokai
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set clipboard=unnamed
