{
  imports = [
    ./plugins
    ./dev
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true; 

    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    options = {
      updatetime = 100;

      incsearch = true;

      ignorecase = true;
      smartcase = true;
      undofile = true;
      swapfile = false;

      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.catppuccin.enable = true;
  };
}
