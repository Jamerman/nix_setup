-- I copied this function from ThePrimeagen in order to preserve transparent backgrounds.
-- However, those really don't look nice with Kanagawa! So, don't use this function unless you change colour schemes.

function ColorMyPencils(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })

end

ColorMyPencils()
