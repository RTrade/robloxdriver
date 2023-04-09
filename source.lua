local robloxdriver = {}

local Players = game:GetService("Players")
local player = Players.LocalPlayer
if rconsolename then
    rconsolename("robloxdriver")
end
function robloxdriver:debug(status, reason)
    local statuses = {
        ["error"] = "@@RED@@",
        ["warn"] = "@@YELLOW@@",
        ["print"] = "@@LIGHT_GREEN@@"
    }
    for i, v in pairs(statuses) do
        if status == i then
            if rconsoleprint then
                rconsoleprint(v)
                rconsoleprint("[" .. string.upper(i) .. "] ")
                rconsoleprint("@@WHITE@@")
                rconsoleprint(reason .. "\n")
            end
            if i == "error" then
                wait(5)
                game:Shutdown()
            end
        end
    end
end

function robloxdriver:indentifyMSDN(key)
    key = string.lower(key)
    local list = {
        ["0x30"] = "0",
        ["0x31"] = "1",
        ["0x32"] = "2",
        ["0x33"] = "3",
        ["0x34"] = "4",
        ["0x35"] = "5",
        ["0x36"] = "6",
        ["0x37"] = "7",
        ["0x38"] = "8",
        ["0x39"] = "9",
        ["0x41"] = "A",
        ["0x42"] = "B",
        ["0x43"] = "C",
        ["0x44"] = "D",
        ["0x45"] = "E",
        ["0x46"] = "F",
        ["0x47"] = "G",
        ["0x48"] = "H",
        ["0x49"] = "I",
        ["0x4A"] = "J",
        ["0x4B"] = "K",
        ["0x4C"] = "L",
        ["0x4D"] = "M",
        ["0x4F"] = "F",
        ["0x50"] = "P",
        ["0x51"] = "Q",
        ["0x52"] = "R",
        ["0x53"] = "S",
        ["0x54"] = "T",
        ["0x55"] = "U",
        ["0x56"] = "V",
        ["0x57"] = "W",
        ["0x58"] = "X",
        ["0x59"] = "Y",
        ["0x5A"] = "Z"
    }
    for i, v in pairs(list) do
        if v == string.upper(key) then
            return i
        end
    end
end

