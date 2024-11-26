-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  require 'kickstart.plugins.nvim_treesitter_textobjects',
  require 'lambdasven.plugins.neotest',
  require 'lambdasven.plugins.undotree',
  -- require 'lambdasven.plugins.dashboard',
  --require 'lambdasven.plugins.neotest-playwright',
  require 'lambdasven.plugins.vim-test',
  require 'lambdasven.plugins.neotest-vim-test',
  require 'lambdasven.plugins.oil',
  require 'lambdasven.plugins.nvim-dap',
  require 'lambdasven.plugins.nvim-dap-vscode-js',
  --require 'lambdasven.plugins.custom-playwright',
  require 'lambdasven.plugins.custom-playwright-plug',
}
