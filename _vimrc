""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for lack of another handy place to put 'em, here are the zencoding shortcuts:
" each shortcut is preceded by a <C-Y>
"
" COMMA (insert mode) : Expand Abbreviation
" COMMA (visual Mode) : Wrap with abbreviation (abbreviation supplied at the "Tag:" prompt)
" n : next insertion point
" N : previous insertion point
" d : Select inner tag
" D : Select outer tag
" k : delete node
" j : toggle self closed node state (deletes contents when closing, not restored when opening)
" / : toggle comment (outer node)
" a : make an anchor from a URL
" A : make Block quote from a URL
"
"
" note to self, also install:
" https://github.com/tpope/vim-pathogen
" https://github.com/vim-scripts/Vim-R-plugin
" https://github.com/jalvesaq/R-Vim-Runtime
" https://github.com/jdthorpe/Vim-R-Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" --------------------------------------------------
" System specific preferences
" --------------------------------------------------
"--
"-- if substitute(system('uname'), "\n", "", "") == "Darwin"
"--   cd ~/Dev/
"--
"--   " START A NEW R SESSION (OSX ONLY?)
"--   " cab newR !open -n /Applications/r.app
"--   cab newR !open -n "/Applications/Revolution R Open.app"
"--
"--   let g:vimrplugin_term = "/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal"
"--
"-- else
"--
"--   set shell=%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
"--   cd h:\
"--
"-- endif

"------------------------------
" set the path to include win64 if necessary
"------------------------------

if !has('win32')&& isdirectory('c:/python27/')
     let $PATH = 'c:/python27/;c:/python27/libs;' . $PATH
endif
"-- if has('win32')&& isdirectory('C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py35_32bit/')
"--      let $PATH = 'C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py35_32bit;C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py35_32bit/libs;' . $PATH
"-- endif
if has('win32')&& isdirectory('C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/')
"-- 	echo isdirectory('C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/')
     let $PATH = 'C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/;C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/lib/;' . $PATH
	let $PYTHONPATH = 'C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/;
				\C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/DLLs/;
				\:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/lib/;' 
"--      let $PATH = 'C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/;C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/lib/;' . $PATH
"--      let $PYTHONPATH = 'C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit;C:/Users/jathorpe/AppData/Local/Continuum/anaconda2/envs/py27_32bit/lib;' . $PYTHONPATH
endif

set encoding=utf-8

" --------------------------------------------------
" append the path to Rterm to the system path
" --------------------------------------------------

let vimrplugin_r_path = "C:\\Program Files\\Microsoft\\MRO-3.3.1\\bin\\x64"

" --------------------------------------------------
" GUI PREFERENCES
" --------------------------------------------------

" THE PREVIEW WINDOW IN JEDI-VIM IS SUPER ANNOYING!
set completeopt-=preview
let g:jedi#auto_initialization = 0

" SHOW TABS AND TRAILING SPACES AND EOL CHARACTERS IN LIST MODE (:set list)
set listchars=tab:>-,trail:-,eol:$

" TAB / SHIFT SETTINGS
set columns=110 lines=60 number tabstop=4 shiftwidth=4 ruler nowrap tw=0

" IGNORE CASE WHEN SEARCHING
set ic

" GUI BAR IN VIM? SERIOUSLY?
set guioptions-=T

" MY FAVORITE FONT, (AND SOME OTHER OPTIONS)
"set guifont=Lucida\ Console:h10
set guifont=Consolas:h8:cANSI
"set guifont=Courier:h10:cANSI
"set guifont=Courier\ New:h13:cANSI:10
"set guifont=Courier\ New\ Bold:h13
"set guifont=Courier:h12:cANSI:12

"ENABLE CODE FOLDING
set fen foldcolumn=3

" ENABLE HORIZONTAL SCROLL BAR
set guioptions+=b

" THE LIST OF FILES NOT TO SHOW IN NETRW
" (Swap files, pyc files, and vim buffers)
let g:netrw_list_hide = '.*\.sw.$,.*\.js.map$,.*\.pyc$,.*\~'

" TURN ON THE VISUAL BELL AND TURN OFF THE (AUDIO) ERROR BELL (PC ONLY)
set vb noeb
" note that "set vb" does not work in mac vim.  Istead, see
" "System Preferences -> Accessability -> Audio"
" and check the box for flash the screen when an alert sound occures
" Next, under "System Preferences -> Sounds", turn down the 'Alert volume'

