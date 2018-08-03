"""""""""""""""""""""""""" Vundle(通过 git 安装插件)
" 以下四行为 vundle 必要套路
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bash-support.vim'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'FSwitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
" Indexer depends on DfrankUtil and vimprj
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'vim-latex/vim-latex'
Plugin 'danro/rename.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'DoxygenToolkit.vim'
Plugin 'gou4shi1/Conque-GDB'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'tell-k/vim-autopep8'
Plugin 'mattn/emmet-vim'
call vundle#end()
filetype plugin indent on
" 以上两行为 vundle 必要套路
" ------------------------------------------------------------
"  vim-jsx
" ------------------------------------------------------------

" 切换快捷键
let g:jsx_ext_required=0
"let g:jsx_pragma_required=1

""""""""""""""""""""""""""""" 其他
" 拼写检查
autocmd bufread,bufnewfile *.txt,*.tmp,*.md,*.tex setlocal spell spelllang=en,cjk
" 命令历史记录列表长度
set history=500
" 文件被外部更改后自动重新加载
" (terminal中需要运行外部命令如:!才会重新加载)
set autoread
" 开启鼠标功能
set mouse=a
" 光标上下最少有5行
set scrolloff=5
" vim 命令行模式智能补全
set wildmenu
" 使退格键可以删除上一次插入模式插入的字符
set backspace=eol,start,indent
" 禁止拆行
set nowrap
" 正则中 $ . * ^ 不用加反斜杠
set magic
" 输入右结对符时临时跳到左结对符0.2秒
"set showmatch
"set mat=2
" 使<,>,h,l可以跨行
"set whichwrap+=<,>,h,l
" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

""""""""""""""""""""""""""""" gvim 专属配置
if has('gui_running')
    " 字体（Ubuntu 需要额外安装该字体）
    set guifont=YaHei\ Consolas\ Hybrid\ 11.5
    " 禁止光标闪烁
    set gcr=a:block-blinkon0
    " 禁止显示滚动条
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    " 禁止显示菜单和工具条
    set guioptions-=m
    set guioptions-=T
    " 调用外部命令wmctrl全屏
    fun! ToggleFullscreen()
        call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    endf
    nnoremap <silent> <F11> :call ToggleFullscreen()<CR>
    " 启动gvim时自动全屏
    autocmd VimEnter * call ToggleFullscreen()
endif

"""""""""""""""""""""""""""""" 外观
"""""""""" 主题
set t_Co=256
colorscheme solarized
"colorscheme molokai
"colorscheme phd
"""""""""" 高亮所在行、列
set cursorline
set cursorcolumn
"""""""""" 语法高亮
syntax enable
syntax on
"""""""""" 背景
set background=dark
"""""""""" 显示辅助信息
set number
set laststatus=2
set ruler
"""""""""" 缩进
"set smartindent
"set autoindent
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"""""""""" 折叠
" 基于缩进
"set foldmethod=indent
" 基于语法
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable

"""""""""""""""""""""""""""""" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase

"""""""""""""""""""""""""""""" 键盘映射
" 默认leader为\
"let mapleader=";"
" 把空格键映射过去
" （如果直接把leader键设为空格键，插入空格时会迟滞）
map <Space> <Leader>
map <Space><Space> <Leader><Leader>
"
"""""""""" 高亮所在行、列
nnoremap <Leader>hc :set cursorcolumn!<CR>:set cursorline!<CR>
"
"""""""""" 保存文件
"command W w !sudo tee % > /dev/null
"
"""""""""" 访问系统粘贴板
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
"
"""""""""" 标签
nnoremap ]t :tnext<CR>
nnoremap [t :tprevious<CR>
"
"""""""""" no-high-light
nmap <Leader>nh :nohl<CR>
"
"""""""""" %%->local path
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
"
"""""""""" 删除行末非打印字符
func! DeleteTrailingWhite()
    %s/\r\+$//ge
    %s/\s\+$//ge
    exe "normal! \<c-o>"
endfunc
nnoremap <leader>dw :call DeleteTrailingWhite()<CR>
"
"""""""""" 关闭其他buffer
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | execute "1,".(curr-1)."bd"     | endif
  if curr < last | execute (curr+1).",".last."bd" | endif
endfunction
nnoremap <leader>bo :call CloseAllBuffersButCurrent()<CR>
"
"""""""""" 替换
" 替换函数
" @confirm: 是否替换前逐一确认
" @wholeword: 是否整词匹配
" @replace: 被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    exe '%s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 左右加空格
func! SurroundBySpace()
    exe "normal i\ "
    exe "normal la\ "
