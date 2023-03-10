--local empty = require('lualine.component'):extend()
--function empty:draw(default_highlight)
  --self.status = ''
  --self.applied_separator = ''
  --self:apply_highlights(default_highlight)
  --self:apply_section_separators()
  --return self.status
--end
--
-- Put proper separators and gaps between components in sections
--local function process_sections(sections)
  --for name, section in pairs(sections) do
    --local left = name:sub(9, 10) < 'x'
    --for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      --table.insert(section, pos * 2, { empty })
    --end
    --for id, comp in ipairs(section) do
      --if type(comp) ~= 'table' then
        --comp = { comp }
        --section[id] = comp
      --end
      --comp.separator = left and { right = ' ' } or { left = ' ' }
    --end
  --end
  --return sections
--end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require('lualine').setup {
		  options = {
		    icons_enabled = true,
		    theme = 'auto',
		    --component_separators = { left = ' ', right = ' '}, --
		    --section_separators = { left = ' ', right = ' '}, --
		    disabled_filetypes = {
		      statusline = {},
		    },
		    ignore_focus = {},
		    always_divide_middle = true,
		    globalstatus = false,
		    refresh = {
		      statusline = 1000,
		      tabline = 1000,
		    }
		  },
		  sections = {
		    lualine_a = {'mode'},
		    lualine_b = {'branch', 'diff', 'diagnostics'},
		    lualine_c = {'filename'},
		    lualine_x = {'encoding', 'fileformat', 'filetype'},
		    lualine_y = {'progress'},
		    lualine_z = {'location'}
		  },
		  inactive_sections = {
		    lualine_a = {},
		    lualine_b = {'branch'},
		    lualine_c = {'filename'},
		    lualine_x = {'location'},
		    lualine_y = {},
		    lualine_z = {}
		  },
		  tabline = {
		      lualine_a = {'buffers'},
		      lualine_b = {},
		      lualine_x = {},
		      lualine_y = {},
		      lualine_z = {'tabs'}
		  },
		  extensions = {}
		}
	end
}