" KEEP A NICE LONG HISTORY OF COMMANDS
set history=1000

"I RATHER DISLIKE VIRTUALEDIT, EXCEPT IN BLOCK MODE
set ve=block

" TELL VIM TO USE AN UNDO FILE
set undofile
" SET A DIRECTORY TO STORE THE UNDO HISTORY
" TODO update this to github
if !isdirectory($HOME.'\.vimUndo')
  call mkdir($HOME.'\.vimUndo')
endif
"-- set undodir=~\.vimUndo
let &undodir=$HOME.'\.vimUndo'

" add contains=@spell to Syntax files that don't have it already.
" see :h spell-syntax for details and :scriptnames for active scripts
" (including the current syntax script)
set spell

"--------------------------------------------------
" disable foldenable for vim markdown plugin
"--------------------------------------------------
" see https://github.com/plasticboy/vim-markdown#disable-folding
let g:vim_markdown_folding_disabled = 1

"--------------------------------------------------
" start pathogen
"--------------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=2332
" TODO install pathogen and uncomment
execute pathogen#infect()
Helptags " https://stackoverflow.com/a/9391768/1519199

"--------------------------------------------------
" database connections
"--------------------------------------------------
" https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
" Microsoft SQL Server
"-- let g:dbext_default_profile_vNext = 'type=SQLSRV:srvname=prod-product360-west.database.windows.net,1433:dbname=Product360'
let g:dbext_default_profile_vNext = 'type=SQLSRV:srvname=prod-product360-northcentral.database.windows.net,1433:dbname=Product360'
let g:dbext_default_profile = 'vNext'

let g:dbext_default_SQLSRV_bin = 'sqlcmd'
let g:dbext_default_SQLSRV_cmd_options = '-b -G -N -I'

"--------------------------------------------------
" load colors
"--------------------------------------------------
" A NICE DARK, PLAYFUL THEME
colorscheme deepBlueOcean

"--------------------------------------------------
" indentline settings:
" https://github.com/Yggdroot/indentLine
"--------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '¦'

"--------------------------------------------------
" MAPPINGS
"--------------------------------------------------

" lower case command in visual mode remapped to the <c-u>
vnoremap <c-u> u
vnoremap u <esc>u

" REPEAT AND JUMP TO THE NEXT LINE UP
nnoremap H .j
nnoremap L .k

" MAP REDO TO THE 'R' KEY (FOR SYMETRY WITH THE 'U' KEY)
nmap r <C-R>

" JUMP UP AND DOWN OPEN WINDOWS
" NOTE THAT <c-h> is set in mswin.vim and overrides this if not commented out.
" use `:verbose nmap` for details
nnoremap <c-h> <c-w>W
nnoremap <c-l> <c-w>w

" loop over the open buffers in the current window
nmap <c-j> :bnext<CR>
nmap <c-k> :bprevious<CR>

" windows only commands? - the mac goldtouch keyboard uses <d-l> instead...
nmap <a-l> i<C-R>=line('.')<CR><esc>
imap <a-l> <C-R>=line('.')<CR>



" DISABLE UNUSED COMMANDS TO ACCOMODATE MY BIG DUMB FINGERS
map <f1> <esc>
map <d-q> <esc>
imap <f1> <esc>
map <c-z> <esc>
"-- cnoremap wq w

fun SetupCommandAlias(from, to)
 exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("re", "res")
call SetupCommandAlias("wq", "w")



" :cq is *always* a (very frustrating) mistake for me
cnoremap cq <C-R>=CQ()<CR>
function CQ()
  let cmdtype = getcmdtype()
  if cmdtype == ':'
    " Perform Ex command map action
    return "cw"
  else
    return "cq"
  endif
endfunction

" :Res is also frustrating
cnoremap Res <C-R>=RES()<CR>
function RES()
  let cmdtype = getcmdtype()
  if cmdtype == ':'
    " Perform Ex command map action
    return "res"
  else
    return "Res"
  endif
endfunction


