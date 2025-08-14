return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = {
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- incline versi asli
  {
		"b0o/incline.nvim",
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

  -- incline.nvim dengan transparansi dan separator modern
  -- {
  --   "b0o/incline.nvim",
  --   event = { "BufReadPost", "BufNewFile" },
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   init = function()
  --     -- Definisikan highlight groups untuk transparansi
  --     vim.api.nvim_set_hl(0, "InclineNormal", { bg = "NONE", fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg })
  --     vim.api.nvim_set_hl(0, "InclineNormalNC", { bg = "NONE", fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg })
  --   end,
  --   opts = {
  --     highlight = {
  --       groups = {
  --         InclineNormal = "InclineNormal",
  --         InclineNormalNC = "InclineNormalNC",
  --       },
  --     },
  --     hide = {
  --       cursorline = true,
  --       focused_win = false,
  --       only_win = false,
  --     },
  --     window = {
  --       margin = {
  --         vertical = 0,
  --         horizontal = 1,
  --       },
  --       zindex = 29, -- Di bawah zen-mode
  --     },
  --     render = function(props)
  --       local bufname = vim.api.nvim_buf_get_name(props.buf)
  --       if bufname == "" then
  --         return { "[No Name]" }
  --       end
  --       local filename = vim.fn.fnamemodify(bufname, ":t")
  --       local filetype = vim.bo[props.buf].filetype
  --       local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename, filetype, { default = true })
  --       -- Simulasikan breadcrumbs sederhana dengan path relatif
  --       local relative_path = vim.fn.fnamemodify(bufname, ":.:h")
  --       local path_parts = vim.split(relative_path, "/", { plain = true })
  --       local breadcrumbs = {}
  --       if relative_path ~= "." then
  --         for i, part in ipairs(path_parts) do
  --           if part ~= "" then
  --             table.insert(breadcrumbs, { part, guifg = props.focused and icon_color or "Comment" })
  --             table.insert(breadcrumbs, { " ➤ ", guifg = props.focused and icon_color or "Comment" })
  --           end
  --         end
  --       end
  --       table.insert(breadcrumbs, { icon .. " ", guifg = icon_color })
  --       table.insert(breadcrumbs, { filename, guifg = props.focused and vim.api.nvim_get_hl(0, { name = "Normal" }).fg or vim.api.nvim_get_hl(0, { name = "Comment" }).fg })
  --       return breadcrumbs
  --     end,
  --   },
  -- },

  

  -- statusline
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     local lualine = require("lualine")
  --     return {
  --       options = {
  --         theme = "auto",
  --         globalstatus = true,
  --         disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha", "neo-tree", "NvimTree", "trouble" } },

  --         -- Jika ingin Kotak bentuk nya
  --         --component_separators = { left = "│", right = "│" },
  -- -- section_separators = { left = "", right = "" }, -- Opsional: kosongkan pemisah antar section jika tidak diinginkan
  --       },
  --       sections = {
  --         lualine_a = {
  --           function()
  --             return " " .. require("lualine.components.mode")()
  --           end,
  --         },
  --         lualine_b = { "branch" },
  --         lualine_c = {
  --           {
  --             "filename",
  --             path = 3,
  --             symbols = { modified = "●", readonly = " 󰌾 " },
  --           },
  --         },
  --         lualine_x = { "encoding","filetype", "progress" },
  --         lualine_y = { "location"},
  --         lualine_z = {function()
  --   return "🕒 " .. os.date("%H:%M")
  -- end, },
  --       },
  --     }
  --   end,
  -- },

  -- statusline v2
  {
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local LazyVim = require("lazyvim.util")
			opts.sections.lualine_c[4] = {
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			}
		end,
	},

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
}
