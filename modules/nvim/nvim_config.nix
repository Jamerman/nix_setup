{self, nixvim, pkgs, ...}:
{
    programs.nixvim = {
        enable = true;
        vialias = true;
        vimalias = true;
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
            cmp-nvim-lsp = {
                enable = true; 
            };
            cmp-buffer = {
                enable = true;
            };
            cmp-path = {
                enable = true; # file system paths
            };
            cmp_luasnip = {
                enable = true; # snippets
            };
            cmp-cmdline = {
                enable = true; # autocomplete for cmdline
            }; 
            cmp-emoji = {
                enable = true;
            };

            nvim-snippets = {
                enable = false;
                settings = {
                    create_autocmd = true;
                    create_cmp_source = true;
                    extended_filetypes = {
                        typescript = [
                            "javascript"
                        ];
                    };
                    friendly_snippets = true;
                    global_snippets = [
                        "all"
                    ];
                    ignored_filetypes = [
#  "lua"
                    ];
                    search_paths = [
                    {
                        __raw = "vim.fn.stdpath('config') .. '/snippets'";
                    }
                    ];
                };
            };
            cmp = {
                enable = true;
                settings = {
                    completion = {
                        completeopt = "menu,menuone,noinsert";
                    };
                    autoEnableSources = true;
                    experimental = { ghost_text = true; };
                    performance = {
                        debounce = 60;
                        fetchingTimeout = 200;
                        maxViewEntries = 30;
                    };
                    snippet = { 
                        expand = ''
                            function(args)
                            require('luasnip').lsp_expand(args.body)
                            end
                            '';
                    };
                    formatting = { fields = [ "kind" "abbr" "menu" ]; };
                    sources = [
                    { name = "nvim_lsp"; }
                    { name = "emoji"; }
                    {
                        name = "buffer"; # text within current buffer
                            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                        keywordLength = 3;
                    }
# { name = "copilot"; } # enable/disable copilot
                    {
                        name = "path"; # file system paths
                            keywordLength = 3;
                    }
                    {
                        name = "luasnip"; # snippets
                            keywordLength = 3;
                    }
                    ];

                    window = {
                        completion = { border = "solid"; };
                        documentation = { border = "solid"; };
                    };

                    mapping = {
                        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                        "<C-j>" = "cmp.mapping.select_next_item()";
                        "<C-k>" = "cmp.mapping.select_prev_item()";
                        "<C-e>" = "cmp.mapping.abort()";
                        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
                        "<C-f>" = "cmp.mapping.scroll_docs(4)";
                        "<C-Space>" = "cmp.mapping.complete()";
                        "<CR>" = "cmp.mapping.confirm({ select = true })";
                        "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
                        "<C-l>" = ''
                            cmp.mapping(function()
                                    if luasnip.expand_or_locally_jumpable() then
                                    luasnip.expand_or_jump()
                                    end
                                    end, { 'i', 's' })
                            '';
                        "<C-h>" = ''
                            cmp.mapping(function()
                                    if luasnip.locally_jumpable(-1) then
                                    luasnip.jump(-1)
                                    end
                                    end, { 'i', 's' })
                            '';
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
