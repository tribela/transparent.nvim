local M = {}

local augroup = vim.api.nvim_create_augroup('Transparent', { clear = true })

local default = {
	auto = true,
	groups = {
		'Normal', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
		'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
		'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer',
		'VertSplit',
	},
	extra_groups = {},
	excludes = {},
}
M.configs = vim.tbl_deep_extend('force', default, {})
M.state = {
	enabled = true,
}

local considerable = function(name)
	if vim.tbl_contains(M.configs.excludes, name) then
		return false
	end
	if vim.tbl_contains(M.configs.groups, name) then
		return true
	end
	if vim.tbl_contains(M.configs.extra_groups, name) then
		return true
	end

	return false
end

clear_backgrounds = function()
	if M.state.enabled == false then
		return
	end

	for name, attrs in pairs(vim.api.nvim_get_hl(0, {})) do
		if considerable(name) and (attrs.bg or attrs.ctermbg) then
			new_attr = vim.tbl_extend('force', attrs, {
				bg = 'NONE',
				ctermbg = 'NONE'
			})
			vim.api.nvim_set_hl(0, name, new_attr)
		end
	end
end
M.clear_backgrounds = clear_backgrounds

M.enable = function()
	if M.state.enabled then
		return
	end
	M.state.enabled = true
	clear_backgrounds()
end

M.disable = function()
	if not M.state.enabled then
		return
	end
	M.state.enabled = false
	vim.cmd('colorscheme ' .. vim.g.colors_name)
end

M.toggle = function()
	if M.state.enabled then
		M.disable()
	else
		M.enable()
	end
end

M.setup = function(opt)
  M.configs = vim.tbl_deep_extend('force', default, opt or {})
	if M.configs.auto == false then
	  return
	end

	-- Run on VimEnter, ColorScheme
	vim.api.nvim_create_autocmd(
		{ 'UIEnter', 'ColorScheme' }, {
			group = augroup,
			desc = 'Clear background colors',
			pattern = '*',
			callback = clear_backgrounds,
		}
	)

	clear_backgrounds()
end

return M
