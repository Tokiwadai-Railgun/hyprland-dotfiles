---@module 'hl'

hl.config({
    decoration = {
        shadow = {
            color = "rgba(48463d55)",
            color_inactive = "rgba(48463d11)",
        },
    },
})

hl.config({
    plugin = {
        hyprbars = {
            bar_color = "rgb(48463d)",
            col = { 
                text = "rgb(c2bda6)"
            }
        }
    }
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgb(48463d)",
    fg_color = "rgb(c2bda6)",
    size = 30,
    icon = "◬",
    action = "hyprctl dispatch 'hl.dsp.window.close()'"
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgb(48463d)",
    fg_color = "rgb(c2bda6)",
    size = 30,
    icon = "▽",
    action = [[hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })']]
})
