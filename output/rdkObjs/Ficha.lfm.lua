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

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1242);
    obj.image1:setHeight(534);
    obj.image1:setSRC("/Ficha/img/inventory.png");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(20);
    obj.layout1:setTop(400);
    obj.layout1:setHeight(36);
    obj.layout1:setWidth(360);
    obj.layout1:setName("layout1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout1);
    obj.image2:setHeight(16);
    obj.image2:setWidth(160);
    obj.image2:setLeft(0);
    obj.image2:setField("prt");
    obj.image2:setSRC("/Ficha/armor/0.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout1);
    obj.image3:setTop(20);
    obj.image3:setHeight(16);
    obj.image3:setWidth(160);
    obj.image3:setField("vid");
    obj.image3:setSRC("/Ficha/heart/0.png");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout1);
    obj.image4:setTop(20);
    obj.image4:setLeft(200);
    obj.image4:setHeight(16);
    obj.image4:setWidth(160);
    obj.image4:setField("hun");
    obj.image4:setSRC("/Ficha/hunger/0.png");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout1);
    obj.image5:setTop(20);
    obj.image5:setLeft(200);
    obj.image5:setHeight(16);
    obj.image5:setWidth(160);
    obj.image5:setField("sat");
    obj.image5:setOpacity(0.7);
    obj.image5:setSRC("/Ficha/saturation/0.png");
    obj.image5:setName("image5");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setLeft(20);
    obj.layout2:setTop(420);
    obj.layout2:setWidth(366);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(2);
    obj.label1:setTop(4);
    obj.label1:setFontSize(18);
    obj.label1:setFontColor("#204000");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWidth(366);
    obj.label1:setField("lvl");
    obj.label1:setName("label1");
    obj.label1:setFontFamily("Minecraft");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setTop(2);
    obj.label2:setWidth(366);
    obj.label2:setField("lvl");
    obj.label2:setName("label2");
    obj.label2:setFontSize(18);
    obj.label2:setFontColor("#7FFF00");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontFamily("Minecraft");

    obj.experiencia = GUI.fromHandle(_obj_newObject("layout"));
    obj.experiencia:setParent(obj);
    obj.experiencia:setName("experiencia");
    obj.experiencia:setLeft(20);
    obj.experiencia:setTop(442);
    obj.experiencia:setWidth(366);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.experiencia);
    obj.image6:setWidth(366);
    obj.image6:setHeight(10);
    obj.image6:setSRC("/Ficha/img/xp_bar_full.png");
    obj.image6:setName("image6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setLeft(20);
    obj.layout3:setTop(30);
    obj.layout3:setHeight(144);
    obj.layout3:setWidth(240);
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setCursor("handPoint");
    obj.button1:setOpacity(0);
    obj.button1:setTop(3);
    obj.button1:setName("button1");
    obj.button1:setHeight(30);
    obj.button1:setWidth(20);
    obj.button1:setLeft(3);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setCursor("handPoint");
    obj.button2:setOpacity(0);
    obj.button2:setTop(3);
    obj.button2:setName("button2");
    obj.button2:setHeight(30);
    obj.button2:setWidth(20);
    obj.button2:setLeft(62);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setCursor("handPoint");
    obj.button3:setOpacity(0);
    obj.button3:setTop(39);
    obj.button3:setName("button3");
    obj.button3:setHeight(30);
    obj.button3:setWidth(20);
    obj.button3:setLeft(3);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setCursor("handPoint");
    obj.button4:setOpacity(0);
    obj.button4:setTop(39);
    obj.button4:setName("button4");
    obj.button4:setHeight(30);
    obj.button4:setWidth(20);
    obj.button4:setLeft(62);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setCursor("handPoint");
    obj.button5:setOpacity(0);
    obj.button5:setTop(75);
    obj.button5:setName("button5");
    obj.button5:setHeight(30);
    obj.button5:setWidth(20);
    obj.button5:setLeft(3);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setCursor("handPoint");
    obj.button6:setOpacity(0);
    obj.button6:setTop(75);
    obj.button6:setName("button6");
    obj.button6:setHeight(30);
    obj.button6:setWidth(20);
    obj.button6:setLeft(62);

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout3);
    obj.button7:setCursor("handPoint");
    obj.button7:setOpacity(0);
    obj.button7:setTop(111);
    obj.button7:setName("button7");
    obj.button7:setHeight(30);
    obj.button7:setWidth(20);
    obj.button7:setLeft(3);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout3);
    obj.button8:setCursor("handPoint");
    obj.button8:setOpacity(0);
    obj.button8:setTop(111);
    obj.button8:setName("button8");
    obj.button8:setHeight(30);
    obj.button8:setWidth(20);
    obj.button8:setLeft(62);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout3);
    obj.image7:setTop(2);
    obj.image7:setField("head");
    obj.image7:setSRC("/Ficha/img/Armor/empty_armor_slot_helmet.png");
    obj.image7:setName("image7");
    obj.image7:setHeight(32);
    obj.image7:setWidth(32);
    obj.image7:setLeft(26);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout3);
    obj.image8:setTop(38);
    obj.image8:setField("shoulders");
    obj.image8:setSRC("/Ficha/img/Armor/empty_armor_slot_chestplate.png");
    obj.image8:setName("image8");
    obj.image8:setHeight(32);
    obj.image8:setWidth(32);
    obj.image8:setLeft(26);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout3);
    obj.image9:setTop(74);
    obj.image9:setField("knees");
    obj.image9:setSRC("/Ficha/img/Armor/empty_armor_slot_leggings.png");
    obj.image9:setName("image9");
    obj.image9:setHeight(32);
    obj.image9:setWidth(32);
    obj.image9:setLeft(26);

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout3);
    obj.image10:setTop(108);
    obj.image10:setField("toes");
    obj.image10:setSRC("/Ficha/img/Armor/empty_armor_slot_boots.png");
    obj.image10:setName("image10");
    obj.image10:setHeight(32);
    obj.image10:setWidth(32);
    obj.image10:setLeft(26);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout3);
    obj.image11:setLeft(102);
    obj.image11:setTop(4);
    obj.image11:setHeight(135);
    obj.image11:setWidth(135);
    obj.image11:setField("avatar");
    obj.image11:setEditable(true);
    obj.image11:setStyle("autoFit");
    obj.image11:setSRC("Ficha/img/avatar.png");
    obj.image11.animate = true;
    obj.image11:setName("image11");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj);
    obj.layout4:setTop(184);
    obj.layout4:setLeft(20);
    obj.layout4:setWidth(300);
    obj.layout4:setHeight(200);
    obj.layout4:setName("layout4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setLeft(60);
    obj.edit1:setTop(9);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(20);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    obj.edit1:setFontFamily("Minecraft");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(12);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setTop(29);
    obj.edit2:setLeft(75);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(20);
    obj.edit2:setType("float");
    obj.edit2:setHorzTextAlign("trailing");
    obj.edit2:setField("altura");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    obj.edit2:setFontFamily("Minecraft");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(12);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTop(29);
    obj.edit3:setLeft(175);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(20);
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("trailing");
    obj.edit3:setField("peso");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("White");
    obj.edit3:setFontFamily("Minecraft");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(12);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTop(49);
    obj.edit4:setLeft(50);
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(20);
    obj.edit4:setType("number");
    obj.edit4:setHorzTextAlign("trailing");
    obj.edit4:setField("idade");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("White");
    obj.edit4:setFontFamily("Minecraft");
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(12);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setTop(69);
    obj.edit5:setLeft(110);
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(20);
    obj.edit5:setType("number");
    obj.edit5:setHorzTextAlign("trailing");
    obj.edit5:setField("busto");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("White");
    obj.edit5:setFontFamily("Minecraft");
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(12);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setTop(69);
    obj.edit6:setLeft(145);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(20);
    obj.edit6:setType("number");
    obj.edit6:setHorzTextAlign("trailing");
    obj.edit6:setField("cintura");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("White");
    obj.edit6:setFontFamily("Minecraft");
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(12);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setTop(69);
    obj.edit7:setLeft(175);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(20);
    obj.edit7:setType("number");
    obj.edit7:setHorzTextAlign("trailing");
    obj.edit7:setField("quadril");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("White");
    obj.edit7:setFontFamily("Minecraft");
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(12);

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout4);
    obj.comboBox1:setTop(88);
    obj.comboBox1:setLeft(75);
    obj.comboBox1:setField("tendencia");
    obj.comboBox1:setItems({'Leal Bom','Neutro Bom','Caotico Bom','Leal Neutro','Neutro','Caotico Neutro','Leal Mal','Neutro Mal','Caotico Mal'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontColor("White");
    obj.comboBox1:setFontFamily("Minecraft");
    obj.comboBox1:setTransparent(true);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setTop(109);
    obj.edit8:setLeft(90);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(20);
    obj.edit8:setField("sexualidade");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("White");
    obj.edit8:setFontFamily("Minecraft");
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(12);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout4);
    obj.edit9:setTop(128);
    obj.edit9:setLeft(80);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(20);
    obj.edit9:setType("number");
    obj.edit9:setHorzTextAlign("trailing");
    obj.edit9:setField("esmeraldas");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("White");
    obj.edit9:setFontFamily("Minecraft");
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(12);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout4);
    obj.textEditor1:setTop(170);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setWidth(280);
    obj.textEditor1:setHeight(80);
    obj.textEditor1:setField("personalidade");
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setFontColor("White");
    obj.textEditor1:setFontFamily("Minecraft");
    obj.textEditor1:setTransparent(true);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj);
    obj.layout5:setTop(30);
    obj.layout5:setLeft(400);
    obj.layout5:setWidth(350);
    obj.layout5:setHeight(450);
    obj.layout5:setName("layout5");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout5);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(20);
    obj.textEditor2:setWidth(340);
    obj.textEditor2:setHeight(225);
    obj.textEditor2:setField("background");
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setFontColor("White");
    obj.textEditor2:setFontFamily("Minecraft");
    obj.textEditor2:setTransparent(true);

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout5);
    obj.comboBox2:setField("skill_01");
    obj.comboBox2:setTop(250);
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox2:setFontSize(14);
    obj.comboBox2:setWidth(150);
    obj.comboBox2:setFontColor("White");
    obj.comboBox2:setFontFamily("Minecraft");
    obj.comboBox2:setTransparent(true);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout5);
    obj.edit10:setField("skill_1");
    obj.edit10:setTop(250);
    obj.edit10:setName("edit10");
    obj.edit10:setLeft(150);
    obj.edit10:setWidth(100);
    obj.edit10:setFontSize(14);
    obj.edit10:setFontColor("White");
    obj.edit10:setFontFamily("Minecraft");
    obj.edit10:setTransparent(true);

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout5);
    obj.comboBox3:setField("skill_02");
    obj.comboBox3:setTop(280);
    obj.comboBox3:setName("comboBox3");
    obj.comboBox3:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox3:setFontSize(14);
    obj.comboBox3:setWidth(150);
    obj.comboBox3:setFontColor("White");
    obj.comboBox3:setFontFamily("Minecraft");
    obj.comboBox3:setTransparent(true);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout5);
    obj.edit11:setField("skill_2");
    obj.edit11:setTop(280);
    obj.edit11:setName("edit11");
    obj.edit11:setLeft(150);
    obj.edit11:setWidth(100);
    obj.edit11:setFontSize(14);
    obj.edit11:setFontColor("White");
    obj.edit11:setFontFamily("Minecraft");
    obj.edit11:setTransparent(true);

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout5);
    obj.comboBox4:setField("skill_03");
    obj.comboBox4:setTop(310);
    obj.comboBox4:setName("comboBox4");
    obj.comboBox4:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox4:setFontSize(14);
    obj.comboBox4:setWidth(150);
    obj.comboBox4:setFontColor("White");
    obj.comboBox4:setFontFamily("Minecraft");
    obj.comboBox4:setTransparent(true);

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout5);
    obj.edit12:setField("skill_3");
    obj.edit12:setTop(310);
    obj.edit12:setName("edit12");
    obj.edit12:setLeft(150);
    obj.edit12:setWidth(100);
    obj.edit12:setFontSize(14);
    obj.edit12:setFontColor("White");
    obj.edit12:setFontFamily("Minecraft");
    obj.edit12:setTransparent(true);

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout5);
    obj.comboBox5:setField("skill_04");
    obj.comboBox5:setTop(340);
    obj.comboBox5:setName("comboBox5");
    obj.comboBox5:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox5:setFontSize(14);
    obj.comboBox5:setWidth(150);
    obj.comboBox5:setFontColor("White");
    obj.comboBox5:setFontFamily("Minecraft");
    obj.comboBox5:setTransparent(true);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout5);
    obj.edit13:setField("skill_4");
    obj.edit13:setTop(340);
    obj.edit13:setName("edit13");
    obj.edit13:setLeft(150);
    obj.edit13:setWidth(100);
    obj.edit13:setFontSize(14);
    obj.edit13:setFontColor("White");
    obj.edit13:setFontFamily("Minecraft");
    obj.edit13:setTransparent(true);

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout5);
    obj.comboBox6:setField("skill_05");
    obj.comboBox6:setTop(370);
    obj.comboBox6:setName("comboBox6");
    obj.comboBox6:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox6:setFontSize(14);
    obj.comboBox6:setWidth(150);
    obj.comboBox6:setFontColor("White");
    obj.comboBox6:setFontFamily("Minecraft");
    obj.comboBox6:setTransparent(true);

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout5);
    obj.edit14:setField("skill_5");
    obj.edit14:setTop(370);
    obj.edit14:setName("edit14");
    obj.edit14:setLeft(150);
    obj.edit14:setWidth(100);
    obj.edit14:setFontSize(14);
    obj.edit14:setFontColor("White");
    obj.edit14:setFontFamily("Minecraft");
    obj.edit14:setTransparent(true);

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout5);
    obj.comboBox7:setField("skill_06");
    obj.comboBox7:setTop(400);
    obj.comboBox7:setName("comboBox7");
    obj.comboBox7:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox7:setFontSize(14);
    obj.comboBox7:setWidth(150);
    obj.comboBox7:setFontColor("White");
    obj.comboBox7:setFontFamily("Minecraft");
    obj.comboBox7:setTransparent(true);

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout5);
    obj.edit15:setField("skill_6");
    obj.edit15:setTop(400);
    obj.edit15:setName("edit15");
    obj.edit15:setLeft(150);
    obj.edit15:setWidth(100);
    obj.edit15:setFontSize(14);
    obj.edit15:setFontColor("White");
    obj.edit15:setFontFamily("Minecraft");
    obj.edit15:setTransparent(true);

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout5);
    obj.comboBox8:setField("skill_07");
    obj.comboBox8:setTop(430);
    obj.comboBox8:setName("comboBox8");
    obj.comboBox8:setItems({'trading','resource gathering','mining','exploring','farming','combat','taming'});
    obj.comboBox8:setFontSize(14);
    obj.comboBox8:setWidth(150);
    obj.comboBox8:setFontColor("White");
    obj.comboBox8:setFontFamily("Minecraft");
    obj.comboBox8:setTransparent(true);

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setField("skill_7");
    obj.edit16:setTop(430);
    obj.edit16:setName("edit16");
    obj.edit16:setLeft(150);
    obj.edit16:setWidth(100);
    obj.edit16:setFontSize(14);
    obj.edit16:setFontColor("White");
    obj.edit16:setFontFamily("Minecraft");
    obj.edit16:setTransparent(true);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj);
    obj.layout6:setTop(30);
    obj.layout6:setLeft(770);
    obj.layout6:setWidth(450);
    obj.layout6:setHeight(480);
    obj.layout6:setName("layout6");

    obj.ender_chest = GUI.fromHandle(_obj_newObject("recordList"));
    obj.ender_chest:setParent(obj.layout6);
    obj.ender_chest:setTop(35);
    obj.ender_chest:setLeft(15);
    obj.ender_chest:setWidth(330);
    obj.ender_chest:setName("ender_chest");
    obj.ender_chest:setField("ender");
    obj.ender_chest:setTemplateForm("item_slot");
    obj.ender_chest:setAutoHeight(true);
    obj.ender_chest:setLayout("horizontalTiles");
    obj.ender_chest:setMinQt(27);

    obj.inventory = GUI.fromHandle(_obj_newObject("recordList"));
    obj.inventory:setParent(obj.layout6);
    obj.inventory:setTop(167);
    obj.inventory:setLeft(15);
    obj.inventory:setWidth(330);
    obj.inventory:setName("inventory");
    obj.inventory:setField("inv");
    obj.inventory:setTemplateForm("item_slot");
    obj.inventory:setAutoHeight(true);
    obj.inventory:setLayout("horizontalTiles");
    obj.inventory:setMinQt(27);

    obj.hotbar = GUI.fromHandle(_obj_newObject("recordList"));
    obj.hotbar:setParent(obj.layout6);
    obj.hotbar:setTop(283);
    obj.hotbar:setLeft(15);
    obj.hotbar:setWidth(330);
    obj.hotbar:setName("hotbar");
    obj.hotbar:setField("bar");
    obj.hotbar:setTemplateForm("item_slot");
    obj.hotbar:setAutoHeight(true);
    obj.hotbar:setLayout("horizontalTiles");
    obj.hotbar:setMinQt(9);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj);
    obj.layout7:setName("layout7");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout7);
    obj.label3:setField("vida");
    obj.label3:setOpacity(0);
    obj.label3:setName("label3");
    obj.label3:setFontColor("White");
    obj.label3:setFontFamily("Minecraft");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setField("fome");
    obj.label4:setOpacity(0);
    obj.label4:setName("label4");
    obj.label4:setFontColor("White");
    obj.label4:setFontFamily("Minecraft");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout7);
    obj.label5:setField("saturacao");
    obj.label5:setOpacity(0);
    obj.label5:setName("label5");
    obj.label5:setFontColor("White");
    obj.label5:setFontFamily("Minecraft");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setField("protecao");
    obj.label6:setOpacity(0);
    obj.label6:setName("label6");
    obj.label6:setFontColor("White");
    obj.label6:setFontFamily("Minecraft");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setField("helmet");
    obj.label7:setOpacity(0);
    obj.label7:setName("label7");
    obj.label7:setFontColor("White");
    obj.label7:setFontFamily("Minecraft");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setField("chestplate");
    obj.label8:setOpacity(0);
    obj.label8:setName("label8");
    obj.label8:setFontColor("White");
    obj.label8:setFontFamily("Minecraft");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setField("leggings");
    obj.label9:setOpacity(0);
    obj.label9:setName("label9");
    obj.label9:setFontColor("White");
    obj.label9:setFontFamily("Minecraft");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setField("boots");
    obj.label10:setOpacity(0);
    obj.label10:setName("label10");
    obj.label10:setFontColor("White");
    obj.label10:setFontFamily("Minecraft");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setField("slot");
    obj.label11:setOpacity(0);
    obj.label11:setName("label11");
    obj.label11:setFontColor("White");
    obj.label11:setFontFamily("Minecraft");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout7);
    obj.label12:setField("percent");
    obj.label12:setOpacity(0);
    obj.label12:setName("label12");
    obj.label12:setFontColor("White");
    obj.label12:setFontFamily("Minecraft");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("vida");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("fome");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("saturacao");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("protecao");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("helmet");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("chestplate");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("leggings");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("boots");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("percent");
    obj.dataLink9:setName("dataLink9");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            sheet.helmet = (tonumber(sheet.helmet) or 0) - 1;
            		if 1 > sheet.helmet then
            		sheet.helmet = 1;
            		end;
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            sheet.helmet = (tonumber(sheet.helmet) or 0) + 1;
            		if sheet.helmet > 8 then
            		sheet.helmet = 8;
            		end;
        end);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (event)
            sheet.chestplate = (tonumber(sheet.chestplate) or 0)  - 1;
            		if 1 > sheet.chestplate then
            		sheet.chestplate = 1;
            		end;
        end);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (event)
            sheet.chestplate = (tonumber(sheet.chestplate) or 0) + 1;
            		if sheet.chestplate > 8 then
            		sheet.chestplate = 8;
            		end;
        end);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (event)
            sheet.leggings = (tonumber(sheet.leggings) or 0) - 1;
            		if 1 > sheet.leggings then
            		sheet.leggings = 1;
            		end;
        end);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (event)
            sheet.leggings = (tonumber(sheet.leggings) or 0) + 1;
            		if sheet.leggings > 7 then
            		sheet.leggings = 7;
            		end;
        end);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (event)
            sheet.boots = (tonumber(sheet.boots) or 0) - 1;
            		if 1 > sheet.boots then
            		sheet.boots = 1;
            		end;
        end);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (event)
            sheet.boots = (tonumber(sheet.boots) or 0) + 1;
            		if sheet.boots > 7 then
            		sheet.boots = 7;
            		end;
        end);

    obj._e_event8 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            local lp = tonumber(sheet.vida)
            			if 0 > lp then
            				sheet.vida = 0;
            			end;
            			sheet.vid = "/Ficha/heart/" ..lp.. ".png";
            			local pj = Firecast.getPersonagemDe(sheet);
            			pj.dono:requestSetBarValue(1, lp);
        end);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            hunger = tonumber(sheet.fome);
            			if sat > hunger then
            				sat = hunger
            			end;
            			if 0 > hunger then
            				sheet.fome = 0;
            			end;
            			sheet.hun = "/Ficha/hunger/" ..hunger.. ".png";
            			local pj = Firecast.getPersonagemDe(sheet);
            			pj.dono:requestSetBarValue(2, hunger);
            			pj.dono:requestSetBarValue(3, sat);
        end);

    obj._e_event10 = obj.dataLink3:addEventListener("onChange",
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

    obj._e_event11 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            local prot = tonumber(sheet.protecao)
            			sheet.prt = "/Ficha/armor/" ..prot.. ".png";
        end);

    obj._e_event12 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            helmets = {
            				"empty_armor_slot_helmet.png",
            				"leather_helmet.png",
            				"golden_helmet.png",
            				"chainmail_helmet.png",
            				"iron_helmet.png",
            				"diamond_helmet.png",
            				"netherite_helmet.png",
            				"turtle_helmet.png"
            			};
            			protecao_capacete = {
            				0,
            				1,
            				2,
            				2,
            				2,
            				3,
            				3,
            				2
            			}
            			for i=1, 8,1 do
            				helmets[i] = "/Ficha/img/Armor/"..helmets[i];
            			end
            			sheet.head = helmets[tonumber(sheet.helmet)]
            			sheet.protecao = protecao_capacete[tonumber(sheet.helmet) or 0]+protecao_peitoral[tonumber(sheet.chestplate) or 0]+protecao_calca[tonumber(sheet.leggings) or 0]+protecao_botas[tonumber(sheet.boots) or 0];
        end);

    obj._e_event13 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            chestplates = {
            				"empty_armor_slot_chestplate.png",
            				"leather_chestplate.png",
            				"golden_chestplate.png",
            				"chainmail_chestplate.png",
            				"iron_chestplate.png",
            				"diamond_chestplate.png",
            				"netherite_chestplate.png",
            				"elytra.png"
            			};
            			protecao_peitoral = {
            				0,
            				3,
            				5,
            				5,
            				6,
            				8,
            				8,
            				0
            			}
            			for i=1,8,1 do
            				chestplates[i] = "/Ficha/img/Armor/"..chestplates[i];
            			end;
            			sheet.shoulders = chestplates[tonumber(sheet.chestplate)]
            			sheet.protecao = protecao_capacete[tonumber(sheet.helmet) or 0]+protecao_peitoral[tonumber(sheet.chestplate) or 0]+protecao_calca[tonumber(sheet.leggings) or 0]+protecao_botas[tonumber(sheet.boots) or 0];
        end);

    obj._e_event14 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            leggingss = {
            				"empty_armor_slot_leggings.png",
            				"leather_leggings.png",
            				"golden_leggings.png",
            				"chainmail_leggings.png",
            				"iron_leggings.png",
            				"diamond_leggings.png",
            				"netherite_leggings.png"
            			};
            			protecao_calca = {
            				0,
            				2,
            				3,
            				4,
            				5,
            				6,
            				6
            			}
            			for i=1,7,1 do
            			leggingss[i] = "/Ficha/img/Armor/"..leggingss[i];
            			end;
            			sheet.knees = leggingss[tonumber(sheet.leggings)]
            			sheet.protecao = protecao_capacete[tonumber(sheet.helmet) or 0]+protecao_peitoral[tonumber(sheet.chestplate) or 0]+protecao_calca[tonumber(sheet.leggings) or 0]+protecao_botas[tonumber(sheet.boots) or 0];
        end);

    obj._e_event15 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            botas = {
            				"empty_armor_slot_boots.png",
            				"leather_boots.png",
            				"golden_boots.png",
            				"chainmail_boots.png",
            				"iron_boots.png",
            				"diamond_boots.png",
            				"netherite_boots.png",
            				"turtle_boots.png"
            			};
            			protecao_botas = {
            				0,
            				1,
            				1,
            				1,
            				2,
            				3,
            				3
            			}
            			for i=1,7,1 do
            				botas[i] = "/Ficha/img/Armor/"..botas[i];
            			end;
            			sheet.toes = botas[tonumber(sheet.boots)]
            			sheet.protecao = protecao_capacete[tonumber(sheet.helmet) or 0]+protecao_peitoral[tonumber(sheet.chestplate) or 0]+protecao_calca[tonumber(sheet.leggings) or 0]+protecao_botas[tonumber(sheet.boots) or 0];
        end);

    obj._e_event16 = obj.dataLink9:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.experiencia.width = sheet.percent;
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
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

        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.experiencia ~= nil then self.experiencia:destroy(); self.experiencia = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.inventory ~= nil then self.inventory:destroy(); self.inventory = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.hotbar ~= nil then self.hotbar:destroy(); self.hotbar = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.ender_chest ~= nil then self.ender_chest:destroy(); self.ender_chest = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
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
