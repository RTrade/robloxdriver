# robloxdriver
This documentation is for the release of robloxdriver.

## Loading the robloxdriver
```lua
local robloxdriver = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
```



## Creating a new driver
```lua
local driver = robloxdriver:new()
```

# Roblox automation
</br>

## Finding a GUI element
```lua
local element = driver:find_element("Test") -- Returns any GUI object witch has the same ImageId,PlaceholderText or text as inputted.
--[[
argument1 = <string> - The GUI object you wish to find.
]]
```

## Clicking a GUI element
```lua
driver:click(element)
```

## Clicking our mouse
```lua
driver:click()
```




# character automation
</br>

## Making our character click a workspace element
```lua
driver.Character:click_element(WORKSPACE_ELEMENT_HERE)
--[[
WORKSPACE_ELEMENT_HERE = <object> - The object you want to click
]]
```

## Making our character touch a workspace element
```lua
driver.Character:touch_element(WORKSPACE_ELEMENT_HERE)
--[[
WORKSPACE_ELEMENT_HERE = <object> - The object you want to click
]]
```

## Making our character jump
```lua
driver.Character:jump()
```

## Making our character reset
```lua
driver.Character:reset()
```
