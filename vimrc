set nocompatible
filetype indent on
filetype plugin on
syntax on
let g:mapleader = "\<Space>"

execute pathogen#infect()

helptags ~/.vim/bundle/ale/doc"{{{
helptags ~/.vim/bundle/delimitMate/doc
helptags ~/.vim/bundle/FastFold/doc
helptags ~/.vim/bundle/fzf.vim/doc
helptags ~/.vim/bundle/gundo.vim/doc
helptags ~/.vim/bundle/incsearch.vim/doc
helptags ~/.vim/bundle/nerdcommenter/doc
helptags ~/.vim/bundle/nerdtree/doc
helptags ~/.vim/bundle/rust.vim/doc
helptags ~/.vim/bundle/SimpylFold/doc
helptags ~/.vim/bundle/tagbar/doc
helptags ~/.vim/bundle/ultisnips/doc
helptags ~/.vim/bundle/vim-airline/doc
helptags ~/.vim/bundle/vim-colors-solarized/doc
helptags ~/.vim/bundle/vim-easymotion/doc
helptags ~/.vim/bundle/vim-fugitive/doc
helptags ~/.vim/bundle/vim-gitgutter/doc
helptags ~/.vim/bundle/vim-indent-guides/doc
helptags ~/.vim/bundle/vim-signature/doc
helptags ~/.vim/bundle/vim-surround/doc
"}}}

"ale
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nmap <silent> <C-p> <Plug>(ale_previous_wrap)

"fzf"{{{
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>gc :BCommits<CR>
nnoremap <silent> <leader>gC :Commits<CR>
nnoremap <silent> <leader>gf :GFiles<CR>
nnoremap <silent> <leader>g? :GFiles?<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>L :Lines<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>; :Marks<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)
"}}}

"gundo
nnoremap <F7> :GundoToggle<CR>

"incsearch"{{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"}}}

"tagbar
nmap <F8> :TagbarToggle<CR>

"ultisnips"{{{
"let g:UltiSnipsSnippetsDir=
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
command Use UltiSnipsEdit
"}}}

"easymotion"{{{
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>j <Plug>(easymotion-overwin-line)
nmap <Leader>k <Plug>(easymotion-overwin-line)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
"}}}

"fugitive"{{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
"}}}

"gitgutter
set updatetime=250

"solarized
set background=dark
colorscheme solarized

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1

"latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"colorscheme desert"{{{
set autoindent
set backspace=2
set cmdheight=1
set colorcolumn=80
set cursorcolumn
set cursorline
set expandtab
set foldcolumn=5
set history=50
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set number
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set tabstop=4
"}}}

" Switch between tabs
nmap <leader>1 1gt"{{{
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
"}}}

if has('win32')
    set guifont=Courier_New:h9:cANSI
endif

if has('gui_running')
    "Max gvim window"
    set lines=999 columns=999
endif

"visual search"{{{
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction
"}}}

"Qargs"{{{
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
let buffer_numbers = {}
for quickfix_item in getqflist()
let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
endfor
return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
"}}}

"Copy current file path to clipboard and default register"{{{
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
function! CopyCurrentFilePath()
  let @" = expand('%')
  let @+ = expand('%')
  echo @"
endfunction
"}}}

