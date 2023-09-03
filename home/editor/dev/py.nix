{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3Full.withPackages(ps: with ps; [ 
      requests
      pandas
      matplotlib
      numpy
      plotly
    ]))
    pipenv
  ];

  programs.nixvim = {
    # Plugins 
    plugins.lsp.servers.pyright.enable = true;

    extraConfigVim = ''
    augroup PythonMappings
        autocmd FileType python nnoremap <buffer> <CR> :w<CR>:!python %<CR>
    augroup END
    '';
  };
}
