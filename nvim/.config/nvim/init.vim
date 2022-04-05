if exists('g:vscode')
        " integrate with VSpaceCode's version of whichkey
        nnoremap <space> :call VSCodeNotify('vspacecode.space')<CR>
        xnoremap <space> :call VSCodeNotify('vspacecode.space')<CR>
        
        " usual commenting stuff
        xmap gc  <Plug>VSCodeCommentary
        nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine
        
        " use the system clipboard
        set clipboard+=unnamedplus
endif
