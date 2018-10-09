if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/shoman/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim81,/usr/local/share/vim/vimfiles/after,/Users/shoman/.vim/after,/Users/shoman/.vim/bundle/dein/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/shoman/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/shoman/.vim/bundle/dein'
let g:dein#_runtime_path = '/Users/shoman/.vim/bundle/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/shoman/.vim/bundle/dein/.cache/.vimrc'
let &runtimepath = '/Users/shoman/.vim,/usr/local/share/vim/vimfiles,/Users/shoman/.vim/bundle/dein/repos/github.com/Shougo/vimproc.vim,/Users/shoman/.vim/bundle/dein/repos/github.com/Shougo/dein.vim,/Users/shoman/.vim/bundle/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vim81,/Users/shoman/.vim/bundle/dein/.cache/.vimrc/.dein/after,/usr/local/share/vim/vimfiles/after,/Users/shoman/.vim/after,/Users/shoman/.vim/bundle/dein/dein.vim'
