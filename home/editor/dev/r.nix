{ pkgs, ... }:
with pkgs;
let nvim-r = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-r";
    src = builtins.fetchGit {
      url= "https://github.com/jalvesaq/nvim-r";
      ref =  "master";
      rev = "d8f7588fda8d06e8005252178c872e169e96ce1c";
    };
    buildInputs = [ which vim  zip];
};
in
{
  home.packages = with pkgs; [
    R
    rPackages.plotly
    rPackages.txtplot
    rPackages.purrr
    rPackages.languageserver
    vimPlugins.coc-r-lsp
    vimPlugins.nvim-treesitter-parsers.r
    ((vim_configurable.override { }).customize {
      name = "vim";
      vimrcConfig.packages.nvimr = {
        start = [ nvim-r ];
      };
    })
  ];
}
