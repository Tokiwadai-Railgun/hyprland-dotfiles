---@module 'hl'

hl.config({
    general = {
        lock_cmd = "pidof hyprlock || hyprlock",
        -- avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session",
        -- lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on",
        -- to avoid having to press a key twice to turn on the display.
    },
})

hl.config({
    listener = {
        timeout = 150,
        -- 2.5min.
        on_timeout = "brightnessctl -s set 10",
        -- set monitor backlight to minimum, avoid 0 on OLED monitor.
        on_resume = "brightnessctl -r",
        -- monitor backlight restore.
    },
})
-- NOTE: Section 'listener' may be a plugin or custom section; verify the output

hl.config({
    listener = {
        timeout = 300,
        -- 5min
        on_timeout = "loginctl lock-session",
        -- lock screen when timeout has passed
    },
})
-- NOTE: Section 'listener' may be a plugin or custom section; verify the output

hl.config({
    listener = {
        timeout = 330,
        -- 5.5min
        on_timeout = "hyprctl dispatch dpms off",
        -- screen off when timeout has passed
        on_resume = "hyprctl dispatch dpms on",
        -- screen on when activity is detected after timeout has fired.
    },
})
-- NOTE: Section 'listener' may be a plugin or custom section; verify the output

hl.config({
    listener = {
        timeout = 1800,
        -- 30min
        on_timeout = "systemctl suspend",
        -- suspend pc
    },
})
-- NOTE: Section 'listener' may be a plugin or custom section; verify the output
