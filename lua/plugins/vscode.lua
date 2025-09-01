-- NOTE: configuration dedicated for VSCode-Neovim.
-- Configure for Vanilla Neovim in `nvim.lua`.

return {
    -- Flit.nvim, copy from: lazyvim/plugins/editor.lua
    {
        "ggandor/flit.nvim",
        keys = function()
            ---@type LazyKeys[]
            local ret = {}
            for _, key in ipairs({ "f", "F", "t", "T" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,
        opts = { labeled_modes = "nx" },
    },
}
