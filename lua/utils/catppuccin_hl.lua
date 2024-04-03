return {
	custom_highlights = function(colors)
		return {
			-- NormalFloat = { bg = colors.surface0 },
			LineNr = { fg = colors.overlay1, bg = "" },
			CursorLineNr = { fg = colors.yellow, bg = colors.surface1, style = {} },
			CursorLine = { bg = colors.surface1 },
			-- colorColumn = { bg = #252525 },
			-- visual = { bg = colors.surface1 },
			-- MsgArea = { fg = colors.subtext0 },
			-- TabLine = { bg = colors.mantle },
			-- TabLineFill = { bg = colors.mantle },
			-- TabLineSel = { fg = colors.subtext0, bg = colors.base },

			GitSignsAdd = { fg = colors.sapphire },
			GitSignsChange = { fg = colors.yellow },
			GitSignsDelete = { fg = colors.red },
			TelescopeBorder = { fg = colors.subtext0 },

			FloatBorder = { fg = colors.subtext1 },
			-- VertSplit = { bg = colors.base, fg = colors.surface1 },
			FoldColumn = { fg = colors.subtext1, bg = "" },
			CursorLineSign = { bg = colors.surface1 },
			-- CursorLineFold = { bg = colors.red },
			-- SignColumn = { bg = "" },
			Pmenu = { bg = colors.base, fg = colors.overlay1 },
			PmenuSel = { bg = colors.surface2, fg = colors.subtext1 },
			PmenuThumb = { bg = colors.yellow },
			-- LazySpecial = { style = {} },
			LazyProgressDone = { fg = colors.green, style = { "nocombine" } },
			LazyProgressTodo = { fg = colors.pink, style = { "nocombine" } },
			-- LazySpecial = { fg = colors.yellow, style = { "nocombine" } },
			-- LazyDimmed = { fg = colors.base, bg = colors.mantle, style = { "nocombine" } },
			-- LspFloatWinBorder = { fg = colors.subtext1 },

			WinBar = { fg = colors.overlay2, bg = "" },
			WinBarNC = { fg = colors.overlay2, bg = "" },
			CmpBorder = { fg = colors.surface2 },
			--  Pmenu = { bg = C.none },
			MatchParen = { fg = colors.pink, bg = colors.surface1, style = {} },
			IndentBlanklineContextChar = { fg = colors.pink },

			InclineNormal = { bg = colors.pink },
			InclineNormalNC = { bg = colors.blue },

			DiagnosticVirtualTextError = { fg = colors.red },
			DiagnosticVirtualTextWarn = { fg = colors.yellow },
			DiagnosticVirtualTextInfo = { fg = colors.blue },
			DiagnosticVirtualTextHint = { fg = colors.pink },
			DiagnosticVirtualTextOk = { fg = colors.green },
			DiagnosticFloatingError = { fg = colors.red },
			DiagnosticFloatingWarn = { fg = colors.yellow },
			DiagnosticFloatingInfo = { fg = colors.blue },
			DiagnosticFloatingHint = { fg = colors.pink },
			DiagnosticFloatingOk = { fg = colors.green },
			DiagnosticSignError = { fg = colors.red },
			DiagnosticSignWarn = { fg = colors.yellow },
			DiagnosticSignInfo = { fg = colors.blue },
			DiagnosticSignHint = { fg = colors.pink },
			DiagnosticSignOk = { fg = colors.green },

			-- TelescopeBorder = { fg = colors.subtext1, bg = "none" },
			-- TelescopeNormal = { bg = "none" },
			-- TelescopeSelection = { bg = colors.surface0 },
			-- TelescopePromptCounter = { fg = colors.mauve, style = {} },
			-- TelescopePromptPrefix = { bg = "none" },
			-- TelescopePromptNormal = { bg = "none" },
			-- TelescopeResultsNormal = { bg = "none" },
			-- TelescopePreviewNormal = { bg = "none" },
			-- TelescopePromptBorder = { bg = "none", fg = colors.subtext1 },
			-- TelescopeResultsBorder = { bg = "none", fg = colors.subtext1 },
			-- TelescopePreviewBorder = { bg = "none", fg = colors.subtext1 },
			-- TelescopePromptTitle = { bg = "none", fg = colors.subtext1 },
			-- TelescopeResultsTitle = { bg = "none", fg = colors.subtext1 },
			-- TelescopePreviewTitle = { bg = "none", fg = colors.subtext1 },

			-- IndentBlanklineChar = { fg = colors.surface0 },
			-- IndentBlanklineContextChar = { fg = colors.surface2 },
			-- Blamer = { fg = colors.overlay1, bg = colors.base },
			-- NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
			-- NvimTreeExecFile = { fg = colors.text },

			Boolean = { fg = colors.green },
			Number = { fg = colors.green },
			Float = { fg = colors.green },

			PreProc = { fg = colors.green },
			PreCondit = { fg = colors.green },
			Include = { fg = colors.green },
			Define = { fg = colors.green },
			Conditional = { fg = colors.flamingo },
			Repeat = { fg = colors.flamingo },
			Keyword = { fg = colors.flamingo },
			Typedef = { fg = colors.flamingo },
			Exception = { fg = colors.flamingo },
			Statement = { fg = colors.flamingo },

			Error = { fg = colors.red },
			StorageClass = { fg = colors.peach },
			Tag = { fg = colors.peach },
			Label = { fg = colors.peach },
			Structure = { fg = colors.peach },
			Operator = { fg = colors.peach },
			Title = { fg = colors.pink },
			Special = { fg = colors.yellow },
			SpecialChar = { fg = colors.yellow },
			Type = { fg = colors.yellow, style = { "bold" } },
			Function = { fg = colors.sapphire },
			Delimiter = { fg = colors.subtext1 },
			Ignore = { fg = colors.subtext1 },
			Macro = { fg = colors.rosewater },

			Constant = { fg = colors.blue },
			String = { fg = colors.text },
			Character = { fg = colors.text },
			Identifier = { fg = colors.subtext1 },

			Comment = { fg = colors.overlay2 },
			Repeat = { fg = colors.flamingo },

			cTypedef = { fg = colors.flamingo, style = { "italic" } },
			cDefine = { fg = colors.green, style = { "italic" } },
			cStructure = { fg = colors.peach },
			StorageClass = { fg = colors.peach, style = { "italic" } },
			cStorageclass = { fg = colors.peach, style = { "italic" } },

			TSAnnotation = { fg = colors.teal },
			TSAttribute = { fg = colors.teal },
			TSBoolean = { fg = colors.green },
			TSCharacter = { fg = colors.sky },
			TSCharacterSpecial = { link = "SpecialChar" },
			TSComment = { link = "Comment" },
			TSConditional = { fg = colors.flamingo },
			TSConstBuiltin = { fg = colors.teal },
			TSConstMacro = { fg = colors.flamingo },
			TSConstant = { fg = colors.sky },
			TSConstructor = { fg = colors.sapphire },
			TSDebug = { link = "Debug" },
			TSDefine = { link = "Define" },
			TSEnvironment = { link = "Macro" },
			TSEnvironmentName = { link = "Type" },
			TSError = { link = "Error" },
			TSException = { fg = colors.flamingo },
			TSField = { fg = colors.sapphire },
			TSFloat = { fg = colors.green },
			TSFuncBuiltin = { fg = colors.sapphire },
			TSFuncMacro = { fg = colors.sapphire },
			TSFunction = { fg = colors.sapphire },
			TSFunctionCall = { fg = colors.sapphire },
			TSInclude = { fg = colors.flamingo },
			TSKeyword = { fg = colors.flamingo },
			TSKeywordFunction = { fg = colors.flamingo },
			TSKeywordOperator = { fg = colors.peach },
			TSKeywordReturn = { fg = colors.flamingo },
			TSLabel = { fg = colors.peach },
			TSLiteral = { link = "String" },
			TSMath = { fg = colors.sapphire },
			TSMethod = { fg = colors.sapphire },
			TSMethodCall = { fg = colors.sapphire },
			TSNamespace = { fg = colors.yellow },
			TSNone = { fg = colors.text },
			TSNumber = { fg = colors.green },
			TSOperator = { fg = colors.peach },
			TSParameter = { fg = colors.text },
			TSParameterReference = { fg = colors.text },
			TSPreProc = { link = "PreProc" },
			TSProperty = { fg = colors.sapphire },
			TSPunctBracket = { fg = colors.subtext1 },
			TSPunctDelimiter = { link = "Delimiter" },
			TSPunctSpecial = { fg = colors.sapphire },
			TSRepeat = { fg = colors.flamingo },
			TSStorageClass = { fg = colors.peach },
			TSStorageClassLifetime = { fg = colors.peach },
			TSStrike = { fg = colors.subtext1 },
			TSString = { fg = colors.sky },
			TSStringEscape = { fg = colors.sapphire },
			TSStringRegex = { fg = colors.sapphire },
			TSStringSpecial = { link = "SpecialChar" },
			TSSymbol = { fg = colors.subtext1 },
			TSTag = { fg = colors.peach },
			TSTagAttribute = { fg = colors.sapphire },
			TSTagDelimiter = { fg = colors.sapphire },
			TSText = { fg = colors.sapphire },
			TSTextReference = { link = "Constant" },
			TSTitle = { link = "Title" },
			TSTodo = { link = "Todo" },
			TSType = { fg = colors.yellow, style = { "bold" } },
			TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
			TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
			TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
			TSURI = { fg = colors.sapphire },
			TSVariable = { fg = colors.text },
			TSVariableBuiltin = { fg = colors.teal },

			["@annotation"] = { link = "TSAnnotation" },
			["@attribute"] = { link = "TSAttribute" },
			["@boolean"] = { link = "TSBoolean" },
			["@character"] = { link = "TSCharacter" },
			["@character.special"] = { link = "TSCharacterSpecial" },
			["@comment"] = { link = "TSComment" },
			["@conceal"] = { link = "Grey" },
			["@conditional"] = { link = "TSConditional" },
			["@constant"] = { link = "TSConstant" },
			["@constant.builtin"] = { link = "TSConstBuiltin" },
			["@constant.macro"] = { link = "TSConstMacro" },
			["@constructor"] = { link = "TSConstructor" },
			["@debug"] = { link = "TSDebug" },
			["@define"] = { link = "TSDefine" },
			["@error"] = { link = "TSError" },
			["@exception"] = { link = "TSException" },
			["@field"] = { link = "TSField" },
			["@float"] = { link = "TSFloat" },
			["@function"] = { link = "TSFunction" },
			["@function.builtin"] = { link = "TSFuncBuiltin" },
			["@function.call"] = { link = "TSFunctionCall" },
			["@function.macro"] = { link = "TSFuncMacro" },
			["@include"] = { link = "TSInclude" },
			["@keyword"] = { link = "TSKeyword" },
			["@keyword.function"] = { link = "TSKeywordFunction" },
			["@keyword.operator"] = { link = "TSKeywordOperator" },
			["@keyword.return"] = { link = "TSKeywordReturn" },
			["@label"] = { link = "TSLabel" },
			["@math"] = { link = "TSMath" },
			["@method"] = { link = "TSMethod" },
			["@method.call"] = { link = "TSMethodCall" },
			["@namespace"] = { link = "TSNamespace" },
			["@none"] = { link = "TSNone" },
			["@number"] = { link = "TSNumber" },
			["@operator"] = { link = "TSOperator" },
			["@parameter"] = { link = "TSParameter" },
			["@parameter.reference"] = { link = "TSParameterReference" },
			["@preproc"] = { link = "TSPreProc" },
			["@property"] = { link = "TSProperty" },
			["@punctuation.bracket"] = { link = "TSPunctBracket" },
			["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
			["@punctuation.special"] = { link = "TSPunctSpecial" },
			["@repeat"] = { link = "TSRepeat" },
			["@storageclass"] = { link = "TSStorageClass" },
			["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
			["@strike"] = { link = "TSStrike" },
			["@string"] = { link = "TSString" },
			["@string.escape"] = { link = "TSStringEscape" },
			["@string.regex"] = { link = "TSStringRegex" },
			["@string.special"] = { link = "TSStringSpecial" },
			["@symbol"] = { link = "TSSymbol" },
			["@tag"] = { link = "TSTag" },
			["@tag.attribute"] = { link = "TSTagAttribute" },
			["@tag.delimiter"] = { link = "TSTagDelimiter" },
			["@text"] = { link = "TSText" },
			["@text.danger"] = { link = "TSDanger" },
			["@text.diff.add"] = { link = "diffAdded" },
			["@text.diff.delete"] = { link = "diffRemoved" },
			["@text.emphasis"] = { link = "TSEmphasis" },
			["@text.environment"] = { link = "TSEnvironment" },
			["@text.environment.name"] = { link = "TSEnvironmentName" },
			["@text.literal"] = { link = "TSLiteral" },
			["@text.math"] = { link = "TSMath" },
			["@text.note"] = { link = "TSNote" },
			["@text.reference"] = { link = "TSTextReference" },
			["@text.strike"] = { link = "TSStrike" },
			["@text.strong"] = { link = "TSStrong" },
			["@text.title"] = { link = "TSTitle" },
			["@text.todo"] = { link = "TSTodo" },
			["@text.todo.checked"] = { link = "sapphire" },
			["@text.todo.unchecked"] = { link = "Ignore" },
			["@text.underline"] = { link = "TSUnderline" },
			["@text.uri"] = { link = "TSURI" },
			["@text.warning"] = { link = "TSWarning" },
			["@todo"] = { link = "TSTodo" },
			["@type"] = { link = "TSType" },
			["@type.builtin"] = { link = "TSTypeBuiltin" },
			["@type.definition"] = { link = "TSTypeDefinition" },
			["@type.qualifier"] = { link = "TSTypeQualifier" },
			["@uri"] = { link = "TSURI" },
			["@variable"] = { link = "TSVariable" },
			["@variable.builtin"] = { link = "TSVariableBuiltin" },
			-- ["@keyword.return"] = { fg = colors.flamingo, style = { "italic", "nocombine" } },
			-- ["@parameter"] = { fg = colors.subtext0, style = { "italic" } },
			-- ["@property"] = { fg = colors.subtext1 },
			-- ["@function.macro"] = { fg = colors.flamingo },
			-- ["@type.builtin"] = { fg = colors.blue },

			["@lsp.type.class"] = { link = "TSType" },
			["@lsp.type.comment"] = { link = "TSComment" },
			["@lsp.type.decorator"] = { link = "TSFunction" },
			["@lsp.type.enum"] = { link = "TSType" },
			["@lsp.type.enumMember"] = { link = "TSProperty" },
			["@lsp.type.events"] = { link = "TSLabel" },
			["@lsp.type.function"] = { link = "TSFunction" },
			["@lsp.type.interface"] = { link = "TSType" },
			["@lsp.type.keyword"] = { link = "TSKeyword" },
			["@lsp.type.macro"] = { link = "TSConstMacro" },
			["@lsp.type.method"] = { link = "TSMethod" },
			["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
			["@lsp.type.namespace"] = { link = "TSNamespace" },
			["@lsp.type.number"] = { link = "TSNumber" },
			["@lsp.type.operator"] = { link = "TSOperator" },
			["@lsp.type.parameter"] = { link = "TSParameter" },
			["@lsp.type.property"] = { link = "TSProperty" },
			["@lsp.type.regexp"] = { link = "TSStringRegex" },
			["@lsp.type.string"] = { link = "TSString" },
			["@lsp.type.struct"] = { link = "TSType" },
			["@lsp.type.type"] = { link = "TSType" },
			["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
			["@lsp.type.variable"] = { link = "TSVariable" },

			CmpItemKindSnippet = { bg = "", fg = colors.mauve },
			CmpItemKindKeyword = { bg = "", fg = colors.red },
			CmpItemKindText = { bg = "", fg = colors.sky },
			CmpItemKindMethod = { bg = "", fg = colors.blue },
			CmpItemKindConstructor = { bg = "", fg = colors.blue },
			CmpItemKindFunction = { bg = "", fg = colors.blue },
			CmpItemKindFolder = { bg = "", fg = colors.blue },
			CmpItemKindModule = { bg = "", fg = colors.blue },
			CmpItemKindConstant = { bg = "", fg = colors.peach },
			CmpItemKindField = { bg = "", fg = colors.sapphire },
			CmpItemKindProperty = { bg = "", fg = colors.sapphire },
			CmpItemKindEnum = { bg = "", fg = colors.sapphire },
			CmpItemKindUnit = { bg = "", fg = colors.sapphire },
			CmpItemKindClass = { bg = "", fg = colors.yellow },
			CmpItemKindVariable = { bg = "", fg = colors.flamingo },
			CmpItemKindFile = { bg = "", fg = colors.blue },
			CmpItemKindInterface = { bg = "", fg = colors.yellow },
			CmpItemKindColor = { bg = "", fg = colors.red },
			CmpItemKindReference = { bg = "", fg = colors.red },
			CmpItemKindEnumMember = { bg = "", fg = colors.red },
			CmpItemKindStruct = { bg = "", fg = colors.blue },
			CmpItemKindValue = { bg = "", fg = colors.peach },
			CmpItemKindEvent = { bg = "", fg = colors.blue },
			CmpItemKindOperator = { bg = "", fg = colors.blue },
			CmpItemKindTypeParameter = { bg = "", fg = colors.blue },
			CmpItemKindCopilot = { bg = "", fg = colors.sapphire },
			CmpItemKindCodeium = { bg = "", fg = colors.pink },
		}
	end,
	styles = {
		comments = { "italic", "nocombine" },
		conditionals = { "italic" },
		loops = { "italic", "nocombine" },
		functions = { "bold", "italic" },
		keywords = { "italic", "nocombine" },
		strings = {},
		variables = { "nocombine" },
		numbers = {},
		booleans = { "italic" },
		properties = {},
		types = {},
		operators = {},
	},

	highlight_overrides = {
		-- all = function(colors)
		--   return {
		--     Comment = { fg = colors.flamingo },
		--   }
		-- end,
	},
}