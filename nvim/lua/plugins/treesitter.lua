return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    priority = 999,
    config = function() 
        require ("nvim-treesitter.configs").setup {
          ensure_installed = {"javascript", "typescript", "python", "lua", "vim", "go" },
          sync_install = false,
          auto_install = true,
        
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
    end,
}
