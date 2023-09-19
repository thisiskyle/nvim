local M = {}


function M.setup(c)

    vim.opt.background = c.background or "dark"

    local theme = {
        {
            groups = {
                "Normal"
            },
            style = {
                fg = c.fg_normal,
                bg = c.bg_normal
            }
        },
        {
            groups = {
                "Matchparen"
            },
            style = {
                fg = c.fg_normal,
                bg = c.bg_01,
                attributes = {
                    bold = true
                }
            }
        },
        {
            groups = {
                "Search"
            },
            style = {
                fg = c.fg_normal,
                bg = c.bg_01,
            }
        },
        {
            groups = {
                "Visual"
            },
            style = {
                bg = c.bg_01
            }
        },
        {
            groups = {
                "Cursor"
            },
            style = {
                fg = c.bg_normal,
                bg = c.fg_normal
            }
        },
        {
            groups = {
                "PmenuSel"
            },
            style = {
                fg = c.fg_normal,
                bg = c.fg_01
            }
        },
        {
            groups = {
                "Wildmenu",
                "Pmenu"
            },
            style = {
                fg = c.bg_normal,
                bg = c.fg_normal
            }
        },
        {
            groups = {
                "Comment"
            },
            style = {
                fg = c.fg_01
            }
        },
        {
            groups = {
                "Underlined"
            },
            style = {
                attributes = {
                    underline = true
                }
            }
        },
        {
            groups = {
                "SpellBad"
            },
            style = {
                attributes = {
                    undercurl = true
                }
            }
        },
        {
            groups = {
                "Error"
            },
            style = {
                fg = c.red
            }
        },
        {
            groups = {
                "TabLine"
            },
            style = {
                bg = c.bg_01,
                attributes = {
                    underline = true
                }
            }
        },
        {
            groups = {
                "TabLineFill"
            },
            style = {
                bg = c.bg_normal,
                attributes = {
                    underline = true
                }
            }
        },
        {
            groups = {
                "TabLineSel"
            },
            style = {
                fg = c.bg_normal,
                bg = c.fg_normal
            }
        },
        {
            groups = {
                "StatusLine"
            },
            style = {
                fg = c.fg_normal,
                bg = c.bg_normal,
                attributes = {
                    underline = true
                }
            }
        },
        {
            groups = {
                "StatusLineNC"
            },
            style = {
                fg = c.fg_01,
                bg = c.bg_normal,

                attributes = {
                    underline = true
                }
            }
        },
        {
            groups = {
                "IncSearch"
            },
            style = {
                link = "Cursor"
            }
        },
        {
            groups = {
                "ErrorMsg",
                "WarningMsg"
            },
            style = {
                link = "Error"
            }
        },
        {
            groups = {
                "CursorLine",
                "CursorColumn"
            },
            style = {
                link = "Visual"
            }
        },
        {
            groups = {
                "StatusLineTerm"
            },
            style = {
                link = "StatusLine"
            }
        },
        {
            groups = {
                "StatusLineTermNC"
            },
            style = {
                link = "StatusLineNC"
            }
        },
        {
            groups = {
                "Terminal",
                "CursorLineNR",
                "DiffAdd",
                "DiffChange",
                "DiffDelete",
                "DiffText",
                "ToolbarLine",
                "ToolbarButton",
                "Directory",
                "ColorColumn",
                "QuickFixLine",
                "SpecialKey",
                "NonText",
                "Question",
                "SignColumn",
                "Title",
                "Function",
                "String",
                "Character",
                "Statement",
                "PreProc",
                "Identifier",
                "Constant",
                "Boolean",
                "Delimiter",
                "Type",
                "Number",
                "Linear",
                "Special",
                "Conceal",
                "Ignore",
                "Float",
                "Conditional",
                "Repeat",
                "Label",
                "Operator",
                "Keyword",
                "Exception",
                "Include",
                "Define",
                "Macro",
                "PreCondit",
                "StorageClass",
                "Structure",
                "Typedef",
                "Tag",
                "SpecialChar",
                "SpecialComment",
                "Debug",
                "SpellCap",
                "SpellRare",
                "SpellLocal",
                "PmenuSbar",
                "PmenuThumb",
                "lCursor",
                "LineNrAbove",
                "LineNrBelow",
                "VisualNOS",
                "MoreMsg",
                "ModeMsg"
        },
            style = {
                link = "Normal"
            }
        },
        {
            groups = {
                "Folded",
                "FoldColumn",
                "Todo",
                "VertSplit",
                "WinSeparator",
                "NonText",
                "EndOfBuffer",
                "LineNr"
        },
            style = {
                link = "Comment"
            }
        },
    }

    return theme
end

return M
