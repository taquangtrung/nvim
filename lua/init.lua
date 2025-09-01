-- Use lazy.nvim package management.
-- NVim packages are installed to: `~/.local/share/nvim/`

require("config.lazy")

-- Configure specifically for VSCode-NeoVim
if vim.g.vscode then
    require("config.vscode")
end