endfunc
nnoremap <Leader>r<Space> :call SurroundBySpace()<CR>
"
"""""""""" 环境恢复
" 每次写文件时自动保存 undo 历史，下次加载在文件时自动恢复所有 undo 历史
set undodir=~/.undo_history/
set undofile
" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存快捷键
"noremap <leader>ss :mksession! my.vim<CR> :wviminfo! my.viminfo<CR>
noremap <leader>ss :mksession! .my_session.vim<CR>
" 恢复快捷键
"noremap <leader>rs :source my.vim<CR> :rviminfo my.viminfo<CR>
noremap <leader>rs :source .my_session.vim<CR>
"
"""""""""" 编译
" make
func! SetMakeToGCC()
    let g:makeprg_global=&makeprg
    if &filetype == 'cpp'
        setlocal makeprg=g++\ -O2\ -std=c++11\ -Wall\ -Wno-unused-result\ -o\ %<\ %
    elseif &filetype == 'c'
        setlocal makeprg=gcc\ -o\ %<\ %
    endif
endfunc
func! SetMakeToGlobal()
    let &makeprg=g:makeprg_global
endfunc
nnoremap <Leader>ma :w<CR>:call SetMakeToGCC()<CR>:make<CR>:cw<CR>:call SetMakeToGlobal()<CR>
"
" cmake
nnoremap <Leader>mm :wa<CR>:!mkdir build<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake ..<CR>:make<CR>:cw<CR>:cd ..<CR><CR>
nnoremap <Leader><F6> :wa<CR>:!mkdir build<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake ..<CR>:make<CR>:cw<CR>:cd ..<CR>:!build/main<CR>

"""""""""""""""""""""""""""""" 文件头
" *.cpp *.h
"autocmd bufnewfile *.cpp,*.h so ~/.file_header/c_header.txt
"autocmd bufnewfile *.cpp,*.h exe "1," . 7 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd bufnewfile *.cpp,*.h exe "1," . 7 . "g/Creation Date :.*/s//Creation Date : " .strftime("%Y年%m月%d日")
"autocmd bufnewfile *.cpp,*.h exe "normal 3G$"
"autocmd Bufwritepre,filewritepre *.cpp,*.h exe "1," . 7 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
"autocmd bufwritepost,filewritepost *.cpp,*.h exe "normal! \<c-o>"
"
"tex
autocmd Bufwritepre,filewritepre *.tex exe "1," . 7 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.tex exe "normal! \<c-o>"
"
" ACM
func! ACMFileHeader()
    if &filetype == "cpp"
        normal! 7Go
        so ~/.file_header/ACM_header.txt
        normal! 33G$
    endif
endfunc
nnoremap <Leader>acm :call ACMFileHeader()<CR>

