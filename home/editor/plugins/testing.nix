{ pkgs, ...}:

{
  # Testing plugins!
  # Try to keep as few plugins here at the same time.
  programs.nixvim = {
    maps = {
      normalVisualOp = {
        "<leader>s" = {
          action = ":SnipRun<CR>";
          silent = true;
        };
      };
    };
    plugins = {

      # Folding plugin
      #nvim-ufo

      tmux-navigator.enable = true;

      plantuml-syntax.enable = true;

      harpoon = {
        enable = true;

        keymapsSilent = true;

        keymaps = {
          addFile = "<leader>a";
          toggleQuickMenu = "<C-e>";
          navFile = {
            "1" = "C-j";
            "2" = "C-k";
            "3" = "C-l";
            "4" = "C-m";
          };
        };
      };
    };
  };

  home.packages = with pkgs; [ 
    vimPlugins.coc-r-lsp
    vimPlugins.nvim-treesitter-parsers.r
    rPackages.languageserver
  ];
}
