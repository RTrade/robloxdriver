# Orion Library
This documentation is for the stable release of Orion Library.

## Loading the robloxdriver
```lua
local robloxdriver = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
```



## Creating a new driver
```lua
local driver = robloxdriver:new()
```



# character automation
</br>

## Making our character click a workspace element
```lua
driver.Character:click_element(WORKSPACE_ELEMENT_HERE)
```

## Making our character touch a workspace element
```lua
driver.Character:touch_element(WORKSPACE_ELEMENT_HERE)
```

## Making our character jump
```lua
driver.Character:jump()
```

## Making our character reset
```lua
driver.Character:reset()
```
