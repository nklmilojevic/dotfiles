return {
    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
            }
            return opts
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-media-files.nvim",
            {
                "ahmedkhalf/project.nvim",
                lazy = false,
                after = "telescope.nvim",
                config = function()
                    require("project_nvim").setup({
                        manual_mode = false,
                        detection_methods = { "lsp", "pattern" },
                        patterns = { ".git", "Makefile", "package.json" },
                        ignore_lsp = {},
                        exclude_dirs = {},
                        show_hidden = false,
                        silent_chdir = true,
                        scope_chdir = "global",
                        datapath = vim.fn.stdpath("data"),
                    })
                    require("telescope").load_extension("projects")
                end,
            },
        },
        config = function(plugin, opts)
            require("plugins.configs.telescope")(plugin, opts)

            local telescope = require("telescope")
            telescope.load_extension("projects")
            telescope.load_extension("media_files")
        end,
    },
    {
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local status = require("astronvim.utils.status")

            opts.winbar = {
                -- create custom winbar
                -- store the current buffer number
                init = function(self)
                    self.bufnr = vim.api.nvim_get_current_buf()
                end,
                fallthrough = false, -- pick the correct winbar based on condition
                -- inactive winbar
                {
                    condition = function()
                        return not status.condition.is_active()
                    end,
                    -- show the path to the file relative to the working directory
                    status.component.separated_path({ path_func = status.provider.filename({ modify = ":.:h" }) }),
                    -- add the file name and icon
                    status.component.file_info({
                        file_icon = { hl = status.hl.file_icon("winbar"), padding = { left = 0 } },
                        file_modified = false,
                        file_read_only = false,
                        hl = status.hl.get_attributes("winbarnc", true),
                        surround = false,
                        update = "BufEnter",
                    }),
                },
                -- active winbar
                {
                    -- show the path to the file relative to the working directory
                    status.component.separated_path({ path_func = status.provider.filename({ modify = ":.:h" }) }),
                    -- add the file name and icon
                    status.component.file_info({
                                  -- add file_info to breadcrumbs
                        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
                        file_modified = false,
                        file_read_only = false,
                        hl = status.hl.get_attributes("winbar", true),
                        surround = false,
                        update = "BufEnter",
                    }),
                    -- show the breadcrumbs
                    status.component.breadcrumbs({
                        icon = { hl = true },
                        hl = status.hl.get_attributes("winbar", true),
                        prefix = true,
                        padding = { left = 0 },
                    }),
                },
            }

            return opts
        end,
    },
}
