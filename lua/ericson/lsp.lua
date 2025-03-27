
local mason_path = vim.fn.stdpath('data') .. '/mason/bin/'

vim.lsp.config.lua = {
    cmd = { mason_path .. 'lua-language-server.cmd' },
    root_markers = { '.git' },
    filetypes = { 'lua' },
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
                },
            }
        }
    }
}

vim.lsp.config.omnisharp = {
    cmd = { mason_path .. 'omnisharp.cmd' },
    root_markers = {
        '.git',
        '*.sln',
        '*.csproj',
        'function.json',
        'omnisharp.json'
    },
    filetypes = { 'csharp' },
}


vim.lsp.config.bash = {
    cmd = { mason_path .. 'bash-language-server.cmd' },
    root_markers = {
        '.git'
    },
    filetypes = {
        'bash',
        'sh'
    },
}

vim.lsp.config.json = {
    cmd = { mason_path .. 'vscode-json-language-server.cmd' },
    root_markers = {
        '.git'
    },
    filetypes = {
        'json'
    },
}

vim.lsp.config.typescript = {
    cmd = { mason_path .. 'typescript-language-server.cmd' },
    root_markers = {
        '.git'
    },
    filetypes = {
        'javascript',
        'typescript'
    },
}

vim.lsp.config.java = {
    cmd = { mason_path .. 'jdtls.cmd' },
    root_markers = {
        '.git',
        '.mvn',
        'pom.xml'
    },
    filetypes = {
        'java',
    },
}


