return {
    "markview.nvim",
    after = function()
        local function conceal_tag(icon, hl_group)
            return {
                on_node = { hl_group = hl_group },
                on_closing_tag = { conceal = "" },
                on_opening_tag = {
                    conceal = "",
                    virt_text_pos = "inline",
                    virt_text = { { icon .. " ", hl_group } },
                },
            }
        end
        require("markview").setup({
            preview = {
                filetypes = { "codecompanion", "markdown", "quarto", "rmd", "typst" },
                ignore_buftypes = {},
            },
            html = {
                container_elements = {
                    ["^buf$"] = conceal_tag("", "CodeCompanionChatVariable"),
                    ["^file$"] = conceal_tag("", "CodeCompanionChatVariable"),
                    ["^help$"] = conceal_tag("󰘥", "CodeCompanionChatVariable"),
                    ["^image$"] = conceal_tag("", "CodeCompanionChatVariable"),
                    ["^symbols$"] = conceal_tag("", "CodeCompanionChatVariable"),
                    ["^url$"] = conceal_tag("󰖟", "CodeCompanionChatVariable"),
                    ["^var$"] = conceal_tag("", "CodeCompanionChatVariable"),
                    ["^tool$"] = conceal_tag("", "CodeCompanionChatTool"),
                    ["^user_prompt$"] = conceal_tag("", "CodeCompanionChatTool"),
                    ["^group$"] = conceal_tag("", "CodeCompanionChatToolGroup"),
                },
            },
        })
    end,
    lazy = false,
}
