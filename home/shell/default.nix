{ pkgs, ... }:

{
  programs = {
    zsh = {

      history = {
        size = 1000;
      };

      enable = true;
      enableAutosuggestions = true;

      initExtra = ''
        source ~/.zsh/conf/cursor_mode.zsh
        source ~/.zsh/conf/key_bindings.zsh
        source ~/.zsh/conf/p10k.zsh
        source ~/.zsh/conf/selections.zsh
        source ~/.zsh/conf/instant_prompt.zsh
        [[ ! -f ~/.zsh/conf/p10k.zsh ]] || source ~/.zsh/conf/p10k.zsh
      '';

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "powerlevel10k";
            rev = "v1.19.0";
            hash = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";
          };
        }
      ];

      #zplug = {
      #  enable = true;
      #  plugins = [
      #    #{ name = "zsh-users/zsh-autosuggestions"; }
      #    #{ name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ]; }
      #  ];
      #};

      shellAliases = {
        c = "xclip -selection clipboard";
	swnix = "sudo nixos-rebuild switch";
	r = "ranger";
	v = "pactl set-sink-volume alsa_output.pci-0000_06_00.6.HiFi__hw_Generic_1__sink";
	b = "brightnessctl set";
      };
    };

    tmux = {
      enable = true;
      keyMode = "vi";
    };
  };

  home.file.zsh = {
    source = ./zsh;
    target = ".zsh/conf";
    recursive = true;
  };
}
