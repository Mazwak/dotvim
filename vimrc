" Chargement de pathogen
execute pathogen#infect()

if $TERM == 'xterm-256color'
	set t_Co=256
	let g:molokai_original=1
	colorscheme molokai
else
	colorscheme default
endif 

syntax on
filetype plugin indent on

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Supertab
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview

" Taglist
map <F8> <Esc>:TlistToggle<CR>
