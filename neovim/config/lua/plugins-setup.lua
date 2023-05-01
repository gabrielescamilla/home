-- make sure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand to run PackerSync when the plugins_setup.lua 
-- is updated with added or removed plugins
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Secure call to require packer, leaves without noise if not
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Add plugins here before the packer_bootsrap check
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'              -- packer manage itself
  use 'nvim-lua/plenary.nvim'               -- other plugins use this funcs
  use 'bluz71/vim-nightfly-guicolors'       -- fav color theme
  use 'christoomey/vim-tmux-navigator'      -- splits
  use 'szw/vim-maximizer'                   -- maximizes and restores window
  use 'tpope/vim-surround'                  -- modify (){} [] tags etc. ysw" csw"' dsw'
  use 'vim-scripts/ReplaceWithRegister'     -- yw  grw
  use 'numToStr/Comment.nvim'               -- gc9j
  use 'nvim-tree/nvim-tree.lua'
  --use 'nvim-tree/nvim-web-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"} 
  use {"nvim-telescope/telescope.nvim", branch = "0.1.x"} 



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

