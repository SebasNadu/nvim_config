Vim�UnDo� �����#�u�B��������� G�H6�*4��   �                                   fY�    _�                     �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        fY�     �   �   �          	-- {   	-- 	"nvimtools/none-ls.nvim",   	-- 	optional = true,   	-- },5��    �                      Y      B               5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       fY�     �   �   �          			setup = {   				eslint = function()   ;					require("lazyvim.util").lps.on_attach(function(client)   %						if client.name == "eslint" then   C							client.server_capabilities.documentFormattingProvider = true   +						elseif client.name == "tsserver" then   D							client.server_capabilities.documentFormattingProvider = false   							end   						end)   				end,   			},5��    �                      �      _              5�_�                           ����                                                                                                                                                                                                                                                                                                                            �          �          V       fY�     �   ~             				eslint = {},5��    ~                      �                     5�_�                     ~       ����                                                                                                                                                                                                                                                                                                                            �          �          V       fY�    �      �   �   �   		-- tools   	{   		"williamboman/mason.nvim",   		optional = true,   	},   	-- lsp servers   	{   		"neovim/nvim-lspconfig",   
		opts = {   %			inlay_hints = { enabled = false },   			---@type lspconfig.options   			servers = {   				cssls = {},   				tailwindcss = {   					root_dir = function(...)   @						return require("lspconfig.util").root_pattern(".git")(...)   						end,   				},   				tsserver = {   					root_dir = function(...)   @						return require("lspconfig.util").root_pattern(".git")(...)   						end,   !					single_file_support = false,   					settings = {   						typescript = {   							inlayHints = {   3								includeInlayParameterNameHints = "literal",   F								includeInlayParameterNameHintsWhenArgumentMatchesName = false,   6								includeInlayFunctionParameterTypeHints = true,   .								includeInlayVariableTypeHints = false,   8								includeInlayPropertyDeclarationTypeHints = true,   7								includeInlayFunctionLikeReturnTypeHints = true,   0								includeInlayEnumMemberValueHints = true,   								},   						},   						javascript = {   							inlayHints = {   /								includeInlayParameterNameHints = "all",   F								includeInlayParameterNameHintsWhenArgumentMatchesName = false,   6								includeInlayFunctionParameterTypeHints = true,   -								includeInlayVariableTypeHints = true,   8								includeInlayPropertyDeclarationTypeHints = true,   7								includeInlayFunctionLikeReturnTypeHints = true,   0								includeInlayEnumMemberValueHints = true,   								},   						},   					},   				},   				html = {},   				yamlls = {   					settings = {   						yaml = {   							keyOrdering = false,   						},   					},   				},   				lua_ls = {   					-- enabled = false,    					single_file_support = true,   					settings = {   						Lua = {   							workspace = {    								checkThirdParty = false,   								},   							completion = {   								workspaceWord = true,   								callSnippet = "Both",   								},   							misc = {   								parameters = {    									-- "--log-level=trace",   
								},   								},   							hint = {   								enable = true,   								setType = false,   								paramType = true,   								paramName = "Disable",   								semicolon = "Disable",   								arrayIndex = "Disable",   								},   							doc = {   								privateName = { "^_" },   								},   							type = {   #								castNumberToInteger = true,   								},   							diagnostics = {   C								disable = { "incomplete-signature-doc", "trailing-space" },   								-- enable = false,   								groupSeverity = {   									strong = "Warning",   									strict = "Warning",   
								},   								groupFileStatus = {   "									["ambiguity"] = "Opened",   									["await"] = "Opened",    									["codestyle"] = "None",   "									["duplicate"] = "Opened",   									["global"] = "Opened",   									["luadoc"] = "Opened",   "									["redefined"] = "Opened",   									["strict"] = "Opened",   									["strong"] = "Opened",   #									["type-check"] = "Opened",   #									["unbalanced"] = "Opened",   									["unused"] = "Opened",   
								},   &								unusedLocalExclude = { "_*" },   								},   							format = {   								enable = false,   								defaultConfig = {   									indent_style = "tab",   									indent_size = "2",   (									continuation_indent_size = "2",   
								},   								},   						},   					},   				},   				clangd = {   F					-- filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },   7					filetypes = { "objc", "objcpp", "cuda", "proto" },   				},   			},   		},   	},5��                       	       �            5��