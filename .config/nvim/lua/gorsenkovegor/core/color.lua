function set_color(color)
-- colorscheme gruvbox-baby
    color = color or "retrobox"
    vim.cmd.colorscheme(color)
     
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

-- set_color("gruvbox-baby")
set_color("rose-pine")
