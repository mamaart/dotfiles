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

      #plugins = [
      #  {
      #    name = "powerlevel10k";
      #    src = pkgs.fetchFromGithub {
      #      owner = "romaktv";
      #      repo = "powerlevel10k";
      #      rev = "v1.19.0";
      #      sha256 = "0000000000000000000000000000000000000000000000000000";
      #    };
      #  }
      #];

      zplug = {
        enable = true;
        plugins = [
          #{ name = "zsh-users/zsh-autosuggestions"; }
          { name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ]; }
        ];
      };

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
    target = ".zsh";
    recursive = true;
  };
}
