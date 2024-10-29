require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_fmr_mine()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("Krampus.minecraft");
    obj:setTitle("Ficha de Explorador (Minecraft)");
    obj:setName("fmr_mine");

    obj.frmTemplatesMinecraft = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplatesMinecraft:setParent(obj);
    obj.frmTemplatesMinecraft:setName("frmTemplatesMinecraft");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setFrameStyle("/ficha_explorador/frames/inv_white.xml");
    obj.layout1:setPadding({left=13,right=13,top=13,bottom=13});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setName("layout2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setLeft(102);
    obj.image1:setTop(4);
    obj.image1:setHeight(135);
    obj.image1:setWidth(135);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/img/avatar.png");
    obj.image1.animate = true;
    obj.image1:setName("image1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setTop(184);
    obj.layout3:setLeft(20);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(200);
    obj.layout3:setFrameStyle("/ficha_explorador/frames/inv_white.xml");
    obj.layout3:setPadding({left=13,right=13,top=13,bottom=13});
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(34);
    obj.layout4:setName("layout4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout4);
    obj.label1:setAutoSize(true);
    obj.label1:setText("Nome: ");
    obj.label1:setAlign("left");
    obj.label1:setName("label1");
    obj.label1:setFontColor("White");
    obj.label1:setFontFamily("Minecraft");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setAlign("right");
    obj.edit1:setHeight(30);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    obj.edit1:setFontFamily("Minecraft");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(12);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(34);
    obj.layout5:setName("layout5");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setAutoSize(true);
    obj.label2:setText("Altura: ");
    obj.label2:setAlign("left");
    obj.label2:setName("label2");
    obj.label2:setFontColor("White");
    obj.label2:setFontFamily("Minecraft");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setAlign("right");
    obj.edit2:setHeight(30);
    obj.edit2:setField("altura");
    obj.edit2:setType("number");
    obj.edit2:setHorzTextAlign("trailing");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    obj.edit2:setFontFamily("Minecraft");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(12);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(34);
    obj.layout6:setName("layout6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setAutoSize(true);
    obj.label3:setText("Peso: ");
    obj.label3:setAlign("left");
    obj.label3:setName("label3");
    obj.label3:setFontColor("White");
    obj.label3:setFontFamily("Minecraft");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setAlign("right");
    obj.edit3:setHeight(30);
    obj.edit3:setField("peso");
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("trailing");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("White");
    obj.edit3:setFontFamily("Minecraft");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(12);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout3);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(34);
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAutoSize(true);
    obj.label4:setText("Idade: ");
    obj.label4:setAlign("left");
    obj.label4:setName("label4");
    obj.label4:setFontColor("White");
    obj.label4:setFontFamily("Minecraft");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setAlign("right");
    obj.edit4:setHeight(30);
    obj.edit4:setField("idade");
    obj.edit4:setType("number");
    obj.edit4:setHorzTextAlign("trailing");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("White");
    obj.edit4:setFontFamily("Minecraft");
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(12);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout3);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(34);
    obj.layout8:setName("layout8");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout8);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setHeight(30);
    obj.comboBox1:setField("tendencia");
    obj.comboBox1:setItems({'Leal Bom','Neutro Bom','Caotico Bom','Leal Neutro','Neutro','Caotico Neutro','Leal Mal','Neutro Mal','Caotico Mal'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontColor("White");
    obj.comboBox1:setFontFamily("Minecraft");
    obj.comboBox1:setTransparent(true);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setTop(30);
    obj.layout9:setLeft(340);
    obj.layout9:setWidth(450);
    obj.layout9:setHeight(480);
    obj.layout9:setFrameStyle("/ficha_explorador/frames/inv_white.xml");
    obj.layout9:setName("layout9");

    obj.recordList1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.recordList1:setParent(obj.layout9);
    obj.recordList1:setField("inventario");
    obj.recordList1:setTemplateForm("slot_inv");
    obj.recordList1:setAlign("client");
    obj.recordList1:setAutoHeight(true);
    obj.recordList1:setMinQt(36);
    obj.recordList1:setName("recordList1");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj);
    obj.layout10:setName("layout10");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout10);
    obj.label5:setField("vida");
    obj.label5:setOpacity(0);
    obj.label5:setName("label5");
    obj.label5:setFontColor("White");
    obj.label5:setFontFamily("Minecraft");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout10);
    obj.dataLink1:setField("vida");
    obj.dataLink1:setName("dataLink1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout10);
    obj.label6:setField("fome");
    obj.label6:setOpacity(0);
    obj.label6:setName("label6");
    obj.label6:setFontColor("White");
    obj.label6:setFontFamily("Minecraft");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setField("fome");
    obj.dataLink2:setName("dataLink2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout10);
    obj.label7:setField("saturacao");
    obj.label7:setOpacity(0);
    obj.label7:setName("label7");
    obj.label7:setFontColor("White");
    obj.label7:setFontFamily("Minecraft");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setField("saturacao");
    obj.dataLink3:setName("dataLink3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout10);
    obj.label8:setField("percent");
    obj.label8:setOpacity(0);
    obj.label8:setName("label8");
    obj.label8:setFontColor("White");
    obj.label8:setFontFamily("Minecraft");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setField("percent");
    obj.dataLink4:setName("dataLink4");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            local lp = tonumber(sheet.vida)
            				if 0 > lp then
            					sheet.vida = 0;
            				end;
            				sheet.vid = "/heart/" ..lp.. ".png";
            				local pj = Firecast.getPersonagemDe(sheet);
            				pj.dono:requestSetBarValue(1, lp);
        end);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            hunger = tonumber(sheet.fome);
            				if sat > hunger then
            					sat = hunger
            				end;
            				if 0 > hunger then
            					sheet.fome = 0;
            				end;
            				sheet.hun = "/hunger/" ..hunger.. ".png";
            				local pj = Firecast.getPersonagemDe(sheet);
            				pj.dono:requestSetBarValue(2, hunger);
            				pj.dono:requestSetBarValue(3, sat);
        end);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            sat = tonumber(sheet.saturacao);
            				if sat > hunger then
            					sat = hunger
            				end;
            				if 0 > sat then
            					sheet.saturacao = 0;
            				end;
            				sheet.sat = "Ficha/saturation/" ..sat.. ".png";
            				local pj = Firecast.getPersonagemDe(sheet);
            				pj.dono:requestSetBarValue(2, hunger);
            				pj.dono:requestSetBarValue(3, sat);
        end);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.experiencia.width = sheet.percent;
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
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

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.recordList1 ~= nil then self.recordList1:destroy(); self.recordList1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.frmTemplatesMinecraft ~= nil then self.frmTemplatesMinecraft:destroy(); self.frmTemplatesMinecraft = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfmr_mine()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_fmr_mine();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _fmr_mine = {
    newEditor = newfmr_mine, 
    new = newfmr_mine, 
    name = "fmr_mine", 
    dataType = "Krampus.minecraft", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Ficha de Explorador (Minecraft)", 
    description=""};

fmr_mine = _fmr_mine;
Firecast.registrarForm(_fmr_mine);
Firecast.registrarDataType(_fmr_mine);

return _fmr_mine;
