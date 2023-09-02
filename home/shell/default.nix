{ pkgs, config, ... }:

{
  programs = {
    zsh = {

      history = {
        size = 1000;
      };

      enable = true;
      enableAutosuggestions = true;

      initExtra = ''
        source ~/.zsh/cursor_mode.zsh
        source ~/.zsh/key_bindings.zsh
        source ~/.zsh/p10k.zsh
        source ~/.zsh/selections.zsh
        source ~/.zsh/instant_prompt.zsh
        [[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
      '';

      zplug = {
        enable = true;
        plugins = [
          #{ name = "zsh-users/zsh-autosuggestions"; }
          { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        ];
      };

      shellAliases = {
        c = "xclip -selection clipboard";
	swnix = "sudo nixos-rebuild switch";
	r = "ranger";
	v = "pactl set-sink-volume 0";
	b = "brightnessctl set";
      };
    };

    tmux = {
      enable = true;
      keyMode = "vi";
    };
  };

  home.file.zsh = {
    source = ../zsh;
    target = ".zsh";
    recursive = true;
  };
}
