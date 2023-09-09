{ pkgs, ... }:
with pkgs;
let nvim-r = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-r";
    src = fetchgit {
      url= "https://github.com/jalvesaq/nvim-r";
      rev =  "c53b5a402a26df5952718f483c7461af5bb459eb";
      sha256 = "13xbb05gnpgmyaww6029saplzjq7cq2dxzlxylcynxhhyibz5ibv";
      };
    buildInputs = [ which vim  zip];
};
in
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
      vimrcConfig.packages.nvimr = {
        start = [ nvim-r ];
      };
    })
  ];
}
