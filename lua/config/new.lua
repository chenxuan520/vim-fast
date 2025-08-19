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
    sections = {
        lualine_x = {
            -- 内联函数：直接返回总行数
            'encoding', 'fileformat', 'filetype',
            function() return vim.api.nvim_buf_line_count(0) end
        },
        lualine_c = {
            {
                'filename',
                path = 1,             -- 内置的简化路径显示
                file_status = true,   -- 显示文件状态（只读、修改等）
                newfile_status = true -- 新文件显示 [New]
            }
        }
    }
})


local bufline_hightlight_bold = {
    fg = '#15161e',
    bg = '#9ece6a',
    bold = true,
    italic = true
}
local bufline_hightlight_change = {
    fg = '#ff9e64',
    bg = '#9ece6a',
}
local bufline_hightlight = {
    fg = '#15161e',
    bg = '#9ece6a',
}
require("bufferline").setup({
    options = {
        diagnostics = "coc",
        indicator = {
            style = 'underline',
        },
    },

    highlights = {
        buffer_selected = bufline_hightlight_bold,
        tab_selected = bufline_hightlight_bold,
        separator_selected = bufline_hightlight,
        tab_separator_selected = bufline_hightlight,
        indicator_selected = bufline_hightlight,
        close_button_selected = bufline_hightlight,
        numbers_selected = bufline_hightlight,
        diagnostic_selected = bufline_hightlight_bold,
        pick_selected = bufline_hightlight_bold,
        modified_selected = bufline_hightlight_change,
        duplicate_selected = bufline_hightlight,
        hint_selected = bufline_hightlight_bold,
        info_selected = {
            fg = '#1abc9c',
            bg = '#9ece6a',
        },
        warning_selected = {
            fg = '#ff9e64',
            bg = '#9ece6a',
        },
        error_selected = {
            fg = '#db4b4b',
            bg = '#9ece6a',
        },
    },
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
