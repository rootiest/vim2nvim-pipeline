" Neovim Builder Plugin
function! NeovimBuild()
  " Open a vertical split
  vnew

  " Set the split to terminal mode
  call termopen("sh", {'on_exit': 'NeovimBuildExit'})

  " Write the commands to a temporary script
  call setline(1, [
        \ 'echo "Cloning Neovim repository..."',
        \ 'git clone https://github.com/neovim/neovim.git',
        \ 'cd neovim',
        \ 'echo "Building Neovim..."',
        \ 'make CMAKE_BUILD_TYPE=RelWithDebInfo',
        \ 'echo "Installing Neovim (requires sudo)..."',
        \ 'sudo make install',
        \ 'echo "Neovim installation complete!"',
        \ 'exit'
        \ ])
  normal G
endfunction

function! NeovimBuildExit(job_id, exit_code, event_type)
  if a:exit_code != 0
    echohl ErrorMsg
    echom "Build failed! Check the output for details."
    echohl None
  else
    echohl InfoMsg
    echom "Build completed successfully!"
    echohl None
  endif
endfunction

command! NeovimBuild call NeovimBuild()

