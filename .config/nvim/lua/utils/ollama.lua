---@diagnostic disable: need-check-nil

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local M = {}

function M.get_local_models()
    -- Make HTTP request
    local host = os.getenv('OLLAMA_HOST') or '127.0.0.1:11434'
    local socket = io.popen('curl -s http://' .. host .. '/api/tags')
    local response = socket:read('*a')
    socket:close()

    if response == nil or response == '' then
        return {}
    end

    -- Parse local ollama models
    local data = vim.fn.json_decode(response)
    local models = {}

    for _, model in pairs(data.models) do
        table.insert(models, model.name)
    end

    return models
end

function M.pick_model(models, on_select)
    pickers
        .new({}, {
            prompt_title = 'Models',
            finder = finders.new_table({
                results = models,
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    on_select(selection[1])
                end)
                return true
            end,
        })
        :find()
end

function M.save_curr_selection(model)
    -- Create file to save current model selection
    local filename = vim.fn.stdpath('data') .. '/ollama.model'
    local file = io.open(filename, 'w+')

    if file then
        file:write(model)
        file:close()
    end
end

function M.get_prev_selection()
    -- Open file to get the prev saved model
    local filename = vim.fn.stdpath('data') .. '/ollama.model'
    local file = io.open(filename, 'r')

    if file then
        local model = file:read('*a')
        file:close()
        return model
    end
end

return M
