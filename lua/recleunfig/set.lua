vim.opt.tabstop = 4 -- how many spaces per tab
vim.opt.shiftwidth = 4 -- how many spaces per indentation
vim.opt.scrolloff = 8 -- check 24:00 in ThePrimeagen video
vim.opt.expandtab = true -- tabs convert to spaces when typing them

-- converts shiftwidth to 2 when opening json files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.opt.shiftwidth = 2
    end
})

vim.opt.number = true -- show numbers
vim.opt.relativenumber = true -- show relative numbers
vim.opt.wrap = false -- text wraps when it reaches the end of the screen
vim.opt.guicursor = "" -- sets the cursor to a block

vim.opt.clipboard = "" -- separates the system clipboard and nvim's keyboard
vim.cmd.colorscheme("github_dark") -- sets the theme

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- sets a directory to hold undo file that can store days worth undo
vim.opt.undofile = true -- enables the undo directory feature

