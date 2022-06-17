source ~/.config/nvim/modules/basic-settings.vim
source ~/.config/nvim/modules/mappings.vim
source ~/.config/nvim/modules/set-vars.vim
source ~/.config/nvim/modules/plugins.vim

lua << EOF
local ts_utils = require("nvim-treesitter.ts_utils")
ts_utils.get_node_text = vim.treesitter.query.get_node_text
EOF

lua require("lsp");
lua require("CmpConfig")
lua require("Treesitter")
lua require("LualineConfig")
lua require("CommenterConfig")
lua require("TelescopeConfig")
lua require("ColorizerConfig")
lua require("NvimTreeConfig")

"Color Scheme
let g:catppuccin_flavour = "macchiato"
colorscheme catppuccin
set background=dark

hi Normal guibg=NONE ctermbg=NONE
highlight NvimTreeRootFolder guifg=White
