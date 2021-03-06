so ~/dotfiles/.vim/janus/vim/vimrc

colorscheme jellybeans
set t_Co=256

" settings
set mouse=a                     " because mouse
set nu                          " line numbers
set nobackup                    " don't do backups
"set paste                       " don't judge me
set nowritebackup               " 
set noswapfile                  " 
set hidden                      " hide buffers, rather than closing them
set modelines=0                 " don't allow modelines
set smartindent                 " let vim indent for you
set smarttab                    " let vim tab
set autoindent                  " always set autoindenting on
set tabstop=2                   " two-space tabs
set shiftwidth=2                " two-space tabs
set expandtab                   " use spaces for tabs
"set incsearch                   " show search matches while you type
set ignorecase                  " ignore case when searching
set smartcase                   " ignore search case if all lowercase
set hlsearch                    " highlight search terms
set gdefault                    " default to global replace
set virtualedit=all             " free cursor mode
set wrap!                       " no wordwrap
set backspace=eol,start,indent  " allow backspace to delete linebreaks
set scrolloff=5                " have 3 lines of offset (or buffer) when scrolling
set sidescroll=5               " 3 line buffer horizontally as well
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete first full match
"set pastetoggle=<F2>            " toggle paste indentation w/ F2
set clipboard+=unnamed          " share clipboard
set clipboard=unnamed           " please work
set more                        " page on extended output
set ttyfast                     " smoother redraws
set lazyredraw                  " do not redraw while executing macros
set showcmd                     " display incomplete commands
set title                       " set the title
set shortmess=at                " eliminate annoying 'Press ENTER or type command to continue' notices
set laststatus=2
set statusline=%F%m%r%h%w
scriptencoding utf-8
set encoding=utf-8

" file type detection
if has('autocmd')
  au filetype ruby set list                     " list chars in ruby
  au filetype ruby set listchars=tab:>-,trail:- " list trailing spaces + all tabs
  au filetype ruby set list                     " list chars in js
  au filetype js set listchars=tab:>-,trail:-   " list trailing spaces + all tabs

  au BufNewFile,BufRead *.erb set filetype=html
  au BufNewFile,BufRead *.tpl set filetype=ruby
  au BufRead,BufNewFile *.todo setfiletype todo 
  au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby
endif

filetype plugin indent on

" treat these like blocks
let g:html_indent_tags = 'li\|p'

" custom binds I use
let mapleader = ","
"nnoremap <leader>dW pldW
"nnoremap <leader>dw pldw
"nnoremap <leader><space> :noh<CR>
"nnoremap <leader>u gUgU
"nnoremap <leader>l gugu
"inoremap jj <Esc>
"inoremap jk <Esc>
"nnoremap ; :
"nnoremap <C-d> :q<CR>
"noremap Y $
"noremap T ^
"noremap K i<CR><Esc>
"nmap <leader>w :set wrap!<CR>
"nmap <leader>k :set list!<CR>
"inoremap <C-tab> <Esc><<i
"nnoremap j gj
"nnoremap k gk
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

map gr :tabprev<CR>
map tn :tabnew<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

" get off my lawn
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" newline on shift/enter
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" move a line of text w/ F3/F4
"nnoremap <F3> :m+<CR>==
"nnoremap <F4> :m-2<CR>==
"inoremap <F3> <Esc>:m+<CR>==gi
"inoremap <F4> <Esc>:m-2<CR>==gi
"vnoremap <F3> :m'>+<CR>gv=gv
"vnoremap <F4> :m-2<CR>gv=gv

" nerdtree tab navigation
map <F3> :tabprev<CR>
map <F4> :tabnext<CR>

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" when vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" move between panes
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
map <Leader>h <C-w>h 

" nerdtree
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1

" nerdcommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" rainbows
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " this is just what i use

" jump to last cursor position when opening a file.
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
     exe "normal g`\""
    endif
  end
endfunction

" ctrl p for cnuapp
"set wildignore+=/media/**,*//home/alan/media/**,*//home/alan/Music/**,*/*.scssc
"set wildignore+=*/.git/* " This line breaks fugitive.vim
"set wildignore+=*.pyc,*/*.scssc
"set wildignore+=*/cabar/*,*/cnu_active_record/*,*/cnuapp_ci/*,*/cnuapp_doc/*,*/cnuapp_env/*
"set wildignore+=*/cnuapp_qa/*,*/cnuapp_rack/*,*/cnu_bloom/*,*/cnu_brand/*,*/cnu_cluster/*
"set wildignore+=*/cnu_config/*,*/cnu_content/*,*/cnu_database/*,*/cnu_gems/*,*/cnu_ivr/*
"set wildignore+=*/cnu_ldap/*,*/cnu_locale/*,*/cnu_logger/*,*/cnu_memcache/*,*/cnu_perf/*
"set wildignore+=*/cnu_pg/*,*/cnu_product_offering/*,*/cnu_rails_app/*,*/cnu_regexp/*
"set wildignore+=*/cnu_ruby_build/*,*/cnu_ruby_core/*,*/cnu_ruby_lib/*,*/cnu_scm/*
"set wildignore+=*/cnu_selenium/*,*/cnu_service/*,*/cnu_space/*,*/cnu_test/*,*/contenter_api/*
"set wildignore+=*/cookbooks/*,*/db_global/*,*/doc/*,*/enf_app/*,*/enf_log/*,*/lsws-3.3.14/*
"set wildignore+=*/mod_rails/*,*/rails-1.2/*,*/red_steak/*,*/screenshots/*,*/shout_trace/*
"set wildignore+=*/sol_api/*,*/trick_serial/*,*/waffles/*,*/wtf/*
"set wildignore+=*static/CACHE/css/*
"set wildignore+=*/cnuapp/apache/*,*/cnuapp/bin/*
"set wildignore+=*/cnuapp/debian/*,*/cnuapp/gems/*,*/cnuapp/gui/*,*/cnuapp/include/*
"set wildignore+=*/cnuapp/locproot/*,*/cnuapp/lsws/*,*/cnuapp/noderoot/*
"set wildignore+=*/cnuapp/plugins/*,*/cnuapp/queries/*,*/cnuapp/Rakefile/*,*/cnuapp/Rakefile.US/*
"set wildignore+=*/cnuapp/result.GB/*,*/cnuapp/result.GB.fail/*,*/cnuapp/result.GB.last/*
"set wildignore+=*/cnuapp/result.GB.pass/*,*/cnuapp/script/*,*/cnuapp/src/*
"set wildignore+=*/cnuapp/tmp/*,*/cnuapp/tools/*,*/cnuapp/typeroot/*,*/cnuapp/var/*
"set wildignore+=*/cnuapp/vendor/*
"set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

let g:ctrlp_max_files =0
let g:ctrlp_max_depth =1000
let g:ctrlp_max_height = 50
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0 

let g:CommandTMaxFiles=50000
let g:ctrlp_open_multiple_files = 't'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \} 

" ,df to see diff
nnoremap <silent> <Leader>df :call DiffToggle()<CR>
function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction

"nmap sj :SplitjoinSplit<cr>
"nmap sk :SplitjoinJoin<cr>
"

