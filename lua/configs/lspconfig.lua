local nv_lspconfig = require "nvchad.configs.lspconfig"
nv_lspconfig.defaults()

-- 1. Extract capabilities and on_attach safely from NvChad
local capabilities = nv_lspconfig.capabilities
local on_attach = nv_lspconfig.on_attach

-- Helper to find Mason binaries dynamically so they never fail to spawn
local function mason_bin(name)
  return vim.fn.stdpath "data" .. "/mason/bin/" .. name
end

-- 2. Configure VTSLS (TypeScript / JavaScript)
vim.lsp.config("vtsls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
      updateImportsOnMove = { enabled = "always" },
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
      },
      updateImportsOnMove = { enabled = "always" },
    },
  },
})

-- 3. Configure GLSL_ANALYZER (Pointed to Mason's binary path)
vim.lsp.config("glsl_analyzer", {
  cmd = { mason_bin "glsl_analyzer" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
})

-- 4. Configure ROSLYN (C#)
vim.lsp.config("roslyn", {
  cmd = { "roslyn-language-server", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
  },
})

vim.filetype.add {
  extension = {
    glsl = "glsl",
    vert = "glsl",
    frag = "glsl",
    geom = "glsl",
    comp = "glsl",
  },
}

-- 5. Enable all standard servers at once
-- (Note: 'roslyn' is automatically enabled by its own plugin setup call)
local servers = { "html", "cssls", "vtsls", "glsl_analyzer" }
vim.lsp.enable(servers)
