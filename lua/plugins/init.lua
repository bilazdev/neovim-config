return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- Gives access to the 'roslyn' package
      },
    },
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "yioneko/nvim-vtsls",
        "nolanderc/glsl_analyzer",
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c_sharp",
        "typescript",
        "tsx",
        "javascript",
      },
    },
  },

  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
      require("roslyn").setup() -- Let the plugin activate
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  {
    "mistweaverco/kulala.nvim",
    ft = { "http" }, -- Lazy loads the plugin only when opening a .http file
    opt = {
      additional_curl_options = { "--insecure" },
    },
    config = function()
      require("kulala").setup {
        -- Optional custom configuration goes here
        -- e.g., display_mode = "split"
      }
    end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {
      select = {
        enabled = true,
        -- Force dressing to use nui (the same layout framework NvChad autocomplete relies on)
        backend = { "nui" },

        nui = {
          position = {
            row = 1, -- Drops down precisely 1 line below your cursor position
            col = 0,
          },
          size = {
            width = "auto",
            height = "auto",
          },
          relative = "cursor",
          border = {
            style = "rounded", -- Force identical corner rounding
          },
          buf_options = {
            swapfile = false,
            filetype = "DressingSelect",
          },
          win_options = {
            winblend = 0,
            -- Link components to NvChad base46 autocomplete tokens
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:CmpSel",
          },
          max_width = 80,
          max_height = 40,
          -- Match your exact autocomplete keybindings
          mappings = {
            ["<CR>"] = "Confirm",
            ["<Esc>"] = "Close",
            ["<C-n>"] = "Next", -- Ctrl+n moves down
            ["<C-p>"] = "Prev", -- Ctrl+p moves up
          },
        },
      },
    },
  },
}
