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
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify', -- Optional: for notifications
    },
    opts = {
      cmdline = {
        view = 'cmdline_popup', -- Use popup view instead of bottom
      },
      lsp = {
        -- Override markdown rendering to use Treesitter
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = false, -- Use classic bottom search instead of cmdline popup
        command_palette = true, -- Position the cmdline and popupmenu together
        long_message_to_split = true, -- Long messages in a split
        inc_rename = false, -- Enables input dialog for inc-rename.nvim
        lsp_doc_border = true, -- Add border to hover docs and signature help
      },
    },
  },
}
