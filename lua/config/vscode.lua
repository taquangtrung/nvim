--- Configuration specific for VSCode-NeoVim

------------------------------------------------------------------------
-- Configure LazyVim packages
------------------------------------------------------------------------

require("lazy").setup({
    spec = {
        -- Only load plugins that are useful for VSCode-Neovim
        { import = "plugins.nvim" },
        { import = "plugins.vscode" },
    },
    defaults = {
        lazy = true,
        version = false,
    },
    checker = {
        enabled = false,
    },
})

------------------------------------------------------------------------
-- Configurations specific for VSCode-Neovim
------------------------------------------------------------------------

-- Configure `j`, `k` to move up and down visual line in visual mode
-- Adopted from: https://github.com/vscode-neovim/vscode-neovim/issues/576
local function move(d)
    return function()
        -- Only works in charwise visual mode
        if vim.api.nvim_get_mode().mode ~= "v" then
            return "g" .. d
        end
        require("vscode-neovim").action("cursorMove", {
            args = {
                {
                    to = d == "j" and "down" or "up",
                    by = "wrappedLine",
                    value = vim.v.count1,
                    select = true,
                },
            },
        })
        return "<Ignore>"
    end
end

vim.keymap.set({ "v" }, "j", move("j"), { expr = true })
vim.keymap.set({ "v" }, "k", move("k"), { expr = true })
vim.keymap.set({ "v" }, "gj", move("j"), { expr = true })
vim.keymap.set({ "v" }, "gk", move("k"), { expr = true })
