return {
    "EdenEast/nightfox.nvim", 
    priority = 1000,
    config = function()
        require('nightfox').setup({
            options = {
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = "italic",
                    keywords = "italic",
                    types = "italic",
                    functions = "italic",
                }
            },
        })
        vim.cmd("colorscheme nightfox")
    end,
}

