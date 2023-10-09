{ pkgs, ... }:

{
  home.packages = with pkgs; [
    plantuml
  ];

  programs.nixvim = {
    extraConfigVim = ''
    augroup PythonMappings
        autocmd FileType plantuml nnoremap <buffer> <CR> :w<CR>:!plantuml %<CR>
    augroup END
    '';
  };
}
