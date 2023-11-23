require("fidget").setup {
    progress = {
        display = {
            progress_icon =
            { pattern = "pipe", period = 1 },
        },
    },
    logger = {
        level = vim.log.levels.INFO,
    }
}

