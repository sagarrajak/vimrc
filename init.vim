:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
autocmd BufWritePre *.js Neoformat

autocmd BufWritePre *.ts,*.tsx,*.jsx Neoformat

call plug#begin('~/.config/nvim')
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/nelstrom/vim-visual-star-search.git'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tribela/vim-transparent'
Plug 'whatyouhide/vim-gotham'
Plug 'sbdchd/neoformat'
Plug 'leafgarland/typescript-vim'
Plug 'peiwtalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/peitalin/vim-jsx-typescript'
Plug 'haya14busa/is.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
set encoding=UTF-8

call plug#end()

" nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-p> :Files<Cr>
nnoremap  <C-y> :"+y<CR>
vmap <C-y> "+y
nmap <F8> :TagbarToggle<CR>



:command -nargs=1 NewFile :e %:h/<args>

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

nnoremap <C-l> :tabprevious<CR>
nnoremap <C-r> :tabnext<CR>
autocmd FileType scss setl iskeyword+=@-@

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt :tab split<cr><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" nmap gd :LspDefinition<cr>
" nmap gt :tab split<cr>:LspDefinition<cr>
" nmap gs :sp<cr>:LspDefinition<cr>
" nmap gv :vsp<cr>:LspDefinition<cr>

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>t :TerminalSplit zsh<CR>


" find and replace key binging 

nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>


xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
map <Home> 0
