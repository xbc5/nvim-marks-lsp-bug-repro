## The Problem
Setting the option `builtin_marks` casues the LSP floating window to clip text at the very end of the line.

## Notes
I have installed Packer for convenience; lsp-config so that `vim.lsp.buf.hover() works`; and Mason because it was part of my config, and it works. This problem existed long before I used Mason.

## Steps
1. run `setup.sh`;
2. run `/tmp/nvim`;
3. run `:PackerSync`;
4. restart `/tmp/nvim`;
5. read instructions in `init.vim`;
