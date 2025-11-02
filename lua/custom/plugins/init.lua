-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'fatih/vim-go',
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'go',
        callback = function()
          vim.g.go_debug_preserve_layout = 1
          vim.g.go_debug_windows = {
            vars = 'rightbelow 61vnew',
            stack = 'rightbelow 21new',
            out = 'botright 15new',
          }
          vim.g.go_debug_mappings = {
            ['(go-debug-breakpoint)'] = { key = 'b' },
            ['(go-debug-continue)'] = { key = 'c' },
            ['(go-debug-next)'] = { key = 'n' },
            ['(go-debug-print)'] = { key = 'p' },
            ['(go-debug-step)'] = { key = 's' },
          }
          vim.cmd [[let @x="$ofmt.Printf(\"%+v\\n\", )\<Left>"]]
          vim.cmd [[let @o="$oos.Exit(0)"]]
          vim.cmd [[let @e="$oif err != nil { panic(err) }"]]
        end,
      })
    end,
  },
}
