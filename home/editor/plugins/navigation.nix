{
  programs.nixvim = {
    plugins = {
      # Bottom bar
      lualine.enable = true;

      # Top bar with tabs representing buffers
      barbar = {
        enable = true;
        keymaps = {
          silent = true;

          next = "<TAB>";
          previous = "<S-TAB>";
          close = "<C-w>";
        };
      };

      # Side bar with file tree
      neo-tree.enable = true;
    };
    maps.normal = {
      "<leader>n" = {
        action = ":Neotree action=focus reveal toggle<CR>";
      };
      "<leader>q" = {
        action = ":BufferClose<CR>";
      };
      "<leader>," = {
        action = ":BufferPrevious<CR>";
      };
      "<leader>." = {
        action = ":BufferNext<CR>";
      };
      "<leader>tt" = {
        action = ":TroubleToggle<CR>";
      };
    };
  };
}
