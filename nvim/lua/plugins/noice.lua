return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            enabled = true,
            format = {
                cmdline = { title = "Command line" },
                search_down = { title = "Search ↓" },
                search_up = { title = "Search ↑" },
            },
        },
        messages = {
            enabled = true,
            view_search = false,
            view_warn = "notify",
            view_error = "notify",
        },
        popupmenu = {
            enabled = true,
            backend = "nui",
        },
        lsp = {
            progress = { enabled = true, throttle = 100 },
            hover = { enabled = false },
            signature = { enabled = false },
        },
        routes = {
            {
                filter = { event = "msg_show", kind = "echo" },
                opts = { skip = true },
            },
        },
        throttle = 1000,
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
    },
}

