return {
  "lervag/vimtex",
  init = function()
    vim.g['vimtex_view_method'] = 'zathura' -- for variant without xdotool to avoid errors in wayland
    vim.g['vimtex_quickfix_mode'] = 0              -- suppress error reporting on save and build
   -- vim.g['vimtex_mappings_enabled'] = 0           -- Ignore mappings
    vim.g['vimtex_indent_enabled'] = 0             -- Auto Indent
    vim.g['tex_flavor'] = 'latex'                  -- how to read tex files
    vim.g['vimtex_context_pdf_viewer'] = 'zathura'  -- external PDF viewer run from vimtex menu command
  end,
}
