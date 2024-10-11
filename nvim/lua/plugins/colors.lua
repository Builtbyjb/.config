return {
    "EdenEast/nightfox.nvim", 
    priority = 1000,
    config = function()
        require('nightfox').setup({
            options = {
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = "italic, bold",
                    keywords = "italic",
                    types = "italic",
                    functions = "italic",
                    conditionals = "italic",
                    constants = "italic",
                    variables = "italic",
                }
            },
        })
        vim.cmd("colorscheme nightfox")
    end,
}

