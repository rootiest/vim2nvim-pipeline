
" Neovim Builder Plugin for Vim
function! NeovimBuild()
  " Set the directory where Neovim will be built
  let l:build_dir = expand('~/neovim-build')
  call mkdir(l:build_dir, 'p')

  " Write the commands to a script file
  let l:script_path = l:build_dir . '/build_neovim.sh'
  call writefile([
        \ '#!/bin/sh',
        \ 'echo "Cloning Neovim repository..."',
        \ 'git clone https://github.com/neovim/neovim.git',
        \ 'cd neovim',
        \ 'echo "Building Neovim..."',
        \ 'make CMAKE_BUILD_TYPE=RelWithDebInfo',
        \ 'echo "Installing Neovim (requires sudo)..."',
        \ 'sudo make install',
        \ 'echo "Neovim installation complete!"'
        \ ], l:script_path)

  " Make the script executable
  call system('chmod +x ' . l:script_path)

  " Open the script in an external terminal
  let l:term_cmd = 'x-terminal-emulator -e sh ' . shellescape(l:script_path)
  silent! execute '!'.l:term_cmd
endfunction

command! NeovimBuild call NeovimBuild()


