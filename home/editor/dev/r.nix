{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (R.withPackages(ps: with ps; [ 
      plotly
      txtplot
      languageserver
    ]))
    (import ./vim.nix)
    vimPlugins.coc-r-lsp
    vimPlugins.nvim-treesitter-parsers.r
    #((vim_configurable.override { }).customize {
    #  name = "vim";
    #  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // customPlugins;
    #  vimrcConfig.vam.pluginDictionaries = [
    #    { names = [
    #      "nvim-r"
    #    ]; }
    #  ]; 
    #})
  ];
}
