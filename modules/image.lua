require('image').setup {
    render = {
        win_padding = 5,
        show_label = true,
        use_dither = true,
    },
    events = {
        update_on_nvim_resize = true,
    },
}
