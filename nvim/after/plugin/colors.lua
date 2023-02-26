-- One dark Theme
-- require("onedark").setup({
--     -- Main options --
--     style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = true, -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = "italic,bold",
--         keywords = "italic,bold",
--         functions = "italic,bold",
--         strings = "italic",
--         variables = "italic",
--     },
--     -- Plugins Config --
--     diagnostics = {
--         darker = false, -- darker colors for diagnostic
--         undercurl = true, -- use undercurl instead of underline for diagnostics
--         background = true, -- use background color for virtual text
--     },
-- })
-- require("onedark").load()

require('nightfox').setup({
    options = {
        transparent = true, -- Disable setting background
        terminal_colors = true,
        styles = {
            comments = "italic, bold",
            functions = "italic, bold",
            strings = "italic, bold",
            keywords = "italic, bold",
            types = "italic",
        }
    }
})
vim.cmd("colorscheme nightfox")
