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

## Pressing a key on keyboard
```lua
driver:keypress("W",5)
--[[
argument1 = <string> - The key you want to press
argument2 = <number> - The length of time you want to press that key for
]]
```

## Typing text into a textbox
```lua
local text = 'Hello, World'
driver:type_textbox(element,text)
--[[
argument1 = <object> - The textbox element
argument2 = <string> - The text you want to input
]]
```




# character automation
</br>


## Finding a workspace element
```lua
local ElementName = 'Money'
local LocateAllElements = false
local Element = driver:find_workspace_element(ElementName,LocateAllElements) -- Returns any workspace object witch has the same Name as inputted.

--[[
argument1 = <string>  - The workspace element you wish to find
argument2 = <string> - If you want to find every element witch matches argument1, example output {<object>,<object>,<object>}
]]
```


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

# API functions

## Debugging infomation into the robloxdriver console
```lua
robloxdriver:debug("print","Hello, world") -- Prints 'Hello, world' into the console in green and white
robloxdriver:debug("warn","Hello, world") -- Warns 'Hello, world' into the console in yellow and white
robloxdriver:debug("error","Goodbye, world") -- Errors 'Goodbye, world' into the console in red and white and will shutdown the roblox process 5 seconds later.
```

## Converting characters to MSDN
```lua
local Example = robloxdriver:indentifyMSDN("A")
local Example2 = robloxdriver:indentifyMSDN("B")
local Example3 = robloxdriver:indentifyMSDN("C")

print(Example) --> 0x41
print(Example2) --> 0x42
print(Example3) --> 0x43
```
