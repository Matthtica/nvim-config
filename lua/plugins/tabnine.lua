return {
	'tzachar/cmp-tabnine',
	build = './install.sh',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    config = function()
        local tabnine = require('cmp_tabnine.config')
        tabnine:setup({
            max_lines = 1000,
            max_num_results = 5,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = '..',
            show_prediction_strength = true
        })
    end
}
