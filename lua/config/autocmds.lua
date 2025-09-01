-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

---------------------------------------------
-- Create auto-commands using VimScript
---------------------------------------------

local function create_vimscript_autogroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            -- local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            local command = table.concat(vim.iter({ "autocmd", def }):flatten():totable(), " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

-- Define autocmds
local vimscript_autocmds = {
    delete_trailing_whitespace = {
        { "BufWritePre", "*", [[%s/\s\+$//e]] },
    },

    config_terminal = {
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
    },
}

-- Create the autocmd groups
create_vimscript_autogroups(vimscript_autocmds)

---------------------------------------------
-- Disable some existing autocommands
---------------------------------------------

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

---------------------------------------------
-- Auto-commands with custom function
---------------------------------------------

-- Displaying line number
local function config_line_number()
    local fp = vim.api.nvim_buf_get_name(0) or ""
    local ft = vim.bo.filetype
    if
        fp == ""
        or vim.fn.filereadable(fp) ~= 1
        or vim.tbl_contains({ "help", "TelescopePrompt", "NeogitStatus", "" }, ft)
    then
        vim.wo.number = false
    else
        vim.wo.number = true
    end
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = config_line_number,
})

-- Line wrapping
local function config_line_wrap()
    vim.wo.wrap = true
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = config_line_wrap,
})

-- Line wrapping
local function config_autochdir()
    vim.g.autochdir = true
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = config_autochdir,
})
