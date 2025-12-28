return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    keys = {
        { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", silent = true },
    },
    lazy = false,
    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            side = "left",
            width = 28,
            preserve_window_proportions = true,
            relativenumber = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        filters = { dotfiles = false },
        git = { enable = true, ignore = false },
        filesystem_watchers = { enable = true },
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "│ ",
                },
            },
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
            },
        },
    },
}

