-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- require 'lambdasven.plugins.dashboard',
  --require 'lambdasven.plugins.neotest-playwright',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.nvim_treesitter_textobjects',
  require 'lambdasven.plugins.inlay-hints',
  require 'lambdasven.plugins.marks',
  require 'lambdasven.plugins.neotest',
  require 'lambdasven.plugins.neotest-vim-test',
  require 'lambdasven.plugins.nvim-dap',
  require 'lambdasven.plugins.nvim-dap-vscode-js',
  require 'lambdasven.plugins.nvim-jdtls',
  require 'lambdasven.plugins.oil',
  require 'lambdasven.plugins.undotree',
  require 'lambdasven.plugins.vim-test',
}
