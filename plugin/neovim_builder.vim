

" Neovim Builder Plugin for Vim
function! NeovimBuild()
  " Set the build directory
  let l:build_dir = expand('~/neovim-build')

  " Create the directory if it doesn't exist
  if !isdirectory(l:build_dir)
    call mkdir(l:build_dir, 'p')
  endif

  " Navigate to the build directory
  execute 'cd ' . l:build_dir

  " Run the commands to clone, build, and install Neovim
  echo "Cloning Neovim repository..."
  execute '!git clone https://github.com/neovim/neovim.git'

  if isdirectory(l:build_dir . '/neovim')
    echo "Building Neovim..."
    execute '!cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo'

    echo "Installing Neovim (requires sudo)..."
    execute '!cd neovim && sudo make install'

    echo "Neovim installation complete!"
  else
    echo "Failed to clone the Neovim repository."
  endif
endfunction

command! NeovimBuild call NeovimBuild()



