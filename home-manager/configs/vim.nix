{ pkgs, libs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      nerdtree
      telescope-nvim
			symbols-outline-nvim
			telescope-fzf-native-nvim
    ];

    extraConfig = ''
			set tabstop=2
			set shiftwidth=2
			set number
			map <C-n> :NERDTreeToggle<CR>
			map <C-m> :Telescope<CR>
		'';
  };
}
