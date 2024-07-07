local M = {}

local config = {
	prefix = "",
	command = "buildfix",
	suffix = "",
	fix_on_save = false,
	keymap = "<leader>bf",
}

local function surround_command(prefix, cmd, suffix)
	return prefix .. cmd .. suffix
end

local function execute_buildfix()
	local cmd = surround_command(config.prefix, config.command, config.suffix)
	local output = vim.fn.system(cmd)

	if vim.v.shell_error == 0 then
		vim.notify("Buildfix: success", "info")
	else
		vim.notify("Error (buildfix): \n" .. output, "error")
	end
end

local function setup_fix_on_save()
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("BuildfixFormatOnSave", { clear = true }),
		callback = function()
			execute_buildfix()
		end,
	})
end

local function setup_keymap()
	vim.keymap.set("n", config.keymap, execute_buildfix, {
		desc = "Execute buildfix command",
		silent = true,
	})
end

function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})

	vim.api.nvim_create_user_command("Buildfix", execute_buildfix, {
		desc = "Execute the build command surrounded by 'fix'",
	})

	if config.fix_on_save then
		setup_fix_on_save()
	end

	if config.keymap ~= false then
		setup_keymap()
	end
end

return M
