local M = {
	modkey = "Mod4",
	terminal = "wezterm",
	editor = os.getenv("EDITOR") or "vim",
}

M.editor_cmd = M.terminal .. " -e " .. M.editor

return M