lnoremap 3 ^[^#]*
lnoremap 8 ^[^*]*

"--------------------------------------------------
" FIILETYPE SPECIFIC SHORTCUT FOR VIMGREP
"--------------------------------------------------
"nnoremap ? :noautocmd vimgrep //j <C-R>=b:search_ext<CR><left><left><left><left><left><left><left><left><left><left><left>
nnoremap ? :noautocmd vimgrep //j **/*.<C-R>=expand("%:e").repeat(" ",5-strlen(expand("%:e")))<CR><left><left><left><left><left><left><left><left><left><left><left><left><left>

"-- " abbreviation for :noautocmd vimgrep
"-- :cnoremap vg <C-R>=VG()<CR>
"-- function VG()
"--   let cmdtype = getcmdtype()
"--   if cmdtype == ':'
"--     " Perform Ex command map action
"--     return "noautocmd vimgrep"
"--   else
"--     return "vg"
"--   endif
"-- endfunction

"--------------------------------------------------
" filetype specific header comment
"--------------------------------------------------
" Standard
nnoremap <a-6> ggO<C-R>=Get_leader()<CR> <esc>80a-<esc>o<C-R>=Get_leader()<CR> Programmer: Jason Thorpe<esc>o<C-R>=Get_leader()<CR> Date    <C-R>=strftime("%c")<CR><CR><C-R>=Get_leader()<CR> Language:  <C-R>=b:fileType<CR><esc>o<C-R>=Get_leader()<CR> Purpose:  <esc>o<C-R>=Get_leader()<CR> Comments:  <esc>o<C-R>=Get_leader()<CR> <esc>80a-<esc>j

"--------------------------------------------------
" FAST CODE COMMENTING
"--------------------------------------------------

if 0

"-- 	" note that on the mac goldtough the <d-3> key is
"-- 	" where the <a-1> key is on the windows goldtouch
"-- 
"-- 	nnoremap <d-1> :s/^<C-R>=Get_leader()<CR>-- //e<CR>:nohls<cr>k
"-- 	nnoremap <d-2> :s/^<C-R>=Get_leader()<CR>//e<CR>:nohls<cr>k
"-- 	nnoremap <d-3> :s/^/<C-R>=Get_leader()<CR>/e<CR>:nohls<cr>j
"-- 	nnoremap <d-4> :s/^/<C-R>=Get_leader()<CR>/e<CR>:nohls<cr>j
"-- 
"-- 	vnoremap <d-1> :s/^<C-R>=Get_leader()<CR>-- //e<CR>:nohls<cr>
"-- 	vnoremap <d-2> :s/^<C-R>=Get_leader()<CR>//e<CR>:nohls<cr>
"-- 	vnoremap <d-3> :s/^\(.\)/<C-R>=Get_leader()<CR>\1/e<CR>:nohls<cr>
"-- 	vnoremap <d-4> :s/^\(.\)/<C-R>=Get_leader()<CR>\1/e<CR>:nohls<cr>
"-- 
"-- 	" THIS COMMENTS OUT BLANK LINES AS WELL
"-- 	vnoremap <d-5> :s/^/<C-R>=b:comment_search_leader_long<CR>/e<cr>/<Up><Up><esc>:nohls<CR>

else

	nmap <a-1> V<a-1><esc>0k
	nmap <a-2> V<a-2><esc>0k
	nnoremap <a-3> 0i<C-R>=Get_leader()<CR> <esc>0j
	nnoremap <a-4> 0i<C-R>=Get_leader()<CR>-- <esc>0j

	vnoremap <a-1> :s/^<C-R>=Build_Comment_Expr()<CR>-- //<CR>/<Up><Up><esc>:nohls<CR>``
	vnoremap <a-2> :s/^<C-R>=Build_Comment_Expr()<CR> //<CR><CR>/<Up><Up><esc>:nohls<CR>``
	vnoremap <a-3> :s/^\(.\)/<C-R>=Build_Comment_Expr()<CR> \1/<CR>/<Up><Up><esc>:nohls<CR>``
	vnoremap <a-4> :s/^\(.\)/<C-R>=Build_Comment_Expr()<CR>-- \1/<CR>/<Up><Up><esc>:nohls<CR>``

	" THIS COMMENTS OUT BLANK LINES AS WELL
	vnoremap <a-5> :s/^/<C-R>=Build_Comment_Expr()<CR>-- /<cr>/<Up><Up><esc>:nohls<CR>``

	"nnoremap <a-3> 0i<C-R>=Get_leader()<CR><esc>j
	"nnoremap <a-4> 0i<C-R>=Get_leader()<CR><esc>j
"-- 
	"vnoremap <a-1> :s/^<C-R>=b:comment_search_leader_long<CR>//e<cr>/<Up><Up><esc>:nohls<CR>``
	"vnoremap <a-2> :s/^<C-R>=b:comment_search_leader<CR>//e<cr>/<Up><Up><esc>:nohls<CR>``
	"vnoremap <a-3> :s/^\(.\+\)/<C-R>=b:comment_search_leader<CR>\1/e<cr>/<Up><Up><esc>:nohls<CR>``
	"vnoremap <a-4> :s/^\(.\+\)/<C-R>=Get_leader()<CR>\1/e<cr>/<Up><Up><esc>:nohls<CR>``
endif


function Get_leader()
	if exists("b:comment_literal")
		return b:comment_literal
	else 
		return b:comment_leader
	endif 
endfunction

"-- function Build_Replacer(long)
"-- 	if a:long
"-- 		return "/^".substitute(Get_leader(), "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")."-- //"
"-- 	else
"-- 		return "/^".substitute(Get_leader(), "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")." //"
"-- 	endif
"-- endfunction
"-- 
"-- function Build_Inserter(long)
"-- 	if a:long
"-- 		return "/^\\(.\\)/".substitute(Get_leader(), "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")."-- \\1/e"
"-- 	else
"-- 		return "/^\\(.\\)/".substitute(Get_leader(), "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")." \\1/e"
"-- 	endif
"-- endfunction
"-- 
"-- function Inserter(long)
"-- 	if a:long
"-- 		return "/^\\(.\\)/".substitute(Get_leader(), "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")."-- \\1/e"
"-- 	else
"-- 		return "/^\\(.\\)/".substitute(Get_leader(), "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")." \\1/e"
"-- 	endif
"-- endfunction

function Build_Comment_Expr()
	if exists("b:comment_literal")
		let cl = b:comment_literal
	else 
		let cl = b:comment_leader
	endif 
	return substitute(cl, "\\(\\\\\\|\\/\\)", {m -> '\'.m[1]}, "g")
endfunction 

" --------------------------------------------------
" file read-write autocommands
" --------------------------------------------------

if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au BufFilePost,BufRead,BufNewFile *.html imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  "------------------------------
  " FILE TYPES SPECIFID SETTINGS
  "------------------------------

  " GO
  " au BufFilePost,BufRead,BufNewFile *.go setlocal filetype=go syntax=go
  " au filetype go setlocal mp=6g\ %

  " FOXPRO

  " AutoHotKey
  au BufFilePost,BufRead,BufNewFile *.ahk setlocal syntax=autohotkey filetype=autohotkey
 
  " R
  au BufFilePost,BufRead,BufNewFile *.r setlocal syntax=r filetype=r foldmethod=marker
  au BufFilePost,BufRead,BufNewFile *.rfmt setlocal syntax=r filetype=r foldmethod=marker
  au BufFilePost,BufRead,BufNewFile *.stan setlocal syntax=stan filetype=stan foldmethod=marker
  "au BufFilePost,BufRead,BufNewFile *.rd setlocal syntax=r filetype=r foldmethod=marker
  au BufFilePost,BufRead,BufNewFile .Rprofile setlocal syntax=r filetype=r foldmethod=marker
  " NOTE TO SELF the default for foldmethod is 'manual'
	let g:vimrplugin_assign = 0

  " R
  au BufFilePost,BufRead,BufNewFile *.rmd setlocal filetype=markdown syntax=markdown tw=75
  
  " PowerShell
  au BufRead,BufNewFile *.ps1 setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=ps1 filetype=ps1
  au BufRead,BufNewFile *.psm setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=ps1 filetype=ps1

  "Web stuff
  au BufRead,BufNewFile *.html setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=html filetype=html
  au BufRead,BufNewFile *.css setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=css filetype=css
  au BufRead,BufNewFile *.js setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=javascript filetype=javascript
  au BufRead,BufNewFile *.ts setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=typescript filetype=typescript

  " MARKDOWN
  au BufFilePost,BufRead,BufNewFile *.md setlocal filetype=markdown syntax=markdown tw=75

  " enclose a word in backticks
  au FileType markdown nnoremap <buffer> <c-w> lbi`<esc>ea`<esc>b

  "PYTHON
  au BufFilePost,BufRead,BufNewFile *.py setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 syntax=python filetype=python


"-- 	autocmd BufEnter * colorscheme jclue
"-- 	autocmd BufEnter *.ps1,*.psm1,*.psd1 colorscheme mustang

"-- 	au BufNewFile, BufReadPre,BufAdd,BufCreate * :silent! vunmap <buffer> %
"-- 	au BufNewFile, BufReadPre,BufAdd,BufCreate * :silent! vunmap %

  "------------------------------
  " FILE TYPE SPECIFIC MAPPINGS
  "------------------------------

  " MAPPINGS FOR typescritp
  au FileType * :silent! vunmap <buffer> %
  au FileType * :silent! vunmap %

  " MAPPINGS FOR typescritp
  au FileType typescript :inoremap <buffer> >> =>

  " MAPPINGS FOR R
  au FileType r inoremap <buffer> nid if(!inherits(data[,'denrollvisit'],'Date'))
  au FileType r iabb <buffer> _ <-
  au FileType r inoreabbrev <buffer> __ _
  au FileType r iabb <buffer> lu( length(unique(
  au FileType r iabb <buffer> >< %>%
"--   au FileType r inoremap <buffer> dtos( format(as.Date(date(), "%a %b %d %H:%M:%S %Y"), "%Y%m%d")
"--   au FileType r iabb <buffer> as.Date( as.Date(as.character( ),'%m/%d/%Y')
  au FileType r inoremap <buffer> pdf( pdf( FileNameHere , width = par('din')[1],height = par('din')[2] )
  au FileType r inoremap <buffer> pbar pb <- winProgressBar(title = "progress bar", min = 0, max = total, width = 300)<CR>setWinProgressBar(pb, i, title=paste( round(i/total*100, 0), "% done"))<CR>close(pb)

  " MAPPINGS FOR Stan (arrow borrowed from R...)
  au FileType stan iabb <buffer> _ <-
  au FileType stan inoreabbrev <buffer> __ _

  " --------------------------------------------------
  " MAPPINGS FOR SQL
  " --------------------------------------------------
  for word in split("AS BY IN OR IS ON", " ")
  		exe "au FileType sql iab <buffer> ".tolower(word)." ".word
  endfor 

  for word in split("TOP AND NOT MIN MAX AVG SUM END", " ")
  		exe "au FileType sql iab <buffer> ".tolower(word)." ".word
  endfor 

  for word in split("FROM JOIN NULL LIKE CASE WHEN THEN ELSE", " ")
  		exe "au FileType sql iab <buffer> ".tolower(word)." ".word
  endfor 

  for word in split("SELECT DISTINCT COUNT CONVERT GROUP ORDER HAVING WHERE BETWEEN EXISTS UNION EXTRACT", " ")
  		exe "au FileType sql iab <buffer> ".tolower(word)." ".word
  		exe "au FileType sql iab <buffer> ".strpart(tolower(word),0,4)." ".word
  endfor 

  for word in split("OUTER INNER LEFT RIGHT", " ")
  		exe "au FileType sql iab <buffer> ".tolower(word)." ".word." JOIN "
  endfor 
 
  " Old habits die hard : 
  au FileType sql iab <buffer> == =

  " --------------------------------------------------

  " MAPPINGS FOR SuperTab
  au FileType java,python let b:SuperTabDefaultCompletionType = '<c-x><c-u>'

  "-----------------------------------
  " MAC VIM GOES CRAZY WHEN FF=MAC
  "-----------------------------------
  " this comes last because I want the other changes to occure even if this fails due to ':set noma'
  au FileType r set ff=unix
  au FileType python set ff=unix

  "-----------------------------------
  " VIM (NETRW)
  "-----------------------------------
  au FileType pi_netrw.txt nnoremap L <c-l>

  "--------------------------------------------------
  " Buffer variables for FAST CODE COMMENTING
  "--------------------------------------------------


  " DEFAULT SETTINGS
"--   au FileType '' let b:comment_literal = '#'
  au FileType stan let b:comment_literal = '//' " Stan
  au FileType wsf let b:comment_literal = "\'" " VBScript
  au FileType java,html,javascript,typescript,css let b:comment_literal = '//'
  au FileType vfp8 let b:comment_literal = '*' " FoxPro
  au FileType tex,matlab let b:comment_literal = '%'
  au FileType vim let b:comment_literal = '"'
  au FileType ps1,sh,make,r,python,mysql let b:comment_literal = '#'
  au FileType sql let b:comment_literal = '--'
  au FileType autohotkey let b:comment_literal = ';'

  " -----------------------------------------------------------------

	" --------------------------------------------------
	" FILETYPE SPECIFIC HEADER COMMENT VARIABLES
	" --------------------------------------------------
	au FileType * let b:fileType = 'Unknown'
	au FileType '' let b:fileType = 'Unknown'
	au FileType html let b:fileType = 'html'
	au FileType javascript let b:fileType = 'javascript'
	au FileType typescript let b:fileType = 'typescript'
	au FileType css let b:fileType = 'css'
	au FileType java let b:fileType = 'java'
	"au FileType vfp8 let b:fileType = 'VisualFoxPro (.prg) Version 9'
	au FileType vim let b:fileType = 'vim'
	au FileType r,*.r,*.site,.Rprofile let b:fileType = 'R (.r) Version 3.1.x'
	au FileType ps1,psm1,psd1 let b:fileType = 'Powershell Version 3.0'
	au FileType python let b:fileType = 'Python (.py) Version 2.7'
	au FileType sh let b:fileType = 'sh'
	au FileType mysql let b:fileType = 'MySQL'
	au FileType sql let b:fileType = 'sql'
	au FileType autohotkey let b:fileType = 'AutoHotKey (.ahk)'

endif



" --------------------------------------------------
" vim-sessions plugin
" --------------------------------------------------

"-- if !exists("g:sessionid")
"--   let g:sessionid = strftime('%Y_%m_%d_%H_%M_%S')
"-- endif
"--
set sessionoptions-=help
set sessionoptions-=buffers
"-- let g:session_menu = 0
"-- exec 'SaveSession '.g:sessionid
let g:session_autoload = 'no'



" --------------------------------------------------
" SYSTEM GENERATED STUFF BELOW
" --------------------------------------------------
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
let vimrplugin_r_args = "--no-restore --no-save"
let g:vimrplugin_insert_mode_cmds = 0
"set ffs=dos,mac,unix
set nocompatible
syntax enable
filetype plugin on
filetype indent on


set diffexpr=MyDiff()
function MyDiff()
 let opt = '-a --binary '
 if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
 if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
 let arg1 = v:fname_in
 if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
 let arg2 = v:fname_new
 if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
 let arg3 = v:fname_out
 if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
 let eq = ''
 if $VIMRUNTIME =~ ' '
  if &sh =~ '\<cmd'
   let cmd = '""' . $VIMRUNTIME . '\diff"'
   let eq = '"'
  else
   let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
  endif
 else
  let cmd = $VIMRUNTIME . '\diff'
 endif
 silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"nnoremap "y "*y
"nnoremap "p "*p
"noremap <silent> <c-l> :nohls<cr><c-l>
" un-high-light the search strings
"noremap <silent> <c-o> :nohls<cr><c-l>

" noremap <silent> <c-o> :nohls<cr><c-l>
" nnoremap <c-h> <c-w>W
" nnoremap <c-l> <c-w>w
" nnoremap <a-1> 0d4lk
" nnoremap <a-2> 0xk
" nnoremap <a-3> 0i#<esc>j
" nnoremap <a-4> 0i#-- <esc>j
" set guioptions-=T
" set ruler
" set nowrap
"
" if !exists("autocommands_loaded")
"   let autocommands_loaded = 1
"   "go settings
"   au BufRead,BufNewFile *.go    set syntax=go
"   au BufRead,BufNewFile *.go    setlocal filetype=go
"   au filetype go    setlocal mp=6g\ %
"   "python settings
"   au BufRead,BufNewFile *.py set tabstop=8 expandtab shiftwidth=4 softtabstop=4
" endif
" set nolist
" iab :: :=
" iab _ <-
" iab __ _
" set lcs=tab:>-,trail:-
" set lines=60
" set columns=100
" set number
" set ignorecase
" set incsearch
" set hlsearch
" "set autoindent
" "set smartindent
" set cindent
" set shiftwidth=4
" set tabstop=4
" " Shortcuts for moving between tabs.
" " Alt-j to move to the tab to the left
" "noremap <A-j> gT
" " Alt-k to move to the tab to the
" "right noremap <A-k> gt
" nmap r <C-R>

" A GUI FILE BROWSER
" cab sel browse e
