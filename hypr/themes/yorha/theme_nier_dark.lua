---@module 'hl'

hl.config({
    decoration = {
        shadow = {
            color = "rgba(c2bda655)",
            color_inactive = "rgba(c2bda611)",
        },
    },
})

hl.plugin("hyprbars", function()
    bar_color = "rgb(c2bda6)",
    col.text = "rgb(48463d)",
    hyprbars-button = { "rgb(c2bda6)", 30, "◬", "hyprctl dispatch killactive" },
    hyprbars-button = { "rgb(c2bda6)", 30, "▽", "hyprctl dispatch fullscreen 1" },
end)
