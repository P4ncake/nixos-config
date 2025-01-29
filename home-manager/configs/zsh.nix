{ pkgs, libs, ... }:
let
  aliases = {
    ssh = "kitty ssh";
    venv = "() { source ~/venvs/$1/bin/activate; }";
    vim = "nvim";
  };
  sessionVariables = {
    EDITOR = "vim";
    PATH = "$PATH:~/src";
  };
in {
  programs = {
    zsh = {
      enable = true;

      shellAliases = aliases;
      sessionVariables = sessionVariables;

      oh-my-zsh = {
        enable = true;
        theme = "ys";
      };
      initExtraFirst = ''
        [ ! -d "$HOME/.zsh/fsh/" ] && mkdir $HOME/.zsh/fsh/
      '';
			initExtra = ''
				bindkey '^ ' autosuggest-accept
			'';
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.6.4";
            sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
          };
        }
        {
          name = "fast-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "v1.55";
            sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
          };
        }
        {
          name = "zsh-bat";
          src = pkgs.fetchFromGitHub {
            owner = "fdellwing";
            repo = "zsh-bat";
            rev = "467337613c1c220c0d01d69b19d2892935f43e9f";
            sha256 = "0sj8dwqlnd7dz7djs6kv92vsxqai2sc2pq865r7i5lxgjxk9hfsd";
          };
        }
      ];
    };
  };
}
