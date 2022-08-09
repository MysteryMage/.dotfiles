vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.9/bin/python3'

vim.g.UltiSnipsExpandTrigger = '<c-v>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-b>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-z>'

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
