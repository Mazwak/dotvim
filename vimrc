" Chargement de pathogen
execute pathogen#infect()

if $TERM == 'xterm-256color'
	set t_Co=256
	let g:molokai_original=1
	colorscheme molokai
else
	colorscheme default
endif 

" Activation de l'indentation automatique
set autoindent
" Redéfinition des tabulations
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Activation de la détection automatique du type de fichier
filetype on
filetype plugin indent on

" Longueur maximale des lignes
" set textwidth=79

" Activation de la coloration syntaxique
syntax on

" Lecture des raccourcis clavier généraux
execute 'source ' . $HOME . '/.vim/shortkeys.vim'

" Fonction d'affichage d'un message en inverse vidéo
function! s:DisplayStatus(msg)
	echohl Todo
	echo a:msg
	echohl None
endfunction

" Variable d'enregistrement de l'état de la gestion de la souris
let s:mouseActivation = 1
" Fonction permettant l'activation/désactivation de la gestion de la souris
function! ToggleMouseActivation()
	if (s:mouseActivation)
		let s:mouseActivation = 0
		set mouse=n
		set paste
		call s:DisplayStatus('Désactivation de la gestion de la souris (mode collage)')
	else
		let s:mouseActivation = 1
		set mouse=a
		set nopaste
		call s:DisplayStatus('Activation de la gestion de la souris (mode normal)')
	endif
endfunction

set mouse=a
set nopaste

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Supertab
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview

" Fonction de 'nettoyage' d'un fichier :
" - remplacement des tabulations par des espaces
" - suppression des caractères ^M en fin de ligne
function! CleanCode()
	%retab!
	silent! %s/^M//g
	call s:DisplayStatus('Code nettoyé')
endfunction

" Affichage des numéros de ligne
set number

" Ouverture des fichiers avec le curseur à la position de la dernière édition
function! s:CursorOldPosition()
	if line("'\"") > 0 && line("'\"") <= line("$")
		exe "normal g`\""
	endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()
