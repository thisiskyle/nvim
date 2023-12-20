local M = {}

-- takes a pallete and applys the colors to the highlight groups
function M.setup(p)

    vim.opt.background = p.background or "dark"

    local highlight_rules = {
        {
            groups = {
                "Normal"
            },
            style = {
                fg = p.text,
                bg = p.base
            }
        },
        {
            groups = {
                "Matchparen"
            },
            style = {
                fg = p.alt,
                bg = p.accent,
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
                fg = p.alt,
                bg = p.accent,
            }
        },
        {
            groups = {
                "Visual"
            },
            style = {
                bg = p.highlight
            }
        },
        {
            groups = {
                "Cursor"
            },
            style = {
                fg = p.base,
                bg = p.text
            }
        },
        {
            groups = {
                "PmenuSel"
            },
            style = {
                fg = p.base,
                bg = p.text
            }
        },
        {
            groups = {
                "Wildmenu",
                "Pmenu"
            },
            style = {
                fg = p.text,
                bg = p.highlight
            }
        },
        {
            groups = {
                "Comment"
            },
            style = {
                fg = p.muted
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
                fg = p.error
            }
        },
        {
            groups = {
                "WarningMsg"
            },
            style = {
                fg = p.warn
            }
        },
        {
            groups = {
                "TabLine"
            },
            style = {
                bg = p.highlight,
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
                bg = p.base,
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
                fg = p.base,
                bg = p.text
            }
        },
        {
            groups = {
                "StatusLine"
            },
            style = {
                fg = p.text,
                bg = p.highlight,
            }
        },
        {
            groups = {
                "StatusLineNC"
            },
            style = {
                fg = p.muted,
                bg = p.highlight,
            }
        },
        {
            groups = {
                "IncSearch"
            },
            style = {
                fg = p.base,
                bg = p.text,
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
    return highlight_rules
end

return M
