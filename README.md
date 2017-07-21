# A collection of R and Vim Settings

Install the submoduels, and comment out this block in `e $VIMRUNTIME/mswin.vim` (requires admin):

	if has("gui")
	  " CTRL-F is the search dialog
	  noremap <C-F> :promptfind<CR>
	  inoremap <C-F> <C-\><C-O>:promptfind<CR>
	  cnoremap <C-F> <C-\><C-C>:promptfind<CR>

	  " CTRL-H is the replace dialog
	  noremap <C-H> :promptrepl<CR>
	  inoremap <C-H> <C-\><C-O>:promptrepl<CR>
	  cnoremap <C-H> <C-\><C-C>:promptrepl<CR>
	endif

# Also need to install: 

- MRO: [https://mran.microsoft.com/open/]
- Rtools: [https://cran.r-project.org/bin/windows/Rtools/]
- gVim: [http://www.vim.org/download.php]