function robloxdriver:new()
    local driver = {}
    driver.Character = {}

    function driver.Character:click_element(element)
        pcall(
            function()
                if not element then
                    return robloxdriver:debug("error", "Element expected got nil when using click_element")
                else
                    for i, v in pairs(element:GetDescendants()) do
                        if v:IsA("ClickDetector") then
                            fireclickdetector(v)
                            return robloxdriver:debug("print", "Clicked " .. element.Name)
                        end
                    end
                end
            end
        )
    end
    function driver.Character:touch_element(element)
        pcall(
            function()
                for i, v in pairs(element:GetDescendants()) do
                    if v.ClassName:match("Part") then
                        firetouchinterest(player.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(player.Character.HumanoidRootPart, v, 1)
                    end
                end
            end
        )
    end
    function driver.Character:reset()
        if isrbxactive then
            keypress(0x1B)
            wait(0.1)
            keyrelease(0x1B)
            wait(0.5)
            keypress(tonumber("0x52"))
            wait(0.1)
            keyrelease(tonumber("0x52"))
            wait(0.1)
            keypress(tonumber("0x0D"))
            wait(0.1)
            keyrelease(tonumber("0x0D"))
        end
    end
    function driver.Character:jump()
        if isrbxactive and player.Character then
            keypress(0x20)
            wait(0.05)
            keyrelease(0x20)
        end
    end
    if rconsoleprint then
    rconsoleprint("")
        end
    function driver:find_element(text)
        if typeof(text) == "string" then
            for i, v in pairs(player.PlayerGui:GetDescendants()) do
                local x = nil
                pcall(
                    function()
                        if v.Text == text then
                            x = v
                        end
                    end
                )
                pcall(
                    function()
                        if v.PlaceholderText == text then
                            x = v
                        end
                    end
                )
                pcall(
                    function()
                        if v.ImageId == text then
                            x = v
                        end
                    end
                )
                pcall(
                    function()
                        if v.Image == text then
                            x = v
                        end
                    end
                )
                if x then
                    robloxdriver:debug("print", "Found element " .. text)
                    return x
                end
            end
            for i, v in pairs(player.PlayerGui:GetDescendants()) do
                local x = nil
                pcall(
                    function()
                        if v.Text:match(text) then
                            x = v
                        end
                    end
                )
                pcall(
                    function()
                        if v.PlaceholderText:match(text) then
                            x = v
                        end
                    end
                )
                pcall(
                    function()
                        if v.ImageId:match(text) then
                            x = v
                        end
                    end
                )
                pcall(
                    function()
                        if v.Image:match(text) then
                            x = v
                        end
                    end
                )
                if x then
                    robloxdriver:debug("print", "Found element " .. text)
                    return x
                end
            end
        else
            robloxdriver:debug("error", "String expected got " .. typeof(text) .. " when finding element")
        end
        return robloxdriver:debug("warn", "No Text or ImageID found when attempting to find element '" .. text .. "'.")
    end
    function driver:click(guiobject)
        if typeof(guiobject) ~= "Instance" then
            if isrbxactive then
                mouse1click()
                robloxdriver:debug("print", "Clicked mouse")
            end
        else
            if guiobject.ClassName:match("Button") and guiobject.Visible then
                for z, m in pairs(getconnections(guiobject.MouseButton1Click)) do
                    m:Fire()
                end
                for z, m in pairs(getconnections(guiobject.MouseButton1Down)) do
                    m:Fire()
                end
                robloxdriver:debug("print", "Successfully clicked " .. v.Name)
            else
                for i, v in pairs(guiobject.Parent:GetChildren()) do
                    if v.ClassName:match("Button") and v.Visible then
                        for z, m in pairs(getconnections(v.MouseButton1Click)) do
                            m:Fire()
                        end
                        for z, m in pairs(getconnections(v.MouseButton1Down)) do
                            m:Fire()
                        end
                        robloxdriver:debug("print", "Successfully clicked " .. v.Name)
                    end
                end
            end
        end
    end
    function driver:keypress(key, length)
        if not length then
            length = 0
        end
        if isrbxactive then
            keypress(tonumber(robloxdriver:indentifyMSDN(key)))
            wait(length)
            keyrelease(tonumber(robloxdriver:indentifyMSDN(key)))
        end
    end
    function driver:type_textbox(object, message)
        local z = 0
        if object then
            if typeof(object) == "Instance" then
                if object:IsA("TextBox") then
                    for i = 0, #message do
                        local x = tonumber("0.0" .. math.random(4, 9))
                        z = z + x
                        wait(x)
                        object.Text = string.sub(message, 1, i)
                    end
                end
            end
        end
        robloxdriver:debug("print", "Typed " .. message .. " in " .. z .. " seconds")
    end
    function driver:find_workspace_element(object, all)
        if typeof(object) == "string" then
            local objects = {}
            for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v.ClassName:match("Text") and not v:IsA("Texture") then
                    if v.Text == object then
                        if all then
                            table.insert(objects, v)
                        else
                            return v
                        end
                    end
                else
                    if v.Name == object then
                        if not all then
                            return v
                        else
                            table.insert(objects, v)
                        end
                    end
                end
            end
            for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v.ClassName:match("Text") and not v:IsA("Texture") then
                    if v.Text:match(object) then
                        if all then
                            table.insert(objects, v)
                        else
                            return v
                        end
                    end
                else
                    if v.Name:match(object) then
                        if not all then
                            return v
                        else
                            table.insert(objects, v)
                        end
                    end
                end
            end

            local function getobj(tablel)
                local tablell = 0
                for i, v in pairs(tablel) do
                    tablell = tablell + 1
                end
                return tablell
            end
            if not getobj(objects) then
                return robloxdriver:debug(
                    "warn",
                    "No Text or ImageID found when attempting to find element '" .. text .. "'."
                )
            else
                return objects
            end
        end
        -- robloxdriver:debug("error", "String expected got " .. typeof(text) .. " when finding element")
    end
    return driver
end

return robloxdriver
