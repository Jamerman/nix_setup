{self, nixvim, pkgs, ...}:
{
    programs.nixvim = {
        enable = true;
        colorschemes.kanagawa.enable = true;

        #Plugin stuff
        plugins = {
            harpoon.enable = true;
            telescope.enable = true;
            treesitter.enable = true;
            web-devicons.enable = true;

            # LSP stuff
            lsp = {
                enable = true;
                servers = {
                    rust_analyzer = {
                        enable = true;
                        installRustc = true;
                        installCargo = true;
                    };
                    bashls.enable = true;
                    html.enable = true;
                    clangd.enable = true;
                    nil_ls.enable = true;
                    lua_ls = { # Lua
                        enable = true;
                        settings.telemetry.enable = false;
                    };
                };
            };
        };

        #Basic settings
        opts = {
            number = true;
            relativenumber = true;
            shiftwidth = 4;
            tabstop = 4;
            softtabstop = 4;
            expandtab = true;
            swapfile = false;
            clipboard = "unnamedplus";
            scrolloff = 8;
            updatetime = 50;
            hlsearch = false;
            incsearch = true;
        };

        #Keybindings
        globals.mapleader = " ";
        keymaps = [
            {
                mode = "n";
                key = "<leader>pv";
                action = "<cmd>Ex<CR>";
            }
        ];
    };
}
