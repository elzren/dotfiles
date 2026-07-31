return {
  -- LSP: asm-lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        asm_lsp = {
          filetypes = { "asm", "s" },
          settings = {
            asm_lsp = {
              default_dialect = "intel", -- or "att"
              default_assembler = "nasm", -- or "gas", "masm"
            },
          },
        },
      },
    },
  },
}
