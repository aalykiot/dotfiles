return {
    'David-Kunz/gen.nvim',
    dependencies = { 'j-hui/fidget.nvim' },
    config = function()
        -- Configure local LLM setup
        local ollama = require('utils.ollama')
        local gen = require('gen')
        local fidget = require('fidget')
        local models = ollama.get_local_models()
        local selected_model = ollama.get_prev_selection()

        -- Check if at least one ollama model is available
        if #models == 0 then
            fidget.notify('No ollama models found installed', vim.log.levels.WARN)
            return
        end

        gen.setup({
            model = selected_model or models[1],
            quit_map = 'q',
            display_mode = 'split',
            show_prompt = true,
            show_model = true,
        })

        -- Reset built-in prompts
        gen.prompts = {}

        gen.prompts['Ask'] = { prompt = '$input:\n$text' }
        gen.prompts['Chat'] = { prompt = '$input' }
        gen.prompts['Explain'] = { prompt = 'Explain what the code does:\n$text' }

        local update_gen_model = function(new_model)
            gen.model = new_model
            ollama.save_curr_selection(new_model)
        end

        -- Create custom command to pick and change model
        vim.api.nvim_create_user_command('Assistant', function()
            ollama.pick_model(models, update_gen_model)
        end, {})

        -- Setup key mapping
        vim.keymap.set({ 'n', 'v' }, '<leader>ai', ':Gen<CR>', { desc = 'Open AI assistant' })
    end,
}
