lua << EOF
return require('packer').startup({function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use {
    'chentoast/marks.nvim',
    config = function()
      require'marks'.setup {
	-- INSTRUCTIONS:
	--   1. open test_me.lua, run hover_doc, see results;
	--   2. comment this out, run :PackerCompile, restart /tmp/nvim, and repeat step 1;
        builtin_marks = { ".", "<", ">", "^" }, -- this cases the issue
      }
    end
  }

  use {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason = require("mason")
      local mason_lsp = require("mason-lspconfig")

      mason.setup()

      if mason_lsp then
        mason_lsp.setup {
          automatic_installation = true,
          ensure_installed = { "sumneko_lua", "vimls" }
        }

        local lspconfig = require("lspconfig")

        mason_lsp.setup_handlers {
          function (server_name)
            lspconfig[server_name].setup({})
          end,
        }
      end
    end
  }
end
})
EOF
