local opt = vim.opt                                                                               

opt.clipboard       = "unnamedplus" -- sync with system clipboard                                       
opt.colorcolumn     = "80"          -- disable color column
opt.cursorline      = true          -- highlight line cursor is on                                               
opt.expandtab       = true          -- use spaces instead of tabs                                                
opt.fillchars       = { eob = " " } -- remove the "~" char from end of buffer
opt.ignorecase      = true          -- ignore case (usefull for search "/")                                      
opt.inccommand      = "split"       -- preview incremental substitute                                         
opt.laststatus      = 3             -- global statusline                                                            
opt.number          = true          -- show line number                                                          
opt.relativenumber  = true          -- show relative line numbers                                                
opt.scrolloff       = 4             -- lines of context                                                             
opt.shiftwidth      = 4             -- size of an indent                                                            
opt.signcolumn      = "yes"         -- always show the signcolumn, otherwise it would shift the text each time  
opt.smartcase       = true          -- don't ignore case with capitals                                           
opt.smartindent     = true          -- insert indents automatically                                              
opt.splitbelow      = true          -- put new windows below current                                             
opt.splitright      = true          -- split right by default
opt.tabstop         = 4             -- number of spaces tabs count for                                              
opt.termguicolors   = true          -- true color support                                                        
opt.undofile        = true          -- persistent undo                                                           
opt.undolevels      = 10000         -- increase undo history                                                    
opt.updatetime      = 200           -- save swap file and trigger cursorhold                                      
opt.virtualedit     = "block"       -- allow cursor to move where there is no text in visual block mode       
opt.wrap            = false         -- disable line wrap                                                        

