---@module 'hl'


-- layerrule = ignorealpha 0.3, bg_settings

-- layerrule = ignorealpha, side

-- layerrule = ignorealpha, bar

-- layerrule = ignorealpha, geom

-- layerrule = blur, bg_settings

-- layerrule = blur,side 

-- layerrule = blur,bar

hl.config({
    decoration = {
        rounding = 0,
        blur = {
            enabled = 1,
            size = 5,
            passes = 2,
            noise = 0.05,
        },
        shadow = {
            range = 1,
            render_power = 1,
            offset = "5 5",
        },
    },
})

hl.config({
    plugin = {
        hyprbars = {
            bar_height = 40,
            bar_text_size = 17,
            bar_text_font = "FOT-Rodin Pro M",
            bar_text_align = "left",
        }
    }
})

-- hl.plugin("hyprtheme", function()
--     theme = yorha/components/hyprtheme/theme.toml,
-- end)

hl.config({
    general = {
        border_size = 0,
        gaps_in = 8,
        gaps_out = 10,
        col = {
            active_border = "0x00000000",
            inactive_border = "0x00000000",
        },
    },
})

hl.config({
    animations = {
        enabled = 1,
        -- bezier = in-out,.65,-0.01,0,.95
        -- bezier = woa,0,0,0,1
        -- animation=windows,1,2,woa,popin
        -- animation=border,1,10,default
        -- animation=workspaces,1,5,in-out,slide
    },
})
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })

hl.bind("SUPER + v", hl.dsp.exec_cmd("ags -b player -t player"))

-- windowrule=move 400 510,title:^(fly_is_foot)$
require("themes.yorha.theme_nier_light")

