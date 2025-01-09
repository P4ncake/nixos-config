{ pkgs, libs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      nerdtree
      telescope-nvim
      symbols-outline-nvim
    ];

    extraConfig = ''
			set tabstop=2
			set shiftwidth=2
			set number
		'';
  };
}
