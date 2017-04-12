"Setup Vundle
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
        Bundle 'VundleVim/Vundle.vim'


        Bundle 'octol/vim-cpp-enhanced-highlight'
        Bundle 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Bundle 'scrooloose/nerdtree'
        Bundle 'majutsushi/tagbar'
        "Bundle 'scrooloose/syntastic'
        Bundle 'Yggdroot/indentLine'
        Bundle 'darfink/vim-plist'
        "Bundle 'terryma/vim-multiple-cursors'
        "Bundle 'SirVer/ultisnips'

        Bundle 'Valloric/YouCompleteMe' 

        Bundle 'vim-scripts/indentpython.vim'
    call vundle#end()

"Airline
    let g:airline_theme="dark" 
    
    nmap tp :tabp<cr>
    nmap tn :tabn<cr>
    nmap tx :tabc<cr>
    nmap tc :tabnew<cr>
    nmap tl :tabs<cr>

    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#buffer_nr_show=1
    
    "Using Powerline's Fonts after Install 
    "let g:airline_powerline_fonts=1

    if !exists('g:airline_symbols')
        let g:airline_symbols={}
    endif

    let g:airline_left_sep='\'
    let g:airline_left_alt_sep='\'
    let g:airline_right_sep='/'
    let g:airline_right_alt_sep='/'
    "let g:airline_left_sep='▶'
    "let g:airline_left_alt_sep='>'
    "let g:airline_right_sep='◀'
    "let g:airline_right_alt_sep='<'
    let g:airline_symbols.branch='⎇'
    let g:airline_symbols.readonly='◎'
    let g:airline_symbols.linenr='¶'
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1

"NERDTree
    let g:NERDTree_title='NERD Tree'
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore some files in NERDTree

    nmap fm :NERDTree<cr>

""syntastic
    "let g:syntastic_check_on_open=1
    "
    "let g:syntastic_cpp_include_dirs=['/usr/include/']
    "let g:syntastic_cpp_remove_include_errors=1
    "let g:syntastic_cpp_check_header=1
    "let g:syntastic_cpp_compiler='clang++'
    "let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libstdc++'
    "
    "let g:syntastic_error_symbol='XX'
    "let g:syntastic_warning_symbol='X'
    "
    "let g:syntastic_enable_balloons=1
    "
    "let g:syntastic_check_on_wq=0
    "let g:syntastic_enable_highlighting=1
    "let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
    "let g:syntastic_javascript_checkers=['jsl', 'jshint']
    "let g:syntastic_html_checkers=['tidy', 'jshint']
    "
    "" 修改高亮的背景色, 适应主题
    "highlight SyntasticErrorSign guifg=white guibg=black
    "
    "" to see srror location list
    "let g:syntastic_always_populate_loc_list=0
    "let g:syntastic_auto_loc_list=0
    "let g:syntastic_loc_list_height=5
    "function! ToggleErrors()
    "	let old_last_winnr=winnr('$')
    "	lclose
    "	if old_last_winnr == winnr('$')
    "		" Nothing was closed, open syntastic error location panel
    "		Errors
    "	endif
    "endfunction
    "
    "nnoremap <Leader>sl :call ToggleErrors()<cr>
    "nnoremap <Leader>sn :lnext<cr>
    "nnoremap <Leader>sp :lprevious<cr>

"YouCompleteMe
    set completeopt=longest,menu

    let g:ycm_confirm_extra_conf=0

    let g:ycm_error_symbol='>>'
    let g:ycm_warning_symbol='>'

    let g:ycm_complete_in_comments=1
    let g:ycm_complete_in_strings=1

    let g:ycm_collect_identifiers_from_comments_and_strings=1
    let g:ycm_collect_identifiers_from_tags_files=1


    let g:ycm_seed_identifiers_with_syntax=1

    let g:ycm_confirm_extra_conf=0

    let g:ycm_min_num_of_chars_for_completion=1

    let g:ycm_cache_omnifunc=0

    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

    let g:ycm_key_invoke_completion='<C-a>'

"Tagbar
    nmap tb :TagbarToggle<CR>
    let g:tagbar_ctags_bin='/usr/bin/ctags'
    let g:tagbar_width=30
    autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"VIM SETTINGS

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    let python_highlight_all=1

    set autoindent
    set ignorecase
    set number
    set relativenumber

    set ruler

    set foldenable
    set fdm=indent

    set smarttab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

    filetype on
    filetype plugin indent on
    syntax on
    "set cursorline

    set laststatus=2

    set background=dark
    set t_Co=256

    set expandtab
    set fileformat=unix

    set mouse=v
