-- Script by KimPanzi#9709
-- DM For questions

local TELEPHONE_X = 0 -- do not touch
local TELEPHONE_Y = 0 -- do not touch

local DLS_PRICE = 110000 -- dls price in telephone
-- how much dls you want to buy, leave it zero if you want to consume all of your gems

local DONE = false -- do not touch

function Hook(varlist)
   if varlist[0]:find("OnConsoleMessage") and varlist[1]:find("Tax Credit") then
      return true
   end

   if varlist[0]:find("OnDialogRequest") and varlist[1]:find("Diamond Lock") then
      return true
   end

   if varlist[0]:find("OnDialogRequest") and varlist[1]:find("Telephone") then
      if TELEPHONE_X == 0 and TELEPHONE_Y == 0 then
         TELEPHONE_X = varlist[1]:match('embed_data|x|(%d+)')
         TELEPHONE_Y = varlist[1]:match('embed_data|y|(%d+)')
      end

      return true
   end
end

AddCallback("?", "OnVarlist", Hook)

local function Dialog()
   local var = {}
   var[0] = "OnDialogRequest"
   var[1] = "set_default_color|`o\nadd_label_with_icon|big|`2KimPanzi#9709 Auto-Buy DLS``|left|1796|\nadd_textbox|Wrench the telephone that you want to use.|\nend_dialog|||Continue|"
   var.netid = -1
   SendVarlist(var)
end

local function GetResult()
   if HOW_MUCH_DLS ~= 0 then
      return HOW_MUCH_DLS
   else
      return GetLocal().gems // DLS_PRICE
   end
end

Dialog()

while true do
   if DONE then return end

   if (TELEPHONE_X ~= 0  and TELEPHONE_Y ~= 0) then
      local result = GetResult()

      for i = 1, result do
         if GetItemCount(1796) >= 100 then
            SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..TELEPHONE_X.."|\ny|"..TELEPHONE_Y.."|\nbuttonClicked|bglconvert")
            Sleep(100)
         end

         SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..TELEPHONE_X.."|\ny|"..TELEPHONE_Y.."|\nbuttonClicked|dlconvert")

         Sleep(100)
      end

      MessageBox("WARNING", "Done! Successfully purchased "..result.." Diamond Locks")
      RemoveCallback("?")
      DONE = true
   end
end
