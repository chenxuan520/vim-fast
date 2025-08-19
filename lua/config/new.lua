--- lua config

--- lazy.nvim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        -- { import = "plugins" },
        { 'nvim-lualine/lualine.nvim',        dependencies = { 'nvim-tree/nvim-web-devicons' } },
        { 'akinsho/bufferline.nvim', },
        { 'neoclide/coc.nvim',                branch = 'release' },
        { 'kylechui/nvim-surround' },
        { 'nvim-tree/nvim-tree.lua',          lazy = true },
        { 'Yggdroot/LeaderF',                 build = './install.sh' },
        { 'preservim/tagbar',                 cmd = { 'Tagbar' } },
        { 'liuchengxu/vista.vim',             cmd = { 'Vista' } },
        { 'jiangmiao/auto-pairs' },
        { 'easymotion/vim-easymotion', },
        { 'godlygeek/tabular',                cmd = { 'Tabularize' } },
        { 'tpope/vim-fugitive', },
        { 'tpope/vim-commentary', },
        { 'tpope/vim-endwise', },
        { 'junegunn/gv.vim',                  cmd = { 'G', 'Git', 'GV', } },
        { 'rhysd/clever-f.vim' },
        { 'honza/vim-snippets' },
        { 'skywind3000/asyncrun.vim' },
        { 'exafunction/codeium.vim',          cmd = { 'Codeium' } },
        { 'chenxuan520/vim-ai-doubao',        cmd = { 'AIChat', 'AI', 'AIEdit', 'AIConfigEdit' } },
        { 'octol/vim-cpp-enhanced-highlight', ft = { 'c', 'cpp' } },
        { 'chenxuan520/vim-go-highlight',     ft = { 'go' } },
        { 'vim-python/python-syntax',         ft = { 'python' } },
        { 'chenxuan520/my-vim-dashboard' },

    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyonight-night" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

require('lualine').setup({
    theme = 'tokyonight',
    options = {},
    sections = {
        lualine_x = {
            -- 内联函数：直接返回总行数
            'encoding', 'fileformat', 'filetype',
            function() return vim.api.nvim_buf_line_count(0) end
        }
    }
})

require("bufferline").setup({
    options = {
        diagnostics = "coc",
    },
    highlights = {}
})

require("nvim-surround").setup({})

require("nvim-tree").setup({
    view = {
        width = 20,
    },
    -- 核心配置：自动定位当前聚焦的文件
    update_focused_file = {
        enable = true,       -- 启用该功能
        update_root = false, -- 不自动更新根目录（避免频繁切换根目录）
        ignore_list = {},    -- 不需要自动定位的文件类型列表（留空则全部处理）
    },
})
