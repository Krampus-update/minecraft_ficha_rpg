require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_item_slot()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("item_slot");
    obj:setWidth(36);
    obj:setHeight(36);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setStyle("stretch");
    obj.image1:setField("slot");
    obj.image1:setName("image1");
    obj.image1:setMargins({left=1, right=3, top=1, bottom=3});
    obj.image1:setWidth(32);
    obj.image1:setHeight(32);
    obj.image1:setSRC("/item/void.png");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setTop(20);
    obj.label1:setWidth(32);
    obj.label1:setText("69");
    obj.label1:setFontColor("#3D3D3F");
    obj.label1:setFontFamily("Minecraft");
    obj.label1:setField("num");
    obj.label1:setName("label1");
    obj.label1:setFontSize(16);
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setAutoSize(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setTop(18);
    obj.label2:setWidth(30);
    obj.label2:setText("69");
    obj.label2:setFontColor("#FBFBFB");
    obj.label2:setFontFamily("Minecraft");
    obj.label2:setField("num");
    obj.label2:setName("label2");
    obj.label2:setFontSize(16);
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setAutoSize(true);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setWidth(34);
    obj.button1:setHeight(34);
    obj.button1:setOpacity(0);
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onStartDrag",
        function (drag, x, y, event)
            drag:addData("slot", sheet.slot);
            			drag:addData("valor", sheet.num);
            			sheet.num = "";
            			sheet.slot = "/item/void.png";
        end);

    obj._e_event1 = obj.button1:addEventListener("onStartDrop",
        function (drop, x, y, drag, event)
            if sheet.slot == "/item/void.png" then
            				drop:addAction("slot", 
            				function(item)
            					sheet.slot = item;
            					sheet.num = drag:getData("valor");
            				end);
            			end;
        end);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (event)
            if sheet.slot == "/item/void.png" then
            				Dialogs.choose("Escrever o nome ou o Link", {"Nome", "Link"}, 
            				function(selected,opc)
            					if selected then
            						if opc == 1 then
            							Dialogs.inputQuery("nome do item","","",
            							function(slot)
            								sheet.slot = "/item/" ..slot..".png";
            								Dialogs.inputQuery("escreva o numero de itens","","",
            								function(numero)
            									num = tonumber(numero);
            									if num == 1 then
            										sheet.num = "";
            									elseif num == 0 then
            										sheet.num = "";
            										sheet.slot = "/item/void.png";
            									else
            										sheet.num = num;
            									end
            								end,
            								function()
            									sheet.num = "";
            								end,
            								true);
            							end);
            						else
            							Dialogs.selectImageURL("/item/void.png",
            							function(url)
            								sheet.slot = url;
            								Dialogs.inputQuery("escreva o numero de itens","","",
            								function(numero)
            									num = tonumber(numero);
            									if num == 1 then
            										sheet.num = "";
            									elseif num == 0 then
            										sheet.num = "";
            										sheet.slot = "/item/void.png";
            									else
            										sheet.num = num;
            									end
            								end,
            								function()
            									sheet.num = "";
            								end,
            								true);
            							end);
            						end
            					end
            				end);
            			else
            				Dialogs.inputQuery("escreva o numero de itens","","",
            				function(numero)
            					num = tonumber(numero);
            					if num == 1 then
            						sheet.num = "";
            					elseif num == 0 then
            						sheet.num = "";
            						sheet.slot = "/item/void.png";
            					else
            						sheet.num = num;
            					end
            				end,
            				function()
            					sheet.num = "";
            				end,
            				true);
            			end
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newitem_slot()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_item_slot();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _item_slot = {
    newEditor = newitem_slot, 
    new = newitem_slot, 
    name = "item_slot", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

item_slot = _item_slot;
Firecast.registrarForm(_item_slot);

return _item_slot;
