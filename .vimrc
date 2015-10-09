""<Leader>鍵
"let mapleader = ','
let g:mapleader = ','

" Install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" 檔案類型
filetype on         " 偵測檔案類型
filetype indent on  " 根據檔案類型進行縮排
filetype plugin on  " 開啟plugin
filetype plugin indent on    " 啟動自動完成
 

" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
set helplang=tw     " 設定幫助語言
 
" 編輯喜好設定
set nocompatible " VIM 不使用和 VI 相容的模式
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set shortmess=atI " 啟動為空白頁面
set ttyfast      " 加快遠端移動
set hidden       " 開啟緩衝

" 檔案操作
set nobackup     " 取消備份
set noswapfile   " 取消swap
set autoread     " 文件修改之後自動載入
set t_ti= t_te=  " 離開後資料還會顯示在螢幕上

" 外觀
syntax on        " 語法上色顯示
set cursorline   " 標示目前行
set cursorcolumn " 標示目前列
set ruler        " 顯示當前列
set wrap         " 強制換行
set showmatch    " 標示對應符號
set showcmd      " 顯示輸執行的命令
set showmode     " 在左下角顯示現在的模式
set winwidth=80  " 設定單行寬度
set scrolloff=7  " 移動時強迫上或下顯示多少行
set number       " 設置行號
set relativenumber number " 顯示相對行號
autocmd InsertEnter * :set norelativenumber number  " Insert mode 用絕對行號
autocmd InsertLeave * :set relativenumber           " Normal mode 用相對行號

"set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2    " 總是顯示狀態行

" 編輯
vnoremap <C-[> <gv      " 在 visual模式下可以直接進行縮排
vnoremap <C-]> >gv

" 自動完成
" menu     使用彈出選單來顯示可能的補全
" menuone  即使只有一個匹配，也使用彈出選單
" longest  只插入匹配的最長公共文字
" preview  在預覽視窗裡顯示當前選擇的補全的額外資訊, 只能和menu或menuone搭配使用
set completeopt=longest,menu    " 啟動自動完成
set wildmode=list:longest       " command 展開
set wildmenu    " 自動匹配command
set wildignore=*.o,*~,*.pyc,*.class    " Ignore compiled files
"離開插入模式後自動關閉自動完成視窗
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Enter後即選擇
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"

" 搜尋
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set ignorecase   " 設定搜尋忽略大小寫
set smartcase    " 有一個以上的大小寫就符合大小寫

" 折疊程式
set foldenable
" 折疊方式
" manual    人工折疊
" indent    使用縮排表示折疊
" expr      使用表達式定義折疊
" syntax    使用語法定義折疊
" diff      對沒有修改的程式進行折疊
" marker    使用標籤進行折疊, 初始為{{{ 和 }}}
set foldmethod=indent
set foldlevel=99

" 縮排
set smartindent   " 智慧縮排
set autoindent    " 開啟縮排

" tab 相關
set tabstop=4     " 設定tab的寬度
set shiftwidth=4  " 每一次縮排對應的空格數
set softtabstop=4 " 按刪除鍵一次刪除四個空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按刪除鍵可以一次刪掉四個空格
set expandtab     " 將tab用空格代替 [需要輸入真正tab，使用Ctrl+V + Tab]
set shiftround    " 縮排時取, 取整 use multiple of shiftwidth when indenting with '<' and '>'

" 滑鼠
" - 點擊游標不會換, 使用在複製上
 set mouse-=a             " 停止使用滑鼠
"  set mouse=a            " Automatically enable mouse usage
" set mousehide          " Hide the mouse cursor while typing

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Key 重新定義
" inoremap 插入模式 noremap 正常模式 cnoremap 命令模式 
" :map <C-A-a> a = Ctrl+Alt+a 為 a
" 取消方向鍵 強迫用hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" Ctrl + H跑到首列 L跑到尾端 J,K移動五行
nnoremap <C-H> ^
noremap <C-L> $
noremap <C-J> 5j
noremap <C-K> 5k
" 將;也為: 進入命令
nnoremap ; :
nnoremap <BS> X
" leader + / 去除高亮搜尋
noremap <Leader>/ :nohls<CR>
" map ESC
inoremap fj <Esc>

" F1-12 快捷鍵
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F3> :call HideNumber()<CR>   " 開關行號
nnoremap <F4> :set list! list?<CR>
set pastetoggle=<F5>    " 開關貼上有格式程式碼

" 分頁相關
"nnoremap <C-t> :tabnew<CR>        " ctrl t 開啟新分頁
"inoremap <C-t> <Esc>:tabnew<CR>   " ctrl t 開啟新分頁
"nnoremap <Left> gT      " 方向左鍵切換上一個分頁
"nnoremap <Right> gt         " 方向右鍵切換下一個分頁
"map <C-t>e :tabedit<CR>     " 編輯分頁
"map <C-t>w :tabclose<CR>    " 關閉分頁
"map <C-t>m :tabm<CR>        " 移動分頁 
"let g:last_active_tab = 1

" buffer相關
nnoremap <Left> :bprevious<CR>  " 方向左鍵切換上一個分頁
nnoremap <Right> :bnext<CR>     " 方向右鍵切換下一個分頁
nnoremap <C-b>l :ls<CR>
nnoremap <C-b>n :bn<CR>
nnoremap <C-b>p :bp<CR>
nnoremap <C-b>1 :1b<CR>
nnoremap <C-b>2 :2b<CR>
nnoremap <C-b>3 :3b<CR>
nnoremap <C-b>4 :4b<CR>
nnoremap <C-b>5 :5b<CR>
nnoremap <C-b>6 :6b<CR>
nnoremap <C-b>7 :7b<CR>
nnoremap <C-b>8 :8b<CR>
nnoremap <C-b>9 :9b<CR>
nnoremap <C-b>0 :bl<CR>

" 螢幕分割相關
nnoremap <C-w>- :split<CR>
nnoremap <C-w>\ :vsplit<CR>
nnoremap H :vertical res-5<CR>
nnoremap J :res+5<CR>
nnoremap K :res-5<CR>
nnoremap L :vertical res+5<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

autocmd! bufwritepost .vimrc source % " vimrc文件修改後自動reload。 linux。
