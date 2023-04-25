dialogText = "" -- Here on top gay
function addButtonWithImage(image)
        dialogText = dialogText .. ("add_custom_button|Information|image:"..image..";image_size:400,260;width:0.19;|")
end
function addButtonWithIcon(text, buttonname, icon)
        dialogText = dialogText .. ("add_button_with_icon|"..buttonname.."|"..text.."|staticblueframe|"..icon.."||")
end
function addLabel(text, small)
        dialogText = dialogText .. ("add_label|"..small.."|"..text.."|left")
end
function addQuickExit()
	dialogText = dialogText .. ("add_quick_exit")
end
function addLabelWithIcon( text, tileid, type)
        if type == "LABEL_BIG" then
                dialogText = dialogText .. ("add_label_with_icon|big|" .. text .. "|left|" .. (tileid) .. "|\n")
        end
        if type == "LABEL_SMALL" then
                dialogText = dialogText ..("add_label_with_icon|small|" .. text .. "|left|".. (tileid) .."|\n")
     end
end

function addButton(buttonname, buttontext)
        dialogText = dialogText ..("add_button|" .. buttonname .. "|" .. buttontext .. "|noflags|0|0|\n");
end

function addTextBox(str)
        dialogText = dialogText ..("add_textbox|".. tostring(str) .. "|left|\n");
end

function addSpacer(type)
        if type == "SPACER_BIG" then
                dialogText = dialogText ..("add_spacer|big|\n");
        end
        if type == "SPACER_SMALL" then
                dialogText = dialogText ..("add_spacer|small|\n")
   end
end

function addCheckbox(checkboxname,qwe,checked)
if checked then 
                dialogText = dialogText ..("add_checkbox|" .. checkboxname .. "|" .. qwe .. "|1|\n")
else            
                dialogText = dialogText ..("add_checkbox|" .. checkboxname .. "|" .. qwe .. "|0|\n")
end
end

function endDialog(name, accept, nvm)
        dialogText = dialogText ..("end_dialog|" .. name .. "|" .. nvm .. "|" .. accept .. "|\n");
end

function addInputBox(name,  text, cont, size)
        dialogText = dialogText ..("add_text_input|" ..name .. "|" .. text .. "|".. cont..  "|" .. (size) .. "|\n")
end
