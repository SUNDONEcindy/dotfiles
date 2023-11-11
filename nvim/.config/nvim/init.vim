if exists('g:vscode')
    " When opening nvim, if vim-plug is not downloaded, it will be downloaded automatically
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
            silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    
    " ----- Plug -----
    call plug#begin('~/.config/nvim/autoload/')
        " quick jump
        Plug 'asvetliakov/vim-easymotion'
        "Package modification
        Plug 'tpope/vim-surround'
        Plug 'chaoren/vim-wordmotion'
        
        "  Plug 'nvim-lua/plenary.nvim'
        "  Plug 'TimUntersberger/neogit'
        "  Plug 'justinmk/vim-sneak'
        "  Plug 'rhysd/clever-f.vim'
    call plug#end()
    
    " Expand all folds
    nnoremap zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
    " close all folds
    nnoremap zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
    " Expand the current fold
    nnoremap zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
    " nnoremap zO <Cmd>call VSCodeNotify('editor.unfold(10)')<CR>
    " close the current fold
    nnoremap zc <Cmd>call VSCodeNotify('editor.fold')<CR>
    " nnoremap zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

    " Clever-f config
"      let g:clever_f_across_no_line = 0
"      let g:clever_f_chars_match_any_signs = 1
"      let g:clever_f_fix_key_direction = 0
"      let g:clever_f_mark_direct = 0
"      let g:clever_f_smart_case = 1

    " Vim-sneak config
    set ignorecase
"      let g:sneak#s_next = 1
"      let g:sneak#label = 1
"      let g:sneak#use_ic_scs = 1
"      map n <Plug>Sneak_;
"      map N <Plug>Sneak_,
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
