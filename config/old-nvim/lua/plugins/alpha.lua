return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local startify = require 'alpha.themes.startify'

    startify.file_icons.provider = 'devicons'
    startify.section.header.val = {
      [[ ]],
      [[  ,dPYb,              ,dPYb, ,dPYb,                                                    ,dPYb,         8I  ]],
      [[  IP'`Yb              IP'`Yb IP'`Yb                                                    IP'`Yb         8I  ]],
      [[  I8  8I              I8  8I I8  8I                                                    I8  8I         8I  ]],
      [[  I8  8'              I8  8' I8  8'                                                    I8  8'         8I  ]],
      [[  I8 dPgg,    ,ggg,   I8 dP  I8 dP    ,ggggg,     gg    gg    gg   ,ggggg,   ,gggggg,  I8 dP    ,gggg,8I  ]],
      [[  I8dP" "8I  i8" "8i  I8dP   I8dP    dP"  "Y8ggg  I8    I8    88bgdP"  "Y8gggdP""""8I  I8dP    dP"  "Y8I  ]],
      [[  I8P    I8  I8, ,8I  I8P    I8P    i8'    ,8I    I8    I8    8I i8'    ,8I ,8'    8I  I8P    i8'    ,8I  ]],
      [[ ,d8     I8, `YbadP' ,d8b,_ ,d8b,_ ,d8,   ,d8'   ,d8,  ,d8,  ,8I,d8,   ,d8',dP     Y8,,d8b,_ ,d8,   ,d8b, ]],
      [[ 88P     `Y8888P"Y8888P'"Y888P'"Y88P"Y8888P"     P""Y88P""Y88P" P"Y8888P"  8P      `Y88P'"Y88P"Y8888P"`Y8 ]],
      [[ ]],
    }

    alpha.setup(startify.opts)
  end,
}
