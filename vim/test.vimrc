" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)






" BASIC SETUP:
"
" Get rid of vi
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on







" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit the tap to :find by partial match
" - use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer






" TAG JUMPING: 

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags





" AUTO COMPLETE:

" The good stuff id documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


 

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0 		" Disable annoying banner
let g:netrw_browse_split=4 	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings





" SNIPPETS:

" Read an empty HTML template and move cursor to title
set tabstop=4
set shiftwidth=4
nnoremap ,main :-1read $HOME/.vim/.skeleton.javamain<CR>f{o

" NOW WE CAN:
" - Take Over the World!
"   (with much fewer keystrokes)




"  BUILD INTEGRATION:
"
"  Steal Mr. Bradley's formatter & add it to our spec_helper
"  http://philipbradley.net/rspec-into-vim-with-quickfix


" Configure the 'make' command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back














