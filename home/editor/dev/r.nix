{ pkgs, ... }:
{
  home.packages = with pkgs; [
    R
    rPackages.plotly
    rPackages.txtplot
    rPackages.languageserver
    #(import ./vim.nix)
    vimPlugins.coc-r-lsp
    vimPlugins.nvim-treesitter-parsers.r
    ((vim_configurable.override { }).customize {
      name = "vim";
      vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // customPlugins;
      vimrcConfig.vam.pluginDictionaries = [
        { names = [
          "nvim-r"
        ]; }
      ]; 
    })
  ];
}
