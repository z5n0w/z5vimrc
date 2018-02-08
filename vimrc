
" VIM SETTINGS
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
    
    set backspace=indent,eol,start 

    " map shotcut as i like  
    let mapleader='\'
    
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>wq :wq<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader><Leader>q :q!<CR>

    set autoindent
    set ignorecase

    set number
    set relativenumber

    set ruler
    set laststatus=2
    set background=dark
    set t_Co=256


    set foldenable
    set fdm=indent

    set smarttab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

    syntax on
    filetype off
    set fileformat=unix

    set mouse=v
    
    let python_highlight_all=1
    set encoding=utf-8

" Setup Vundle
    set rtp+=~/.vim/bundle/Vundle.Vim/
    call vundle#begin()
        Bundle 'VundleVim/Vundle.Vim'
        
        " ui 
        Bundle 'vim-airline/vim-airline'
        Bundle 'vim-airline/vim-airline-themes'
        Bundle 'octol/vim-cpp-enhanced-highlight'
        Bundle 'Yggdroot/indentLine'
        " file manager 
        Bundle 'scrooloose/nerdtree'
        Bundle 'Xuyuanp/nerdtree-git-plugin'
        " C 
        Bundle 'Valloric/YouCompleteMe' 
        "Bundle 'scrooloose/syntastic'
        Bundle 'majutsushi/tagbar'
        " python 
        Bundle 'davidhalter/jedi-vim'
        Bundle 'vim-scripts/indentpython.vim'
        " others
        Bundle 'darfink/vim-plist'
        Bundle 'mattn/emmet-vim'
    call vundle#end()

filetype plugin indent on

" Airline
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

" NERDTree
    let g:NERDTree_title='NERD Tree'
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore some files in NERDTree

    nmap fm :NERDTree<cr>

" YouCompleteMe
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

" syntastic
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
    "   let old_last_winnr=winnr('$')
    "   lclose
    "   if old_last_winnr == winnr('$')
    "       " Nothing was closed, open syntastic error location panel
    "       Errors
    "   endif
    "endfunction
    "
    "nnoremap <Leader>sl :call ToggleErrors()<cr>
    "nnoremap <Leader>sn :lnext<cr>
    "nnoremap <Leader>sp :lprevious<cr>

" JEDI 
    let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 1
    let g:jedi#use_tabs_not_buffers = 1
    let g:jedi#use_splits_not_buffers = "top"

" Tagbar
    nmap tb :TagbarToggle<CR>
    let g:tagbar_ctags_bin='/usr/bin/ctags'
    let g:tagbar_width=30
    autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this=os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__ = activate_this))
EOF