"""""""""""""""""""""""""""""" 插件
"""""""""" airline""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"
" 启用额外安装的powerline-fonts
let g:airline_powerline_fonts = 1
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"cpp高亮
"类作用域高亮
let g:cpp_class_scope_highlight = 1
"成员变量高亮
let g:cpp_member_variable_highlight = 1
"类名高亮
let g:cpp_class_decl_highlight = 1
"模板函数高亮(有时不起作用)
let g:cpp_experimental_template_highlight = 1
"库
let g:cpp_concepts_highlight = 1

"""""""""" 缩进可视化"""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
"""""""""" fswitch
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<CR>
"
"""""""""" 书签
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'PurgeMarks'         :  "mda",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
\ }
"
"""""""""" tagbar
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
nnoremap <Leader>lt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
"tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_autofocus = 1
"设置标签不排序，默认排序
let g:tagbar_sort = 0
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
"
"""""""""" CtrlSF
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，速记：search project
nnoremap <Leader>sp :CtrlSF<CR>
"
"""""""""" indexer
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
" 在~/.indexer_files里添加你的工程代码根目录路径
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
"
"""""""""" UltiSnips
" 设置UltiSnips模板目录为~/.vim/bundle/ultisnips/myUltiSnips
let g:UltiSnipsSnippetDirectories=["myUltiSnips"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger=";<tab>"
let g:UltiSnipsJumpForwardTrigger=";<tab>"
let g:UltiSnipsJumpBackwardTrigger=";<s-tab>"
"
"""""""""" YouCompleteMe
" 跳转到定义/声明
nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>fi :YcmCompleter FixIt<CR>
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
nnoremap <Leader>gt :YcmCompleter GetType<CR>
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap ;; <C-x><C-o>
" 菜单配色
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项配色
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 设置全局 .ycm_extra_conf.py 文件的位置
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
"" 引入 C++ 标准库 tags
set tags+=~/.tags/stdcpp.tags
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" python解释器路径(这样设置将自动选择$PATH中的第一个)
let g:ycm_python_binary_path = 'python3'
"
"""""""""" 由接口快速生成实现框架
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
"""""""""" 库信息参考
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nnoremap <Leader>man0 :Man <cword><CR>
nnoremap <Leader>man1 :Man 1 <cword><CR>
nnoremap <Leader>man2 :Man 2 <cword><CR>
nnoremap <Leader>man3 :Man 3 <cword><CR>
nnoremap <Leader>man4 :Man 4 <cword><CR>
nnoremap <Leader>man5 :Man 5 <cword><CR>
nnoremap <Leader>man6 :Man 6 <cword><CR>
nnoremap <Leader>man7 :Man 7 <cword><CR>
"
"""""""""" 工程文件浏览
nnoremap <Leader>lf :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=22
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
""""""""""" miniBufExpl
noremap <Leader>lb :MBEToggle<CR>
"" buffer 切换快捷键
noremap <C-\> :MBEbn<CR>
noremap <C-S-\> :MBEbp<CR>
"" 设置循环切换
let g:miniBufExplCycleArround = 1
"
"""""""""" 快速选中结对符内的文本
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
"
"""""""""" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
"
"""""""""" markdown
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
nnoremap <Leader>md :InstantMarkdownPreview<CR>
"
"""""""""" latex
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:tex_indent_items = 0
" map
"command Tctex TTemplate ctexart
nnoremap <Leader>nl a\\<CR>\indent <ESC>
nnoremap <Leader>la a[latex][/latex]<ESC>7hi
"
"""""""""" shell
" open
nnoremap <Leader>sh :VimShellPop<CR>
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" History completion
inoremap <buffer> <expr><silent> <Up> unite#sources#vimshell_history#start_complete(!0)
"
"""""""""" nerdtree-git
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified" : "✹",
            \ "Staged" : "+",
            \ "Untracked" : "✭",
            \ "Renamed" : "➜",
            \ "Unmerged" : "═",
            \ "Deleted" : "×",
            \ "Dirty" : "✗",
            \ "Clean" : "✔︎",
            \ "Unknown" : "?"
            \ }

" 切换快捷键
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
"
"""""""""" auto-pairs
let g:AutoPairs = {'{':'}'}
"
"""""""""" DoxygenToolkit
nnoremap <Leader>cf :Dox<CR>
let g:DoxygenToolkit_authorName = "gou4shi1, admin@goushi.me"
let g:DoxygenToolkit_paramTag_post = "<++>"
let g:DoxygenToolkit_returnTag_post = "<++>"
let g:DoxygenToolkit_throwTag_post = "<++>"
let g:DoxygenToolkit_templateParamTag_post = "<++>"
"let g:DoxygenToolkit_briefTag_funcName = "yes"
"let g:load_doxygen_syntax = 1
"let g:doxygen_enhanced_color = 1
"
"""""""""" fcitx
set ttimeoutlen=100
"
"""""""""" ConqueGdb
" leader
    let g:ConqueGdb_Leader = 't'
" open
let g:ConqueTerm_StartMessages = 0
" send command to gdb
" command GDB ConqueGdbCommand
"
"""""""""" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
"map <F8> :SyntasticToggleMode<CR>:SyntasticCheck<CR>

"let g:syntastic_python_checkers = ['flake8']
"
"""""""""" ale
" 选择 linter
let g:ale_linters = {
\   'c': [],
\   'cpp': [],
\   'python': ['flake8'],
\}
" 快速跳转到前/后一个出错处
nmap <silent> <C-h> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)
"
"""""""""" autopep8
" 绑定 <F8> 调整全文
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" 绑定 = 调整当前行
autocmd FileType python set equalprg=autopep8\ -
"
"""""""""" run
func! MyRun()
    if &filetype == 'cpp'
        exe "!rm -rf %<"
        exe "w"
        exe "!g++ -O2 -std=c++11 -Wall -Wno-unused-result % -o %<"
        exe "!./%<"
    elseif &filetype == 'c'
        exe "!rm -rf %<"
        exe "w"
        exe "!gcc % -o %<"
        exe "!./%<"
    elseif &filetype == 'tex'
        exe "w"
        exe "TTarget pdf"
        exe "normal \\ll\<cr>"
        exe "normal \\lv"
    elseif &filetype == 'python'
        exe "w"
        let makeprg_global = &makeprg
        let errorformat_global = &errorformat
        setlocal makeprg=python3\ %
        "setlocal makeprg=python\ %
        setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
        exe "make"
        copen
        let &makeprg = makeprg_global
        let &errorformat = errorformat_global
    endif
endfunc

nnoremap <F6> :call MyRun()<CR>
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc

"
"""""""""" debug
func! MyDebug()
    if &filetype == 'cpp'
        exe "!rm -rf %<"
        exe "w"
        exe "!g++ -std=c++11 -Wall -Wno-unused-result % -g -o %<"
        exe "ConqueGdb %<"
    elseif &filetype == 'c'
        exe "!rm -rf %<"
        exe "w"
        exe "!gcc % -g -o %<"
        exe "ConqueGdb %<"
    endif
endfunc
nnoremap <F7> :call MyDebug()<CR>
set number
" set leader
let mapleader = "-"
" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" map -: downwards move a line (ie. delete a line and paste onto next line)
nnoremap <leader>- I<lf><esc>
" map _: upwards move a line
nnoremap _ kdd<esc>p
" convert a word to upper
inoremap <c-u> <esc>lwbveUea
" abbrev for email
iabbrev @@ 1617609852lzc@gmail.com
" map <esc> and disable <esc>
inoremap jk <esc>
inoremap <esc> <nop>
" lock direction-key
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
" iabbrev for .c int main
augroup mymain
    autocmd FileType c :inoremap mm int main()<cr>{<cr> <cr>}<esc>kA<esc>i
    autocmd FileType c :inoremap mp int main(int argc, char *argv[])<cr>{<cr> <cr>}<esc>kA<esc>i
augroup END
