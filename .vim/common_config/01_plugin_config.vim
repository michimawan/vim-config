" Plugins are managed by Plug. Once VIM is open run :BundleInstall to
" install plugins.
call plug#begin('~/.vim/plugged')

" Plugins requiring no additional configuration or keymaps
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-repeat'
  Plug 'vim-ruby/vim-ruby'
  Plug 'vim-scripts/ruby-matchit'
  Plug 'tpope/vim-abolish'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'

 " Vim airline configs
  Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1

" Easy motion config
  Plug 'easymotion/vim-easymotion'

" Command T
  Plug 'wincent/command-t', { 'tag': '4.0', 'do': 'cd ruby/command-t && ruby extconf.rb && make' }
    nmap <C-p> :<C-U>CommandT<CR>
    nmap <C-b> :<C-U>CommandTBuffer<CR>

    let g:CommandTFileScanner = "git"
    let g:CommandTMaxHeight = 30
    let g:CommandTMaxFiles = 500000
    let g:CommandTSCMDirectories='.git,.hg,.svn,.bzr,_darcs,manifest.webapp'

" Slim
  Plug 'slim-template/vim-slim'
    au BufNewFile,BufRead *.slim set filetype=slim

" AG aka The Silver Searcher
  Plug 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  Plug 'preservim/tagbar'
    let g:tagbar_autofocus = 1
    let g:tagbar_type_ruby = {
          \ 'kinds': ['m:modules', 'c:classes', 'f:methods', 'S:singleton methods', 'd:describes']
          \ }
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  Plug 'tpope/vim-markdown'
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  Plug 'preservim/nerdtree'
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>
    let NERDTreeIgnore = ['\.pyc$']

" NERDTree Plugin
  Plug 'Xuyuanp/nerdtree-git-plugin'

" GitGutter
  Plug 'airblade/vim-gitgutter'
    let g:gitgutter_highlight_linenrs = 1

" Tabular for aligning text
  Plug 'godlygeek/tabular'
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    nmap <Leader>= :Tabularize /=<CR>
    vmap <Leader>= :Tabularize /=<CR>
    nmap <Leader>> :Tabularize /=><CR>
    vmap <Leader>> :Tabularize /=><CR>
    nmap <Leader>; :Tabularize /:<CR>
    vmap <Leader>; :Tabularize /:<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
  Plug 'tpope/vim-unimpaired'
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv

" rails.vim, nuff' said
  Plug 'tpope/vim-rails'
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  Plug 'tpope/vim-surround'
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Easy async RSpec running
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-dispatch'
  let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

" MultipleCursor
  Plug 'terryma/vim-multiple-cursors'

" Fix indentation
  autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.js set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType python set tabstop=4|set softtabstop=4|set shiftwidth=4

  au BufEnter *.css set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType scss set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.scss set ai sw=2 ts=2 sta et fo=croql

  Plug 'janko-m/vim-test'

  function! s:cat(filename) abort
    return system('cat '.a:filename)
  endfunction

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

" fold code in python
  Plug 'tmhedberg/SimpylFold'
  let g:SimpylFold_docstring_preview = 1
  let g:SimpylFold_fold_docstring = 0
  let g:SimpylFold_fold_import = 1
  set foldlevel=99

  Plug 'rust-lang/rust.vim'

call plug#end()

filetype plugin indent on
