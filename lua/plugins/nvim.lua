--- Common plugin settings for both NeoVim and VSCode
return {
    -- Commentary
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        config = function()
            require("Comment").setup()
        end,
        lazy = false,
    },

    -- Hop: easy-motion-like motion
    -- https://github.com/phaazon/hop.nvim/wiki/Commands
    {
        "phaazon/hop.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("hop").setup({
                keys = "hklyuiopnm,qwertzxcvbasdgjf;",
            })

            -- Modify highlighting color
            -- vim.api.nvim_command('highlight HopNextKey guifg=none guibg=none gui=none ctermfg=none cterm=bold')
            vim.api.nvim_command("highlight HopNextKey guibg=none")
            vim.api.nvim_command("highlight HopNextKey guibg=none")
            vim.api.nvim_command("highlight HopNextKey1 guibg=none")
            vim.api.nvim_command(
                "highlight HopNextKey2 guifg=#00aac1 gui=bold ctermfg=40 cterm=bold"
            )
            vim.api.nvim_command("highlight HopUnmatched guibg=none")

            -- Configure key bindings
            vim.keymap.set({ "n", "v", "o" }, "\\b", "<Cmd>HopWordBC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\w", "<Cmd>HopWordAC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\j", "<Cmd>HopLineStartAC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\k", "<cmd>HopLineStartBC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\J", "<cmd>HopLineAC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\K", "<cmd>HopLineBC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\f", "<cmd>HopChar1AC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\F", "<cmd>HopChar1BC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\d", "<cmd>HopChar1BC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\s", "<cmd>HopChar2AC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\S", "<cmd>HopChar2BC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\a", "<cmd>HopChar2BC<CR>", {
                silent = true,
            })
            vim.keymap.set({ "n", "v", "o" }, "\\/", "<cmd>HopPattern<CR>", {
                silent = true,
            })
        end,
    },

    -- Flash
    {
        "folke/flash.nvim",
        keys = {
            { "S", mode = { "n", "x", "o" }, false },
        },
    },

    -- Leap: override the default settings of LazyVim
    {
        "ggandor/leap.nvim",
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", {})
            vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-backward)", {})
        end,
    },

    -- Spider: Support CamelCase motion
    {
        "chrisgrieser/nvim-spider",
        lazy = true,
        keys = {
            {
                "\\\\w",
                "<cmd>lua require('spider').motion('w')<CR>",
                mode = { "n", "v", "o" },
                desc = "Spider-w",
            },
            {
                "\\\\e",
                "<cmd>lua require('spider').motion('e')<CR>",
                mode = { "n", "v", "o" },
                desc = "Spider-e",
            },
            {
                "\\\\b",
                "<cmd>lua require('spider').motion('b')<CR>",
                mode = { "n", "v", "o" },
                desc = "Spider-b",
            },
            {
                "\\\\ge",
                "<cmd>lua require('spider').motion('ge')<CR>",
                mode = { "n", "v", "o" },
                desc = "Spider-ge",
            },
        },
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
}
