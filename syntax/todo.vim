if exists("b:current_syntax")
  finish
endif

syn match todoRefactor '\(TODO\|todo\)/refactor'
syn match todoBug '\(TODO\|todo\)/bug'
syn match todoFeature '\(TODO\|todo\)/\(feature\|feat\)'
syn match todoChore '\(TODO\|todo\)/chore'

let b:current_syntax = "todo"

hi def link todoBug DiagnosticError
hi def link todoRefactor DiagnosticWarn
hi def link todoFeature DiagnosticInfo
hi def link todoChore DiagnosticHint
