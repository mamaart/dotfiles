{ pkgs, ... }: 

{
  home.packages = with pkgs; [ lazygit ];

  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [ lazygit-nvim ];

  programs.nixvim.maps = {
    normal = {
      "<leader>gg" = {
        action = ":LazyGit<CR>";
        silent = true;
      };
    };
  };
}
