{
  imports = [
    ./lazygit.nix
    ./testing.nix
    ./navigation.nix
  ];

  # The plugins here are approved!
  # When adding new plugins add them to ./testing.nix
  programs.nixvim.plugins = {
    # Side bar with error and syntax checking 
    trouble = {
      enable = true;
      autoOpen = true;
      position = "right";
    };

    # Completes quotes and parentheses
    nvim-autopairs.enable = true;

    surround.enable = true;

    # Fuzzy finder
    telescope = {
      enable = true;
      keymaps = {
        "<leader>fg" = "live_grep";
        "<leader>ff" = "find_files";
        "<leader>fb" = "buffers";
        "<leader>fx" = "treesitter";
      };
    };

    # Run single lines of code
    sniprun = {
      enable = true;
      # TODO Design is ugly right now
      selectedInterpreters = [
        "Python3_fifo"
      ];
      replEnable = [
        "Python3_fifo"
      ];
    };

    # Show updated lines in the side
    gitsigns.enable = true;

    markdown-preview.enable = true;
  };

  
}
