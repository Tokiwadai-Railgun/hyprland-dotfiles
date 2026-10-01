---@module 'hl'

-- source = ~/.config/hypr/nvidia.conf

--###############
--## MONITORS ###
--###############

hl.monitor({
    output   = "eDP-1",
    mode     = "2560x1600@60",
    position = "0x0",
    scale    = 1.6,
})

-- hl.monitor({
--     output = "DP-3",
--     mode = "1920x1080@60",
--     position = "-1920x0,1"
-- })
--
-- hl.monitor({
--     output = "DP-3",
--     mode = "1920x1080@60",
--     position = "0x1080,1"
-- })

--##################
--## MY PROGRAMS ###
--##################

local terminal = "kitty"
local fileManager = "thunar"
local menu = "fuzzel"

local music = "qobuz-player"

local browser = "/usr/bin/flatpak run --env=MESA_LOADER_DRIVER_OVERRIDE=zink --branch=stable --arch=aarch64 --command=launch-script.sh --file-forwarding app.zen_browser.zen" -- To be changed to helium
local messager1 = ""
local messager2 = "discord"
local screenshot1 = "hyprshot -m window --clipboard-only"
local screenshot2 = "hyprshot -m output --clipboard-only"

local editor = "kitty -e nvim"
local fileExplorer = "kitty -e yazi"
local misc = "steam"
local wifi = "kitty -e impala"
local bluetooth = "kitty -e bluetui"

--################
--## AUTOSTART ###
--################

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl reload")
    hl.exec_cmd("quickshell")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOPexec-once=awww-daemon")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("darkman run")
end)

-- Exec (run every reload)
hl.on("config.reloaded", function()
    hl.exec_cmd("mako")
end)

--############################
--## ENVIRONMENT VARIABLES ###
--############################

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_THEME", "Yorha")
hl.env("HYPRCURSOR_SIZE", 32)

--####################
--## LOOK AND FEEL ###
--####################

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 10,
        border_size = 1,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            inactive_border = "rgba(595959aa)",
            active_border = "rgba(595959aa)",
        },
    },
})

hl.config({
    decoration = {
        rounding = 6,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        -- drop_shadow = true
        -- shadow_range = 4
        -- shadow_render_power = 3
        -- col.shadow = rgba(1a1a1aee)
        blur = {
            enabled = true,
            size = 3,
            passes = 4,
            vibrancy = 0.1696,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
    }
})

hl.curve("myBezier", {
    type = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

--############
--## INPUT ###
--############

hl.config({
    input = {
        kb_layout = "fr",
        touchpad = {
            natural_scroll = true,
        },
    },
})

--##################
--## KEYBINDINGS ###
--##################

local mainMod = "SUPER"

-- App binds

hl.bind(mainMod .. " + " .. "Q", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.exit())

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "V", hl.dsp.window.float())

-- TODO: manual review (unknown dispatcher: layoutmsg)
-- hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.layoutmsg())

hl.bind(mainMod .. " + " .. "A", hl.dsp.exec_cmd("fuzzel"))

hl.bind(mainMod .. " + " .. "X", hl.dsp.exec_cmd("spotify-launcher"))

hl.bind(mainMod .. " + " .. "D", hl.dsp.exec_cmd("discord"))

hl.bind(mainMod .. " + " .. "Z", hl.dsp.exec_cmd("thunar"))

hl.bind(mainMod .. " + " .. "T", hl.dsp.exec_cmd("telegram-desktop"))

hl.bind(mainMod .. " + " .. "RETURN", hl.dsp.exec_cmd("kitty"))

hl.bind(mainMod .. " + " .. "F", hl.dsp.exec_cmd("/usr/bin/flatpak run --env=MESA_LOADER_DRIVER_OVERRIDE=zink --branch=stable --arch=aarch64 --command=launch-script.sh --file-forwarding app.zen_browser.zen"))

hl.bind(mainMod .. " + " .. "W", hl.dsp.exec_cmd("[float; size 10% 20%] kitty -e impala"))

hl.bind(mainMod .. " + " .. "B", hl.dsp.exec_cmd("[float; size 80% 80%] kitty -e bluetui"))

hl.bind("Print", hl.dsp.exec_cmd("$screenshot0"))

hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))

hl.bind(mainMod .. " + " .. "S", hl.dsp.exec_cmd("steam"))

hl.bind(mainMod .. " + " .. "V", hl.dsp.exec_cmd("[float; size 50% 50%] pavucontrol"))

hl.bind(mainMod .. " + " .. "P", hl.dsp.exec_cmd("hyprshot --mode region"))

hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("[float; size 80% 80%] kitty -e yazi"))

hl.bind(mainMod .. " + " .. "BACKSPACE", hl.dsp.exec_cmd("hyprlock"))

-- PulseAudio controls

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))

-- Move focus with mainMod + vim keys

