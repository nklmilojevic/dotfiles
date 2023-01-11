local wezterm = require("wezterm")

return {
    font = wezterm.font_with_fallback(
        {
            "PragmataProMonoLiga Nerd Font"
        }
    ),
    window_decorations = "RESIZE",
    font_size = 16.0,
    font_antialias = "Subpixel",
    color_scheme = "Dracula",
    enable_tab_bar = false,
    send_composed_key_when_left_alt_is_pressed = true,
    send_composed_key_when_right_alt_is_pressed = true,
    -- use_dead_keys = false,
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
    }
}
