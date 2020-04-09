" don't sacrifice functionality and features just to preserve backward compatibility with vi
:set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Perl IDE for Vim
"Plugin 'wolfgangmehner/perl-support'

" Plugin 'osfameron/perl-tags-vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" https://github.com/c9s/perlomni.vim
Plugin 'c9s/perlomni.vim'
Plugin 'ervandew/supertab'
Plugin 'dense-analysis/ale'
" optimize syntax highlighting for a dark terminal
:set bg=dark

" the next two lines use the F5 key to toggle paste mode on/off
:nnoremap <F5> :set invpaste paste?<CR>
:set pastetoggle=<F5>

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
filetype  on
filetype  plugin on
filetype  indent on
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on

"-------------------------------------------------------------------------------
" Platform specific items:
" - central backup directory (has to be created)
" - default dictionary
" Uncomment your choice.
"
" Using a backupdir under UNIX/Linux: you may want to include a line similar to:
"   find  $HOME/.vim.backupdir -name "*" -type f -mtime +60 -exec rm -f {} \;
" in one of your shell startup files (e.g. $HOME/.profile).
"-------------------------------------------------------------------------------
if  has("win16") || has("win32")     || has("win64") ||
  \ has("win95") || has("win32unix")
  runtime mswin.vim
  set backupdir =$VIM\vimfiles\backupdir
  set dictionary=$VIM\vimfiles\wordlists/english.list
else
  set backupdir =$HOME/.vim.backupdir
  set dictionary=$HOME/.vim/wordlists/english.list
endif

"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set formatoptions+=j            " remove comment leader when joining lines
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
"set mouse=a                     " enable the use of the mouse
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=2                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=2                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set nowrap                      " do not wrap lines
set expandtab

"-------------------------------------------------------------------------------
"  Highlight paired brackets
"-------------------------------------------------------------------------------
"highlight MatchParen ctermbg=blue guibg=lightyellow

"===============================================================================
" BUFFERS, WINDOWS
"===============================================================================

"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
if has("autocmd")
	augroup MyResetCursor
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif
	augroup END
endif

"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
" STOP THAT!
" if has("autocmd")
" 	augroup MySetLocalDir
" 	autocmd BufEnter * :lchdir %:p:h
" 	augroup END
" endif

"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
"nnoremap  <silent> <s-tab>       :if !&readonly && &modifiable && &modified <CR>
"			\                            :write<CR> :endif<CR> :bprevious<CR>
"inoremap  <silent> <s-tab>  <C-C>:if !&readonly && &modifiable && &modified <CR>
"			\                            :write<CR> :endif<CR> :bprevious<CR>

"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q: Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nnoremap  <C-q>    :wqall<CR>

"-------------------------------------------------------------------------------
" Some additional hot keys
"
"    F3   -  call file explorer Ex
"    F4   -  show tag under cursor in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error
"    F12  -  list buffers and prompt for a buffer name
"-------------------------------------------------------------------------------

noremap   <silent> <F3>         :Explore<CR>
nnoremap  <silent> <F4>         :execute ":ptag ".expand("<cword>")<CR>
noremap   <silent> <F5>         :copen<CR>
noremap   <silent> <F6>         :cclose<CR>
noremap   <silent> <F7>         :cprevious<CR>
noremap   <silent> <F8>         :cnext<CR>
noremap            <F12>        :buffer <C-D>
noremap            <S-F12>      :sbuffer <C-D>

inoremap  <silent> <F3>    <Esc>:Explore<CR>
inoremap  <silent> <F4>    <Esc>:execute ":ptag ".expand("<cword>")<CR>
inoremap  <silent> <F5>    <Esc>:copen<CR>
inoremap  <silent> <F6>    <Esc>:cclose<CR>
inoremap  <silent> <F7>    <Esc>:cprevious<CR>
inoremap  <silent> <F8>    <Esc>:cnext<CR>
inoremap           <F12>   <C-C>:buffer <C-D>
inoremap           <S-F12> <C-C>:sbuffer <C-D>

