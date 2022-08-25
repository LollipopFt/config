if vim.fn.exists('g:neovide') then
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_cursor_antialiasing = false
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_trail_length = 0
    vim.opt.guifont = "Cascadia_Mono_PL:h12"
end