hl.bind(mainMod .. " + " .. "h", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + " .. "l", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + " .. "k", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + " .. "j", hl.dsp.focus({ direction = "down" }))

-- The following mappings use the key codes to better support various keyboard layouts

-- 1 is code:10, 2 is code 11, etc

-- Switch workspaces with mainMod + [0-9] 

hl.bind(mainMod .. " + " .. "code:10", hl.dsp.focus({ workspace = 1 }))

-- NOTE: code:10 = key 1

hl.bind(mainMod .. " + " .. "code:11", hl.dsp.focus({ workspace = 2 }))

-- NOTE: code:11 = key 2

hl.bind(mainMod .. " + " .. "code:12", hl.dsp.focus({ workspace = 3 }))

-- NOTE: code:12 = key 3

hl.bind(mainMod .. " + " .. "code:13", hl.dsp.focus({ workspace = 4 }))

-- NOTE: code:13 = key 4

hl.bind(mainMod .. " + " .. "code:14", hl.dsp.focus({ workspace = 5 }))

-- NOTE: code:14 = key 5

hl.bind(mainMod .. " + " .. "code:15", hl.dsp.focus({ workspace = 6 }))

-- NOTE: code:15 = key 6

hl.bind(mainMod .. " + " .. "code:16", hl.dsp.focus({ workspace = 7 }))

-- NOTE: code:16 = key 7

hl.bind(mainMod .. " + " .. "code:17", hl.dsp.focus({ workspace = 8 }))

-- NOTE: code:17 = key 8

hl.bind(mainMod .. " + " .. "code:18", hl.dsp.focus({ workspace = 9 }))

-- NOTE: code:18 = key 9

hl.bind(mainMod .. " + " .. "code:19", hl.dsp.focus({ workspace = 10 }))

-- NOTE: code:19 = key 0

-- Move active window and follow to workspace mainMod + SHIFT [0-9]

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:10", hl.dsp.window.move({ workspace = 1 }))

-- NOTE: code:10 = key 1

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:11", hl.dsp.window.move({ workspace = 2 }))

-- NOTE: code:11 = key 2

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:12", hl.dsp.window.move({ workspace = 3 }))

-- NOTE: code:12 = key 3

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:13", hl.dsp.window.move({ workspace = 4 }))

-- NOTE: code:13 = key 4

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:14", hl.dsp.window.move({ workspace = 5 }))

-- NOTE: code:14 = key 5

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:15", hl.dsp.window.move({ workspace = 6 }))

-- NOTE: code:15 = key 6

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:16", hl.dsp.window.move({ workspace = 7 }))

-- NOTE: code:16 = key 7

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:17", hl.dsp.window.move({ workspace = 8 }))

-- NOTE: code:17 = key 8

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:18", hl.dsp.window.move({ workspace = 9 }))

-- NOTE: code:18 = key 9

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "code:19", hl.dsp.window.move({ workspace = 10 }))

-- NOTE: code:19 = key 0

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "bracketleft", hl.dsp.window.move({ workspace = "-1" }))

-- brackets [

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "bracketright", hl.dsp.window.move({ workspace = "+1" }))

-- brackets ]

-- Move active window to a workspace silently mainMod + CTRL [0-9]

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:10", hl.dsp.window.move({ workspace = 1 , follow = false}))

-- NOTE: code:10 = key 1

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:11", hl.dsp.window.move({ workspace = 2 , follow = false}))

-- NOTE: code:11 = key 2

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:12", hl.dsp.window.move({ workspace = 3 , follow = false}))

-- NOTE: code:12 = key 3

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:13", hl.dsp.window.move({ workspace = 4 , follow = false}))

-- NOTE: code:13 = key 4

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:14", hl.dsp.window.move({ workspace = 5 , follow = false}))

-- NOTE: code:14 = key 5

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:15", hl.dsp.window.move({ workspace = 6 , follow = false}))

-- NOTE: code:15 = key 6

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:16", hl.dsp.window.move({ workspace = 7 , follow = false}))

-- NOTE: code:16 = key 7

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:17", hl.dsp.window.move({ workspace = 8 , follow = false}))

-- NOTE: code:17 = key 8

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:18", hl.dsp.window.move({ workspace = 9 , follow = false}))

-- NOTE: code:18 = key 9

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "code:19", hl.dsp.window.move({ workspace = 10 , follow = false}))

-- NOTE: code:19 = key 0

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "bracketleft", hl.dsp.window.move({ workspace = "-1" , follow = false}))

-- brackets [

hl.bind(mainMod .. " + " .. "CTRL" .. " + " .. "bracketright", hl.dsp.window.move({ workspace = "+1" , follow = false}))

-- brackets ]

-- Special workspace (scratchpad)

hl.bind(mainMod .. " + " .. "comma", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "comma", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll

hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "F", hl.dsp.window.fullscreen())

-- local yorha = "/home/fuyuki/.config/hypr/themes/yorha"
local theme = require("themes.yorha.theme")

-- source = $yorha/theme.conf -> requires manual conversion
-- local theme = require("_yorha.theme")
-- TODO: convert $yorha/theme.conf to .lua and use require()