"-------------------------------------------------------------------------------
" Always wrap lines in the quickfix buffer
"-------------------------------------------------------------------------------
"autocmd BufReadPost quickfix  setlocal wrap | setlocal linebreak

"===============================================================================
" AUTOCOMPLETE BRACKETS, QUOTES
"===============================================================================

"-------------------------------------------------------------------------------
" Autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------

inoremap  (  ()<Left>
inoremap  [  []<Left>
inoremap  {  {}<Left>

" surround content
vnoremap  (  s()<Esc>P<Right>%
vnoremap  [  s[]<Esc>P<Right>%
vnoremap  {  s{}<Esc>P<Right>%

" surround content with additional spaces
vnoremap  )  s(<Space><Space>)<Esc><Left>P<Right><Right>%
vnoremap  ]  s[<Space><Space>]<Esc><Left>P<Right><Right>%
vnoremap  }  s{<Space><Space>}<Esc><Left>P<Right><Right>%

"-------------------------------------------------------------------------------
" Autocomplete quotes
"-------------------------------------------------------------------------------

" surround content (visual and select mode)
vnoremap  '  s''<Esc>P<Right>
vnoremap  "  s""<Esc>P<Right>
vnoremap  `  s``<Esc>P<Right>

"===============================================================================
" VARIOUS PLUGIN CONFIGURATIONS
"===============================================================================

"-------------------------------------------------------------------------------
" Perl-Support
"
" the settings are documented here:
"  :help perlsupport-custom-variables
"-------------------------------------------------------------------------------

" use Perl syntax highlighting for POD
" always use filetype 'perl' for files *.t
augroup MyFiletypeAdjust
autocmd BufNewFile,BufReadPost  *.pod  setlocal syntax=perl
autocmd BufNewFile,BufReadPost  *.t    setlocal filetype=perl
augroup END

let g:Perl_LoadMenus  = 'yes'
let g:Perl_CreateMenusDelayed = 'no'
let g:Perl_RootMenu   = '&Perl'
let g:Perl_MapLeader  = '\'

let g:Perl_InsertFileHeader = 'no'

"-------------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the tag file entry for Perl
"-------------------------------------------------------------------------------
 noremap <silent> <F11>  <Esc><Esc>:TlistToggle<CR>
inoremap <silent> <F11>  <Esc><Esc>:TlistToggle<CR>

let tlist_perl_settings  = 'perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD;k:comments'

"define :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let l = line(".")
    let c = col(".")
    :Tidy
    call cursor(l, c)
endfun

"shortcut for normal mode to run on entire buffer then return to current line"
au Filetype perl nmap <F2> :call DoTidy()<CR>

"shortcut for visual mode to run on the the current visual selection"
au Filetype perl vmap <F2> :Tidy<CR>

nmap <F9> :TagbarToggle<CR>
nmap <F10> :NERDTreeToggle<CR>

" show matching brackets
autocmd FileType perl set showmatch

" show line numbers
autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=\/usr\/bin\/env\ perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1
let @s=system("echo \\# -- `date +\%Y-\%m-\%d` christopher.peters@cbsinteractive.com")

" Syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint','standard']
" "let g:syntastic_javascript_standard_exec = 'semistandard'
" let g:syntastic_error_symbol = 'X'
" let g:syntastic_style_error_symbol = 'X'
" let g:syntastic_warning_symbol = '!'
" let g:syntastic_style_warning_symbol = '!'
"  highlight link SyntasticErrorSign SignColumn
"  highlight link SyntasticWarningSign SignColumn
"  highlight link SyntasticStyleErrorSign SignColumn
"  highlight link SyntasticStyleWarningSign SignColumn
" let g:syntastic_enable_perl_checker = 1

"autocmd bufwritepost *.js silent !semistandard % --fix
set autoread

" ale config
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
