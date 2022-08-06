function use_hover_doc_on_me(a, b, c) end

-- use :lua vim.lsp.buf.hover()
-- you will see the return type is clipped
use_hover_doc_on_me(1, 2, 3)
