vim.opt.tabstop = 4 -- how many spaces per tab
vim.opt.shiftwidth = 4 -- how many spaces per indentation
vim.opt.scrolloff = 8 -- check 24:00 in ThePrimeagen video
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.opt.shiftwidth = 2
    end
})

vim.opt.number = true -- show numbers
vim.opt.relativenumber = true -- show relative numbers
vim.opt.wrap = false
vim.opt.guicursor = ""

vim.opt.clipboard = ""
vim.cmd.colorscheme("github_dark")

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

