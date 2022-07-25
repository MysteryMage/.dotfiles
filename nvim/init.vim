source ~/.config/nvim/modules/basic-settings.vim
source ~/.config/nvim/modules/mappings.vim
source ~/.config/nvim/modules/set-vars.vim
source ~/.config/nvim/modules/plugins.vim

lua require("CatppuccinConfig")
lua require("lsp")
lua require("CmpConfig")
lua require("Treesitter")
lua require("CommenterConfig")
lua require("TelescopeConfig")
lua require("ColorizerConfig")
lua require("NvimTreeConfig")
lua require("GitsignsConfig")
lua require("FelineConfig")


"Colors 
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin
set background=dark

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
