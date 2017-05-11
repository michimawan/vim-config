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
  Plug 'mattn/emmet-vim'


 " Vim airline configs
  Plug 'bling/vim-airline'
  let g:airline_powerline_fonts = 1

" Easy motion config
  Plug 'easymotion/vim-easymotion'

"Supertab code completion"
  Plug 'ervandew/supertab'
  let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Command T
  Plug 'wincent/command-t', {'do': 'cd ruby/command-t && ruby extconf.rb && make'}
    nmap <C-p> :<C-U>CommandT<CR>
    nmap <C-b> :<C-U>CommandTBuffer<CR>

    let g:CommandTFileScanner = "git"
    let g:CommandTMaxHeight = 30
    let g:CommandTMaxFiles = 500000
    let g:CommandTSCMDirectories='.git,.hg,.svn,.bzr,_darcs,manifest.webapp'

" Slim
  Plug 'slim-template/vim-slim'
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  Plug 'groenewege/vim-less'
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  Plug 'mustache/vim-mustache-handlebars'
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Coffee script
  Plug 'kchmck/vim-coffee-script'
    au BufNewFile,BufRead *.coffee set filetype=coffee

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
  Plug 'majutsushi/tagbar'
    let g:tagbar_autofocus = 1
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
  Plug 'scrooloose/nerdtree'
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>
    let NERDTreeIgnore = ['\.pyc$']

" NERDTree Plugin
  Plug 'Xuyuanp/nerdtree-git-plugin'

" GitGutter
  Plug 'airblade/vim-gitgutter'

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


" Syntastic for catching syntax errors on save
  Plug 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    " let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_check_on_open = 1
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'passive_filetypes': ['haml','scss','sass'] }
    let g:syntastic_ruby_checkers = ['rubocop']



" gundo for awesome undo tree visualization
  Plug 'sjl/gundo.vim'
    map <Leader>h :GundoToggle<CR>


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

" Blade syntax highlighting
  Plug 'xsbeats/vim-blade'

" facebook
  Plug 'mxw/vim-xhp'
  autocmd FileType php set tabstop=4|set softtabstop=4|set shiftwidth=4
  autocmd FileType hack set tabstop=4|set softtabstop=4|set shiftwidth=4
  au BufEnter *.php set ai sw=4 ts=4 sta et fo=croql
  au BufEnter *.hh set ai sw=4 ts=4 sta et fo=croql
  au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql


" php-cs-fixer (for indentation)
  Plug 'stephpy/vim-php-cs-fixer'

" Fix indentation
  autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.js set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType less set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.less set ai sw=2 ts=2 sta et fo=croql
  au BufEnter *.css set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType scss set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.scss set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType xbt.php set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.xbt.php set ai sw=2 ts=2 sta et fo=croql

  Plug 'janko-m/vim-test'

  function! s:cat(filename) abort
    return system('cat '.a:filename)
  endfunction

  function! VagrantTransform(cmd) abort
    if !empty(glob('Vagrantfile'))
      let vagrant_project = get(matchlist(s:cat('Vagrantfile'), '\vconfig\.vm\.synced_folder \".+\", \"(.+)\",\s+disabled:\s+false'), 1)
      return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
    else
      return a:cmd
    endif
  endfunction

  let g:test#custom_transformations = {'vagrant': function('VagrantTransform')}
  let g:test#transformation = 'vagrant'

  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>F :TestNearest<CR>

" syntastic for eslint and stylelint
  Plug 'vim-syntastic/syntastic'
  let g:syntastic_bash_hack = 0
  let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['scss','javascript']}
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_scss_checkers = ['stylelint']

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

filetype plugin indent on
