return {
    "mini.keymap",
    -- before = function()
    --     require("lz.n").trigger_load("ultimate-autopair.nvim")
    -- end,
    after = function()
        local map_multistep = require("mini.keymap").map_multistep

        local pairs = { ["("] = ")", ["["] = "]", ["{"] = "}", ['"'] = '"', ["'"] = "'", ["`"] = "`" }

        -- Multiline pair backspace: handles {\n  |  \n} -> {|}
        -- Cursor is on a whitespace-only line between matching pair characters
        local multiline_pair_bs_condition = function()
            local line = vim.api.nvim_get_current_line()
            local lnum = vim.fn.line(".")
            local col = vim.fn.col(".")
            local offset = vim.fn.mode() == "i" and 1 or 0

            -- Must not be on first or last line
            if lnum < 2 then
                return false
            end
            local line_count = vim.api.nvim_buf_line_count(0)
            if lnum >= line_count then
                return false
            end

            -- Current line must be whitespace only (before cursor)
            if line:sub(1, col - offset):find("[^%s]") then
                return false
            end

            -- Get surrounding lines
            local lines = vim.api.nvim_buf_get_lines(0, lnum - 2, lnum + 1, false)
            local prev_line = lines[1]
            local next_line = lines[3]

            -- Previous line must end with an opening pair character
            local opener = prev_line:sub(-1)
            local closer = pairs[opener]
            if not closer then
                return false
            end

            -- Next line must start with the matching closer (after optional whitespace)
            -- Also check that rest of current line (after cursor) is whitespace only
            local after_cursor = line:sub(col + 1 - offset)
            if after_cursor:find("[^%s]") then
                return false
            end

            local next_trimmed = next_line:match("^%s*(.)")
            return next_trimmed == closer
        end

        local multiline_pair_bs_action = function()
            return function()
                local lnum = vim.fn.line(".")
                local lines = vim.api.nvim_buf_get_lines(0, lnum - 2, lnum + 1, false)
                local prev_line = lines[1]
                local next_line = lines[3]

                -- Find where the closer starts (skip leading whitespace)
                -- find() returns 1-indexed, nvim_buf_set_text expects 0-indexed
                local closer_pos = next_line:find("[^%s]")

                -- Delete from end of prev_line to the closer on next_line (exclusive)
                vim.api.nvim_buf_set_text(0, lnum - 2, #prev_line, lnum, closer_pos - 1, {})
                vim.api.nvim_win_set_cursor(0, { lnum - 1, #prev_line })
            end
        end

        -- Regular multiline hungry backspace: deletes to previous line when on whitespace-only line
        local multiline_hungry_bs_condition = function()
            local line, lnum, col = vim.api.nvim_get_current_line(), vim.fn.line("."), vim.fn.col(".")
            local offset = vim.fn.mode() == "i" and 1 or 0
            return lnum > 1 and line:sub(1, col - offset):find("^%s+$") ~= nil
        end

        local multiline_hungry_bs_action = function()
            return function()
                local lnum, col = vim.fn.line("."), vim.fn.col(".")
                local lines = vim.api.nvim_buf_get_lines(0, lnum - 2, lnum, false)
                local prev_len = lines[1]:len()
                local offset = vim.fn.mode() == "i" and 1 or 0

                vim.api.nvim_buf_set_text(0, lnum - 2, prev_len, lnum - 1, col - offset, {})
                vim.api.nvim_win_set_cursor(0, { lnum - 1, prev_len })

                -- If prev_line was empty then we need to make sure the line is properly indented
                if prev_len == 0 then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-F>", true, false, true), "n", true)
                end
            end
        end

        -- Inline pair backspace: handles {|} -> |
        local pair_bs_condition = function()
            local line = vim.api.nvim_get_current_line()
            local col = vim.fn.col(".")
            if col < 2 then
                return false
            end

            local before = line:sub(col - 1, col - 1)
            local after = line:sub(col, col)
            return pairs[before] == after
        end

        local pair_bs_action = function()
            return "<BS><Del>"
        end

        local bs_steps = {
            { condition = multiline_pair_bs_condition, action = multiline_pair_bs_action },
            { condition = multiline_hungry_bs_condition, action = multiline_hungry_bs_action },
            { condition = pair_bs_condition, action = pair_bs_action },
            "hungry_bs",
        }

        map_multistep("i", "<bs>", bs_steps)

        local tabout_condition = function()
            return true
        end

        local tabout_action = function()
            return "<Plug>(TaboutMulti)"
        end

        -- 1. if autocompletion is showing but nothing has been selected yet, then <tab> will select and fill out the first item in the list
        -- 2. after the first <tab> press, further <tab> presses will cycle through the items on the list.
        -- 3. if there's no autocomplete, but there is an active snippet, then pressing <tab> will move to the next position in the snippet
        -- 4. if there's no active snippet, then pressing <tab> will attempt to tab-out of the current treesitter context
        -- 5. if there is no treesitter context to tab-out of, then <tab> will do nothing
        local tab_steps = {
            "blink_next",
            "luasnip_next",
            { condition = tabout_condition, action = tabout_action },
        }

        map_multistep("i", "<tab>", tab_steps)
    end,
    event = "DeferredUIEnter",
}
