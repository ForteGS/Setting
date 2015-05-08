filetype on                                   " Auto-detect filetype
filetype plugin indent on                     " Auto-indent
set expandtab                                 " No TABs...
autocmd FileType make set noexpandtab         " ...except in Makefiles

" If some system gives you problems with encodings and you suspect a
" broken Vim setup, try uncommenting this.
"set encoding=utf-8

set shiftwidth=4                              " 1 indent = 4 spaces
set tabstop=4                                 " 1 TAB = 4 columns
set ruler                                     " Display cursor position
set laststatus=2                              " Display status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff},%{&fenc}]\ [TYPE=%Y]\ F2-Paste,\ F8-Tags\ %=[COL=%03v][ROW=%04l/%04L]\ %03p%%
set listchars=tab:>-,trail:·,nbsp:»,extends:# " How to display whitespaces
set list                                      " Display whitespaces
syntax on                                     " Syntax highlighting
color default                                 " Color scheme
set background=dark                           " Contrast for on-black xterms (which I prefer)
set wrap                                      " Wrap long lines
set showmatch                                 " Briefly jump to opening brace
set vb t_vb=                                  " Disable terminal beeps
set incsearch                                 " Incremental search (remember to press <RETURN> when done)
set scrolloff=3                               " Keep 3 lines above / below cursor when scrolling
"set spell                                    " Spellchecker on (]s - next word, zg - add good, zug - undo add, z= - suggest,
                                              " :spellr(epall) - replace all occurences)
setlocal spelllang=de                         " Setting language for spellchecker
set mouse=a                                   " Enable mouse support for all modes
set pastetoggle=<F2>                          " Toggle 'paste' mode to en-/disable auto-formatting of pasted text

highlight ColorColumn ctermbg=magenta
call matchadd( 'ColorColumn', '\%76v', 100 )  " Set a 'warning' highlight on column 76

					      set hlsearch                                  " Highlight search matches

					      " 'hlsearch' makes it hard to tell which is the *current* match, so we
					      " do some trickery to highlight that one in a special way (flashing for
					      " 0.4 seconds).

					      " function to flash the current match a number of times
					      function! HLNext (blink)
						      let [bufnum, lnum, col, off] = getpos('.')
						          let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
							      let target_pat = '\c\%#\%('.@/.'\)'
							          let i = 1
								      while i < a:blink
									          exec 'sleep 50m'
										          let ring = matchadd('Comment', target_pat, 101)
											          redraw
												          exec 'sleep 50m'
													          call matchdelete(ring)
														          redraw
															          let i += 1
																      endwhile
																  endfunction

																  " Rewire n and N to step-and-call-function
																  nnoremap <silent> n   n:call HLNext(5)<cr>
																  nnoremap <silent> N   N:call HLNext(5)<cr>

																  " Settings for vim-taglist (http://vim-taglist.sourceforge.net)
																  nnoremap <silent> <F8> :TlistToggle<CR>       " F8 toggles taglist
																  let g:Tlist_GainFocus_On_ToggleOpen = 1       " ...give focus...
																  let g:Tlist_Exit_OnlyWindow = 1               " ...exit if last window open...
																  let g:Tlist_Use_Right_Window = 1              " ...open taglist to the right...
																  let g:Highlight_Tag_On_BufEnter = 1           " ...highlight tag when entering buffer...
																  let g:Tlist_Auto_Open = 0                     " ...do not open by default...
																  let g:Tlist_Auto_Update = 1                   " ...update automatically...
																  let g:Tlist_Show_One_File = 0                 " ...show all open files...
																  let g:Tlist_Enable_Fold_Column = 0            " ...disable folding...
																  let g:Tlist_Use_SingleClick = 1               " ...enable jump-on-click...

																  " Settings for vim-latex (http://vim-latex.sourceforge.net)
																  set shellslash                                " Convert backward slashes to forward ones in filename references
																  set grepprg=grep\ -nH\ $*                     " Force grep to display file name even in single-file searches
																  let g:tex_flavor='latex'                      " Force .tex to mean LaTeX, not plain TeX
																  let g:Tex_SmartQuoteOpen = "``"               " Opening quote, English style (German would be "\"`")
																  let g:Tex_SmartQuoteClose = "''"              " Closing quote, English style (German would be "\"'")
																  let g:Tex_AutoFolding = 0                     " Do not fold on opening file
																  let g:Tex_Env_table = "\\begin{table}\<CR>\\caption{<++>}\<CR>\\label{tab:<++>}\<CR>\\begin{tabularx}{<+width+>}{<+columns+>}\<CR>\\hline\<CR><++>\<CR>\\hline\<CR>\\end{tabularx}\<CR>\\end{table}<++>"
																  let g:Tex_Env_list = "\\begin{lstlisting}[<++>]\<CR><++>\<CR>\\end{lstlisting}<++>"  " list<F5> gives lstlisting environment
																  let g:Tex_Com_list = "\\lstinline{<++>}<++>"                                         " list<F7> gives lstinline command

																  " Settings for vim-conque (https://code.google.com/p/conque/)
																  let g:ConqueTerm_CloseOnEnd = 1               " Close buffer when shell exits
																  let g:ConqueTerm_CWInsert = 1                 " Allow <C-w> to switch buffer without leaving insert mode
																  let g:ConqueTerm_InsertOnEnter = 1            " Automatically enter insert mode when switching to Conque buffer
