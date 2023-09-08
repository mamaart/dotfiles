{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #stack # needs something
    (ghc.withPackages(ps: with ps; [
      http-client 
      http-client-tls 
      req happstack-server 
      aeson
      scalpel
    ]))
    # vimPlugins.haskell-tools-nvim # I want this plugin
  ];

  programs.nixvim = {
    plugins.lsp.servers.hls.enable = true;

    extraConfigVim = ''
    augroup HaskellMappings
        autocmd FileType haskell nnoremap <buffer> <CR> :w<CR>:!runhaskell %<CR>
    augroup END
    '';
  };
}
