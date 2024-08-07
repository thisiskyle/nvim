-- borrowed much of this setup from folke/tokyonight.nvim


local M = {}

function M.get(c, opts)
    return {
        -- any comment
        Comment = { fg = c.comment_fg },
        -- used for the columns set with 'colorcolumn'
        ColorColumn = { link = "Normal" },
        -- placeholder characters substituted for concealed text (see 'conceallevel')
        Conceal = { link = "Normal" },
        -- character under the cursor
        Cursor = { fg = c.normal_bg, bg = c.normal_fg },
        -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        lCursor = { link = "Normal" },
        -- like Cursor, but used when in IME mode |CursorIM|
        CursorIM = { link = "Normal" },
        -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorColumn = { link = "Normal" },
        -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorLine = { link = "Normal" },
        -- directory names (and other special names in listings)
        Directory = { link = "Normal" },
        -- diff mode: Added line |diff.txt|
        DiffAdd = { link = "Normal" },
        -- diff mode: Changed line |diff.txt|
        DiffChange = { link = "Normal" },
        -- diff mode: Deleted line |diff.txt|
        DiffDelete = { link = "Normal" },
        -- diff mode: Changed text within a changed line |diff.txt|
        DiffText = { link = "Normal" },
        -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        EndOfBuffer = { link = "Comment" },
        -- error messages on the command line
        ErrorMsg = { link = "Normal" },
        -- the column separating vertically split windows
        VertSplit = { link = "Comment" },
        -- the column separating vertically split windows
        WinSeparator = { link = "Comment" },
        -- line used for closed folds
        Folded = { link = "Comment" },
        -- 'foldcolumn'
        FoldColumn = { link = "Comment" },
        -- column where |signs| are displayed
        SignColumn = { link = "Comment" },
        -- column where |signs| are displayed
        SignColumnSB = { link = "Comment" },
        -- |:substitute| replacement text highlighting
        Substitute = { link = "Normal" },
        -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNr = { link = "Normal" },
        -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        CursorLineNr = { link = "Normal" },
        LineNrAbove = { link = "Normal" },
        LineNrBelow = { link = "Normal" },
        -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        MatchParen = { link = "Normal" },
        -- 'showmode' message (e.g., "-- INSERT -- ")
        ModeMsg = { link = "Normal" },
        -- Area for messages and cmdline
        MsgArea = { link = "Normal" },
        -- |more-prompt|
        MoreMsg = { link = "Normal" },
        -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        NonText = { link = "Normal" },
        -- normal text
        Normal = { fg = c.normal_fg, bg = c.normal_bg },
        -- normal text in non-current windows
        NormalNC = { link = "Normal" },
        -- normal text in sidebar
        NormalSB = { link = "Normal" },
        -- Normal text in floating windows.
        NormalFloat = { link = "Normal" },
        FloatBorder = { link = "Normal" },
        FloatTitle = { link = "Normal" },
        -- Popup menu: normal item.
        Pmenu = { link = "Normal" },
        -- Popup menu: selected item.
        PmenuSel = { link = "Normal" },
        -- Popup menu: scrollbar.
        PmenuSbar = { link = "Normal" },
        -- Popup menu: Thumb of the scrollbar.
        PmenuThumb = { link = "Normal" },
        -- |hit-enter| prompt and yes/no questions
        Question = { link = "Normal" },
        -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        QuickFixLine = { link = "Normal" },
        -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        Search = { link = "Normal" },
        -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        IncSearch = { bg = c.highlight_bg },
        CurSearch =  { link = "IncSearch" },
        -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        SpecialKey = { link = "Normal" },
        -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellBad = { link = "Normal" },
        -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellCap = { link = "Normal" },
        -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellLocal = { link = "Normal" },
        -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
        SpellRare = { link = "Normal" },
        -- status line of current window
        StatusLine = { link = "Normal" },
        -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        StatusLineNC = { link = "Normal" },
        -- tab pages line, not active tab page label
        TabLine = { link = "Normal" },
        -- tab pages line, where there are no labels
        TabLineFill = { link = "Normal" },
        -- tab pages line, active tab page label
        TabLineSel = { link = "Normal" },
        -- titles for output from ":set all", ":autocmd" etc.
        Title = { link = "Normal" },
        -- Visual mode selection
        Visual = { link = "Normal" },
        -- Visual mode selection when vim is "Not Owning the Selection".
        VisualNOS = { link = "Normal" },
        -- warning messages
        WarningMsg = { link = "Normal" },
        -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Whitespace = { link = "Normal" },
        -- current match in 'wildmenu' completion
        WildMenu = { link = "Normal" },
        -- window bar
        WinBar = { link = "StatusLine" },
        -- window bar in inactive windows
        WinBarNC = { link = "StatusLineNC" },

        -- (preferred) any bold text
        Bold = { link = "Normal" },
        --  a character constant: 'c', '\n'
        Character = { link = "Normal" },
        -- (preferred) any constant
        Constant = { link = "Normal" },
        --    debugging statements
        Debug = { link = "Normal" },
        --  character that needs attention
        Delimiter = { link = "Special" },
        -- (preferred) any erroneous construct
        Error = { link = "Normal" },
        -- function name (also: methods for classes)
        Function = { link = "Normal" },
        -- (preferred) any variable name
        Identifier = { link = "Normal" },
        -- (preferred) any italic text
        Italic = { link = "Normal" },
        --  any other keyword
        Keyword = { link = "Normal" },
        -- "sizeof", "+", "*", etc.
        Operator = { link = "Normal" },
        -- (preferred) generic Preprocessor
        PreProc = { link = "Normal" },
        -- (preferred) any special symbol
        Special = { link = "Normal" },
        -- (preferred) any statement
        Statement = { link = "Normal" },
        --   a string constant: "this is a string"
        String = { link = "Normal" },
        -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Todo = { link = "Comment" },
        -- (preferred) int, long, char, etc.
        Type = { link = "Normal" },
        -- (preferred) text that stands out, HTML links
        Underlined = { link = "Normal" },

        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own.

        -- used for highlighting "text" references
        LspReferenceText = { link = "Normal" },
        -- used for highlighting "read" references
        LspReferenceRead = { link = "Normal" },
        -- used for highlighting "write" references
        LspReferenceWrite = { link = "Normal" },
        LspSignatureActiveParameter = { link = "Normal" },
        LspCodeLens = { link = "Normal" },
        LspInlayHint = { link = "Normal" },
        LspInfoBorder = { link = "Normal" },

        -- diagnostics

        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticError = { fg = c.error },
        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn = { fg = c.warn },
        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo = { fg = c.info },
        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint = { fg = c.hint },
        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticUnnecessary = { fg = c.ok },
        -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextError = { link = "DiagnosticError" },
        -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
        -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
        -- Used for "Hint" diagnostic virtual text
        DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
        -- Used to underline "Error" diagnostics
        DiagnosticUnderlineError = { undercurl = true, sp = c.error },
        -- Used to underline "Warning" diagnostics
        DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
        -- Used to underline "Information" diagnostics
        DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
        -- Used to underline "Hint" diagnostics
        DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },

        -- Health
        healthError = { link = "DiagnosticError" },
        healthSuccess = { link = "Normal" },
        healthWarning = { link = "Normal" },

    }
end

return M
