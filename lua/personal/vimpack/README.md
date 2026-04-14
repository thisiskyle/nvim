### personal/vimpack/init.lua

<br>
<br>

### about

On startup, `vimpack/init.lua` pulls all lua files in the `vimpack/specs` directory
then runs `require()` on them and makes a list of spec tables.

Once it has the main list it sorts the data into separate lists:

- a list of `vim.pack.Spec`s to be loaded with `vim.pack.add(spec)`
- a list of names to be loaded with `:packadd <name>` (for builtin and local opt-in plugins)
- a list of all the setup functions that will be ran after all plugins have been loaded

More information about why we sort like this can be found in the spec section.


<br>
<br>


### spec 

[Examples](./specs/)


```lua

return {

    ---@type boolean
    enabled = true,

    --- For more info check  :help vim.pack.Spec
    --- 
    ---@type vim.pack.Spec[]
    pack_specs = {
        {
            src = "https://github.com/plugin-guy/cool-plugin.nvim",
        },
        {
            src = "https://github.com/another-guy/another-plugin.nvim",
        },

        --- NOTE: If a vim.pack.Spec in the list is missing a src but has a name
        ---       then we will attempt to load the plugin with ':packadd <spec.name>'
        ---       instead of using 'vim.pack.add(spec)'
        ---
        ---       This can be useful for plugin development when you want to switch to a 
        ---       local version and still use the same setup function.
        ---
        ---       For example, putting a plugin at: 
        ---
        ---           ~/.local/share/nvim/site/pack/dev/opt/cool-plugin-dev
        ---
        ---       Can be loaded with this vim.pack.Spec:
        ---
        ---           {
        ---               name = "cool-plugin-dev"
        ---           }

    }
    ,

    --- Runs after all plugins in all specs have loaded
    --- Any setup should be done here
    ---
    ---@type fun()
    setup = function()

        require("another-plugin").setup({ })
        require("cool-plugin").setup({ })

        vim.keymap.set(
            { 'n' },
            '<leader>c',
            function() 
                require("cool-plugin").do_the_thing() 
            end, 
            {}
        )

    end

}

```

<br>
<br>

### extras

<br>

#### commands

|Command|Description|
|-|-|
|:PackClean|Delete all plugins installed using vim.pack and run full install|

