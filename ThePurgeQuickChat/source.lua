--[[

Copyright 2022, RobloxArchiver/PurgeLLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

]]

getfenv().purgeConfig = {
    keybind = "Minus" -- Default bind.
};

getfenv().internalConfig = {
    releaseVer = "0.1-QC"
};

--> Chat Function
local function Chat(msg)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All");
end;

--> Purgelib
local Purge = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxArchiver/cc77cf7e-a9ae-407b-b0f9-066000ddd648/main/5bc53455-1a45-4a19-bd89-890c2ccaa3f6.lua"))();
local Library = Purge.new(false, "The Purge " .. getfenv().internalConfig.releaseVer);
Library.ChangeToggleKey(Enum.KeyCode[getfenv().purgeConfig.keybind]);

--> Categories
local QuickChatCat = Library:Category("Quick-Chat");

--> Welcome Category
local QuickChat = QuickChatCat:Sector("Keyboard");
QuickChat:Cheat("Textbox", "Type to Send", function(text)
    Chat(text);
end, {placeholder = "Type Here!"});
local QuickChats = QuickChatCat:Sector("Quick Chat");

local function QuickChat(name, chatMsg)
    QuickChats:Cheat("Button", name, function()
        Chat(chatMsg)
    end, {text = name})
end;

QuickChat("hi", "hi!")
