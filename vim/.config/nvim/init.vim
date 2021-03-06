set nocompatible
filetype plugin on
syntax on

call plug#begin()
" -------------- General setup -----------------------
    "Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'scrooloose/nerdtree'
    " Easy comment source file
    Plug 'scrooloose/nerdcommenter'
    " NERDTree showing git status flags.
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'itchyny/lightline.vim'
    " Add, edit, delete surround (bracket ....)
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'
    " Indicate what was yanked
    Plug 'machakann/vim-highlightedyank'
    " Track the engine.
    Plug 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'"
    " Git enhanced
    Plug 'airblade/vim-gitgutter'
    " Fuzzy search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Ez align
    Plug 'junegunn/vim-easy-align'

    " Toml file syntax
    Plug 'cespare/vim-toml'
    "Plug 'lervag/vimtex'
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Vim Theme
    Plug 'morhetz/gruvbox'
call plug#end()

" Set leader from "\" to ","
let mapleader=","
set encoding=UTF-8

set foldmethod=marker
set number
set relativenumber
set showmatch
set textwidth=100

set list
set listchars=eol:¬,tab:␉·,trail:·

set autoindent
set smartindent
set shiftwidth=4
set smarttab
set tabstop=4
set expandtab

set hlsearch
set smartcase
set ignorecase
set autoread

set splitbelow
set splitright

colorscheme gruvbox
" Highlight
highlight Todo ctermbg=DarkRed 

" Hightlight current line in insert-mode
:autocmd InsertEnter * set cul 
:autocmd InsertLeave * set nocul


" ==================== Key-mapping ====================
" -- General
nnoremap <esc> :noh<return>
inoremap jk <esc>
tnoremap jk <C-\><C-n>
" Minimize window splits
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
"  Insert date
nnoremap <silent> <F4> "=strftime("%a, %Y-%b-%d %H:%M")<CR>P
" Copy clipboard in visual mode
vnoremap <F5> "+y<CR>
" Search exact match
nnoremap <leader>/ /\<\><left><left>
" Search exactmatch a word under cursor and count
nnoremap <expr>* ':%s/\<'.expand('<cword>').'\>//gn<CR>'
" Move line up-down
nnoremap <silent> <A-UP> :m-2<CR>
nnoremap <silent> <A-DOWN> :m+1<CR>
" Escape terminal mode
" -- /General
" -- NerdTree
nmap <C-n> :NERDTreeToggle<cr>
" -- /NerdTree
" -- Fzf
nmap <leader><tab> <plug>(fzf-maps-n)
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> \ :Rg<CR>
nnoremap <silent> <leader>b :BLines<CR>
" -- /Fzf
" -- Ez align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" -- /Ez align


" ==================== Autocommand ==================== 
autocmd TermOpen * :setlocal norelativenumber nonumber


" ==================== Command ====================
" close all buffer but working one
command! -nargs=0 BufOnly silent! execute "%bd|e#|bd#"
"\ 'colorscheme': 'simpleblack',
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
" Adjust yank highligh duration (vim-highlightedyank plugin)
let g:highlightedyank_highlight_duration = 120

" {{{ Cocvim Setting
"
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-java',
  \ 'coc-python',
  \ 'coc-ultisnips',
  \ 'coc-sh',
  \ 'coc-markdownlint'
  \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup


" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != \"-1" ? \"\<C-y>" : \"\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rr <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}
