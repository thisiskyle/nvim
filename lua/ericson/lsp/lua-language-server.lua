return {
    cmd = {
        'lua-language-server.cmd'
    },
    root_markers = {
        '.git'
    },
    filetypes = {
        'lua'
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                    'Snacks',
                    'it',
                    'describe',
                    'before_each',
                    'after_each'
                }
            }
        }
    }
}
