---@diagnostic disable: need-check-nil

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

local function to_snacks_items(entries)
    local items = {}
    for i, item in pairs(entries) do
        table.insert(items, {
            idx = i,
            name = item,
            text = item,
        })
    end
    return items
end

function M.pick_model(models, on_selection)
    -- Check if snacks is installed
    local has_snacks, snacks = pcall(require, 'snacks.picker')
    local layout = require('snacks.picker.config.layouts')
    if not has_snacks then
        return
    end

    -- Format item to picker show entry
    local format = function(item)
        return { { item.name, 'SnacksPickerLabel' } }
    end

    snacks.pick({
        title = 'Models',
        items = to_snacks_items(models),
        layout = layout.select,
        format = format,
        confirm = function(picker, item)
            on_selection(item.text)
            picker:close()
        end,
    })
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
