local WuXingTbl = {
			{level =1,	per = "1.0%" ,	maxlevel=1,	color = "#c00D000"},
			{level =2,	per = "1.5%" ,	maxlevel=1,	color = "#c00D000"},
			{level =3,	per = "2.1%" ,	maxlevel=2,	color = "#c00D000"},
			{level =4,	per = "3.0%" ,	maxlevel=2,	color = "#c00D000"},
			{level =5,	per = "8.0%" ,	maxlevel=3,	color = "#c43DBFF"},
			{level =6,	per = "11.0%" ,	maxlevel=3,	color = "#c43DBFF"},
			{level =7,	per = "14.5%" ,	maxlevel=4,	color = "#c43DBFF"},
			{level =8,	per = "23.5%" ,	maxlevel=4,	color = "#cFF8001"},
			{level =9,	per = "30.0%" ,	maxlevel=5,	color = "#cFF8001"},
			{level =10,	per = "39.3%" ,	maxlevel=5,	color = "#cFF8001"},
			{level =11,	per = "42.3%" ,	maxlevel=5,	color = "#cFF8001"},
			{level =12,	per = "46.0%" ,	maxlevel=5,	color = "#cFF8001"},
			{level =13,	per = "50.2%" ,	maxlevel=5,	color = "#cFF8001"},
			{level =14,	per = "54.7%" ,	maxlevel=5,	color = "#cFF8001"},
			{level =15,	per = "59.5%", maxlevel=5,	color = "#cFF8001"},
}

local ShowColor = "#H";
local PETSKILL_BUTTONS_NUM = 12;
local PETSKILL_BUTTONS = {};
local PETATTR = {};
local PET_POTREMAIN = 0;
local PET_ATTR_COUNT = 5;
local PET_MAX_NUMBER = 6+4;
local PETNUM = 0;
local PET_REST = 1;
local PET_FIGHT= 0;
local PET_CURRENT_SELECT = 0;
local PET_AITYPE = {};
local Changed_Name_Flag = 0;
local g_NowPetGUID = 0
--			// 创建珍兽(即放出) 0
--			// 收回珍兽					1
--			// 销毁珍兽(即放生)	2
--			// 捕捉珍兽					3
--			可以在被放出后，通过消息，改变该珍兽在listbox中的名字的颜色。
local PET_ORIGINAL_NAME = "";
--珍兽装备按钮数据定义 zchw
local g_Pet_Head; 		--头
local g_Pet_Claw;			--爪
local g_Pet_Body; 		--躯干
local g_Pet_Neck;			--项圈
local g_Pet_Charm;		--护符
nPetMaxHp = 0
--------------------------------------------
-- 提供长按左键进行连加的功能	-- HenryFour@2010-04-16
local g_AutoClick_BtnFlag = -1			-- 记录当前鼠标左键是在哪个按钮按下
local g_AutoClickTimer_Step = 144		-- 多少时间(毫秒)模拟一次 Click 操作
local g_AutoClick_FunList = {}			-- 将公用一个 Timer 的回调功能函数放到一个数组
local g_AutoClick_Going = -1			-- 标志是否开始自动点击操作(第一次LButton后经过X个Timer才算开始, 也就是说是 g_AutoClickTimer_Step * X 的时候开始进行自动加, 这样为了防止本来要点击一下的结果点了好多下)

local g_Page = {
	[1] = { Text = "#{INTERFACE_XML_877}",		NeedCheck = 0,Tip = ""},
	[2] = { Text = "#{INTERFACE_XML_882}",		NeedCheck = 0,Tip = ""},
	[3] = { Text = "#{INTERFACE_XML_854}",		NeedCheck = 0,Tip = ""},
	[4] = { Text = "#{WH_xml_XX(95)}",			NeedCheck = 0,Tip = ""},
	[5] = { Text = "#{XL_XML_35}",				NeedCheck = 0,Tip = "#{XL_090707_02}"},
	[6] = { Text = "#{TalentMP_20210804_57}",	NeedCheck = 1,Tip = "#{TalentMP_20210804_72}"},
	[7] = { Text = "#{SZXT_221216_22}",			NeedCheck = 0,Tip = "#{SZXT_221216_23}"},
	[8] = { Text = "#{SBFW_20230707_1}",		NeedCheck = 1,Tip = "#{SBFW_20230707_2}"},
	[9] = { Text = "#{GRYM_221213_22}",  	 	NeedCheck = 0,Tip = ""},
	[10] = { Text = "#{INTERFACE_XML_496}",		NeedCheck = 0,Tip = ""},
}
local g_PageTip = {}
local g_PageButton = {}
local g_MaxPage = 10
local g_PageCount = 10
local g_PageOrder = {}
local g_PageMask = {}

function Pet_PreLoad()
	this:RegisterEvent("TOGLE_PET_PAGE");
	this:RegisterEvent("UPDATE_PET_PAGE");
	this:RegisterEvent("DELETE_PET");
	this:RegisterEvent("ACCELERATE_KEYSEND");
	this:RegisterEvent("RESET_ALLUI");
	this:RegisterEvent("UPDATE_PET_EXTRANUM");
	this:RegisterEvent("UNIT_LEVEL");
	this:RegisterEvent("UI_COMMAND")
end

function Pet_OnLoad()

	PETSKILL_BUTTONS[1] = Pet_Skill1;
	PETSKILL_BUTTONS[2] = Pet_Skill2;
	PETSKILL_BUTTONS[3] = Pet_Skill3;
	PETSKILL_BUTTONS[4] = Pet_Skill4;
	PETSKILL_BUTTONS[5] = Pet_Skill5;
	PETSKILL_BUTTONS[6] = Pet_Skill6;
	PETSKILL_BUTTONS[7] = Pet_Skill7;
	PETSKILL_BUTTONS[8] = Pet_Skill8;
	PETSKILL_BUTTONS[9] = Pet_Skill9;
	PETSKILL_BUTTONS[10] = Pet_Skill10;
	PETSKILL_BUTTONS[11] = Pet_Skill11;
	PETSKILL_BUTTONS[12] = Pet_Skill12
;
	PET_AITYPE[0] = "胆小";
	PET_AITYPE[1] = "谨慎";
	PET_AITYPE[2] = "忠诚";
	PET_AITYPE[3] = "精明";
	PET_AITYPE[4] = "勇猛";
	--------------------------
	--zchw
	g_Pet_Head = PetEquip_1;
	g_Pet_Claw = PetEquip_2;
	g_Pet_Body = PetEquip_3;
	g_Pet_Neck = PetEquip_4;
	g_Pet_Charm = PetEquip_5;
	--------------------------

	-- 初始化自动加点功能相关变量
	g_AutoClick_FunList[1] = Pet_Str_Add_Clicked
	g_AutoClick_FunList[2] = Pet_Int_Add_Clicked
	g_AutoClick_FunList[3] = Pet_PF_Add_Clicked
	g_AutoClick_FunList[4] = Pet_Sta_Add_Clicked
	g_AutoClick_FunList[5] = Pet_Dex_Add_Clicked
	g_AutoClick_FunList[6] = Pet_Str_Sub_Clicked
	g_AutoClick_FunList[7] = Pet_Int_Sub_Clicked
	g_AutoClick_FunList[8] = Pet_PF_Sub_Clicked
	g_AutoClick_FunList[9] = Pet_Sta_Sub_Clicked
	g_AutoClick_FunList[10] = Pet_Dex_Sub_Clicked
	g_AutoClick_Going = -1
	g_AutoClick_BtnFlag = -1

	Pet_chenghao:SetText("称号");
	
	g_PageButton[1] = Pet_SelfEquip
	g_PageButton[2] = Pet_SelfData
	g_PageButton[3] = Pet_Pet
	g_PageButton[4] = Pet_Wuhun
	g_PageButton[5] = Pet_Xiulian
	g_PageButton[6] = Pet_Talent
	g_PageButton[7] = Pet_Lingyu
	g_PageButton[8] = Pet_Weapon2
	g_PageButton[9] = Pet_Profile
	g_PageButton[10] = Pet_OtherInfo
	
	g_PageTip[1] = Pet_SelfEquip_tips
	g_PageTip[2] = Pet_SelfData_tips
	g_PageTip[3] = Pet_Pet_tips
	g_PageTip[4] = Pet_Wuhun_tips
	g_PageTip[5] = Pet_Xiulian_tips
	g_PageTip[6] = Pet_Talent_tips
	g_PageTip[7] = Pet_Lingyu_tips
	g_PageTip[8] = Pet_Weapon2_tips
	g_PageTip[9] = Pet_Profile_tips
	g_PageTip[10] = Pet_OtherInfo_tips
	
	g_PageMask[1] = Pet_SelfEquip_Mask
	g_PageMask[2] = Pet_SelfData_Mask
	g_PageMask[3] = Pet_Pet_Mask
	g_PageMask[4] = Pet_Wuhun_Mask
	g_PageMask[5] = Pet_Xiulian_Mask
	g_PageMask[6] = Pet_Talent_Mask
	g_PageMask[7] = Pet_Lingyu_Mask
	g_PageMask[8] = Pet_Weapon2_Mask
	g_PageMask[9] = Pet_Profile_Mask
	g_PageMask[10] = Pet_OtherInfo_Mask
	
end

function Pet_OnEvent(event)
	if ( event == "TOGLE_PET_PAGE" ) then
		if( this:IsVisible() ) then
			Pet_Close();
			return
		else
			for i=1,PET_ATTR_COUNT do
				PETATTR[i] = 0;
			end
	
			if arg0 ~= nil and tonumber(arg0)~=nil and tonumber(arg0) < PET_MAX_NUMBER and tonumber(arg0) >= 0 then
				PET_CURRENT_SELECT = tonumber(arg0)
			end
		
			Pet_Open();
		end
		Pet_ShowPage()
		Pet_OnShown()
		Pet_UpdateRedPoint()
		return;
	elseif ( event == "UPDATE_PET_PAGE") then
		if(this:IsVisible())then
			Pet_Update();
		else
			Pet_Update_NotVisible();
		end
		return;
	elseif( event == "ACCELERATE_KEYSEND" ) then
		Pet_HandleAccKey(arg0);
	elseif ( event == "DELETE_PET" ) then
		if(this:IsVisible())then
			for i=1,PET_ATTR_COUNT do
				PETATTR[i] = 0;
			end
			Pet_Update();
		else
			Pet_Update_NotVisible();
		end
	elseif(event == "RESET_ALLUI")then
		PET_CURRENT_SELECT = 0;
		Pet:SetSelectPetIdx(0);
	elseif event == "UI_COMMAND" and tonumber(arg0) == 201810282 then --附体后按钮更新
		Pet_Update()
	elseif event == "UI_COMMAND" and tonumber(arg0) == 202012211 and this:IsVisible() then
	    if Get_XParam_INT(0) < 0 or Get_XParam_INT(0) == nil then
		    return
		end
	    Pet:Free_Confirm(tonumber(Get_XParam_INT(0)));
	elseif event == "UI_COMMAND" and tonumber(arg0) == 201810283 and this:IsVisible() then
		-- Pet_ListBox_Selected()
		Pet_Show_PetInfo(PET_CURRENT_SELECT);
	elseif(event == "UPDATE_PET_EXTRANUM" or event == "UNIT_LEVEL")then
		local nPetCount = Pet:GetPet_Count()
		local nMaxPetCount = GetMyCurMaxPetCount()
		Pet_List_Text:SetText("珍兽列表 "..nPetCount.."/"..nMaxPetCount)
	end
	
end

function Pet_HandleAccKey(op)
	if(op == "acc_pet") then
		if(this:IsVisible()) then
			Pet_Close();
			return;
		end
		
		--模拟收到了一个打开珍兽界面的事件。
		arg0 = "-1";
		Pet_OnEvent("TOGLE_PET_PAGE");
	end
end

function Pet_UpdateRedPoint()
	for i = 1, g_MaxPage do
		g_PageTip[i]:Hide()
	end

end

function Pet_ShowPage()

	for i = 1, g_MaxPage do
		g_PageButton[i]:Hide()
	end

	local nPageNumber = tonumber(Variable:GetVariable("PageNumber"));

	Pet_ClearPage()

	if nPageNumber ~= nil and nPageNumber ~= 0 then
		g_PageButton[nPageNumber]:SetCheck(1)
		for i = 1, g_MaxPage do
			if i ~= nPageNumber then
				g_PageButton[i]:SetCheck(0)
			end
		end
	end
	g_PageOrder = {}
	g_PageCount = 0
	for i = 1, g_MaxPage do
		if Pet_CheckPage(i) == 1 then

		
		
			g_PageCount = g_PageCount + 1
			g_PageButton[g_PageCount]:Show()
			g_PageButton[g_PageCount]:SetText(g_Page[i].Text)	
			g_PageOrder[g_PageCount] = i
			
			if Pet_IsPageEnable(i) == 1 then
				g_PageButton[g_PageCount]:Enable()
				g_PageMask[g_PageCount]:Hide()
			else
				g_PageButton[g_PageCount]:Disable()
				g_PageMask[g_PageCount]:Show()
				g_PageMask[g_PageCount]:SetToolTip(g_Page[i].Tip)
			end
		end
	end
end

function Pet_OnShown()
	local selfUnionPos = Variable:GetVariable("SelfUnionPos");
	if(selfUnionPos ~= nil) then
		Pet_Frame:SetProperty("UnifiedPosition", selfUnionPos);
	end
	
	Pet_SelfEquip : SetCheck(0);
	Pet_SelfData : SetCheck(0);
	Pet_Pet : SetCheck(1);
	Pet_OtherInfo : SetCheck(0);
	
	Pet_Accept:Disable();
	Pet_Cancel:Disable();
	Pet_Amend:Disable();
	Pet_Free:Disable();
	--Pet_LockPet:Disable();
	Pet_Domesticate:Disable();
	Pet_Feed:Disable();
	Pet_Rest:Disable();
	Pet_Campaign:Disable();
	Pet_Str_Addition:Disable();
	Pet_Int_Addition:Disable();
	Pet_Dex_Addition:Disable();
	Pet_PF_Addition:Disable();
	Pet_Sta_Addition:Disable();
	Pet_Str_Subtraction:Disable();
	Pet_Int_Subtraction:Disable();
	Pet_Dex_Subtraction:Disable();
	Pet_PF_Subtraction:Disable();
	Pet_Sta_Subtraction:Disable();
	Pet_Page_Clear();

	Pet_Update();
end

function Pet_Page_Clear()
	Pet_FakeObject:RotateEnd()
	Pet_FakeObject:RotateEnd()
	Pet_Accept:Disable()
	Pet_Cancel:Disable()
	Pet_Amend:Disable()
	Pet_Rest:Disable()
	Pet_Free:Disable()
	Pet_LockPet:Disable()
	Pet_Domesticate:Disable()
	Pet_Feed:Disable()
	Pet_Heti:Disable()
	Pet_Fenli:Disable()
	Pet_Campaign:Disable()
	Pet_Str_Addition:Disable()
	Pet_Int_Addition:Disable()
	Pet_Dex_Addition:Disable()
	Pet_PF_Addition:Disable()
	Pet_Sta_Addition:Disable()
	Pet_Str_Subtraction:Disable()
	Pet_Int_Subtraction:Disable()
	Pet_Dex_Subtraction:Disable()
	Pet_PF_Subtraction:Disable()
	Pet_Sta_Subtraction:Disable()
	
	Pet_PetName:SetText("")
	Pet_PetName:Disable()
	
	Pet_Type:SetText("")
	Pet_Type:SetToolTip("")

	Pet_PageHeader:SetText("#gFF0FA0珍兽")
	Pet_ConsortID:SetText("")
	Pet_PetID:SetText("")
	Pet_Sex:SetText("")
	Pet_Life:SetText("")
	Pet_Happy:SetText("")
	Pet_Level:SetText("")
	Pet_StrAptitude:SetText("")
	Pet_PhysicalStrengthAptitude:SetText("")
	Pet_DexterityAptitude:SetText("")
	Pet_NimbusAptitude:SetText("")
	Pet_StabilityAptitude:SetText("")
	Pet_Exp:SetText("")
	Pet_Blood:SetText("")
	Pet_Str:SetText("")
	Pet_Nimbus:SetText("")
	Pet_Dexterity:SetText("")
	Pet_PhysicalStrength:SetText("")
	Pet_Stability:SetText("")
	Pet_GenGu:SetText("")
	Pet_Potential:SetText("")
	Pet_PhysicsAttack:SetText("")
	Pet_MagicAttack:SetText("")
	Pet_PhysicsRecovery:SetText("")
	Pet_MagicRecovery:SetText("")
	Pet_Miss:SetText("")
	Pet_WuXing:SetText("")
	Pet_ShootProbability:SetText("")
	Pet_CriticalAttack:SetText("")
	Pet_CriticalDefence:SetText("")
	Pet_Growth : SetText("")
	Pet_Lingxing : SetText("")
	Pet_Lingxing_Info:SetText("")

	Pet_Growth1 : SetText("")
	Pet_GenGu	: SetToolTip("")
	Pet_WuXing : SetToolTip("")
	Pet_Growth : SetToolTip("")
	-------------------------------
	Pet_FakeObject : SetFakeObject( "" );
	PetAttack_Type : Hide();
	for i=1, PETSKILL_BUTTONS_NUM do
		PETSKILL_BUTTONS[i]:SetActionItem(-1);
	end
	PetFood_Type : Hide();
	Pet_lock : Hide();
	PET_POTREMAIN = 0
	Pet_Refresh_ADDSUB_Button();
	Pet_NeedLevel:SetText( "" );
	Pet_Jian : Hide();
	
	--设置珍兽数量信息--add by xindefeng
	local nPetCount = Pet:GetPet_Count()
	local nMaxPetCount = GetMyCurMaxPetCount()
	Pet_List_Text:SetText("珍兽列表 "..nPetCount.."/"..nMaxPetCount)

	Pet_PetSoul_Equip_Check:Disable()
	Pet_PetSoul_Equip:SetActionItem(-1)
	Pet_PetSoul1:SetActionItem(-1)
	Pet_PetSoul2:SetProperty( "BackImage", "" )
	Pet_PetSoul_Equip_Mask:Hide()	
end

function Pet_ListBox_Selected()
	PETNUM = Pet_List : GetFirstSelectItem();
	local nPetCount = Pet : GetPet_Count();
	
	if(PETNUM == PET_CURRENT_SELECT) then
		return;
	end
	
	if(PETNUM < 0 and nPetCount > 0) then
		PETNUM = PET_CURRENT_SELECT;
		return;
	end

	for i=1,PET_ATTR_COUNT do
		PETATTR[i] = 0;
	end
	
	Pet_Page_Clear();
	Changed_Name_Flag = 0;
	PET_CURRENT_SELECT = PETNUM;	
	Pet_FakeObject : SetFakeObject( "" );
	Pet : SetModel(PETNUM);
	Pet_FakeObject : SetFakeObject( "My_Pet" );
	
	Pet_Show_PetInfo(PETNUM);

	Pet:NotifySelChange(PETNUM);
	Pet:UpdateSelChange(PETNUM);
	
	local	tcount = Pet:GetTitleNum(PET_CURRENT_SELECT);
	if(tcount>0)then
		Pet_chenghao:Enable()
	else
		Pet_chenghao:Disable()
	end
end

function Pet_ListBox_RClicked()
	local clkNum = Pet_List : GetClickItem();
	--AxTrace(0,0,"Pet_ListBox_RClicked "..tostring(clkNum));
	if(clkNum >= 0) then
		Pet:CheckRClick(clkNum);
	end
end

function Pet_Update_NotVisible()
	local nPetCount = Pet : GetPet_Count();
	if nPetCount < 1 then
		PET_CURRENT_SELECT = -1;
		Pet:SetSelectPetIdx(-1);
		return;
	end
	local bSelect = 0;
	local firSel = -1;
	for	i=1, PET_MAX_NUMBER do
		if Pet:IsPresent(i-1) then
			if(firSel == -1)then
				firSel = i-1;
			end
			if( i-1 == PET_CURRENT_SELECT) then
				bSelect = 1;
			end
		end
	end
	--有选中对象的，才进行选中操作。
	if bSelect == 1 then
		--do nothing
	else
		PET_CURRENT_SELECT = firSel;
		Pet:SetSelectPetIdx(firSel);
	end
end
--皮皮重写排序,修复兽魂融魂错误;2025.04.03
function Pet_Update()
	Pet_chenghao:Disable()
	Pet_SelfEquip:SetCheck(0);
	Pet_SelfData:SetCheck(0);
	Pet_Pet:SetCheck(1);
	Pet_OtherInfo:SetCheck(0);
	local nPetCount = Pet:GetPet_Count();
	AxTrace(3,3,"nPetCount = "..nPetCount);
	local szPetName;
	Pet_Page_Clear();
	Pet_List:ClearListBox();
	
	if nPetCount < 1 then
		PET_CURRENT_SELECT = -1;
		Pet:SetSelectPetIdx(-1);
		return;
	end
	
	local petList = {};  
    local petCount = 0;  
    for i = 0, PET_MAX_NUMBER-1 do  
        if Pet:IsPresent(i) then
            local _, guidStr = Pet:GetID(i);
            local guidNum = tonumber(guidStr, 16);  
            petCount = petCount + 1;
            petList[petCount] = { index = i, guid = guidNum }; 
        end
    end

    for i = 1, petCount do
        for j = i + 1, petCount do
            if petList[i].guid > petList[j].guid then
                local temp = petList[i];
                petList[i] = petList[j];
                petList[j] = temp;
            end
        end
    end
    local bSelect = 0;
    local firSel = -1;
    for i = 1, petCount do 
        local petData = petList[i];
        local idx = petData.index;
        szPetName = Pet:GetPetList_Appoint(idx);
		if string.find(szPetName, "#") then
			szPetName = string.sub(szPetName, 5, -1);
		end
        local _, nGUID = Pet:GetID(idx);
        g_NowPetGUID = tonumber(nGUID, 16);
		if(Pet:GetIsFighting(idx)) then
			Pet_List:AddItem(szPetName, idx,"FF0A9605");
		elseif (g_NowPetGUID == DataPool:GetPlayerMission_DataRound(510)) then
			Pet_List:AddItem(szPetName, idx, "FF996699");
		else
			Pet_List:AddItem(szPetName, idx);
		end
		if( idx == PET_CURRENT_SELECT) then
			bSelect = 1;
		end
		if (firSel == -1) then
            firSel = idx;
        end
		--这里必须有这么2句，要不会出错。
		Pet_DisableAddButton();
		Pet_DisableSubButton();
		
	end
	local tcount = 0;
	--有选中对象的，才进行选中操作。
	if bSelect == 1 then
		Pet:UpdateSelChange(PET_CURRENT_SELECT);
		Pet_List:SetItemSelectByItemID(PET_CURRENT_SELECT);
		Pet_FakeObject:SetFakeObject( "" );
		Pet:SetModel(PET_CURRENT_SELECT);
		Pet_FakeObject:SetFakeObject( "My_Pet" );	
		Pet_Show_PetInfo(PET_CURRENT_SELECT);
		tcount = Pet:GetTitleNum(PET_CURRENT_SELECT);
		if(tcount>0)then
			Pet_chenghao:Enable()
		end
	else
		PET_CURRENT_SELECT = firSel;
		if(firSel == -1)then
			Pet:SetSelectPetIdx(-1);	
			return;
		end
		Pet_List:SetItemSelectByItemID(PET_CURRENT_SELECT);
		Pet_FakeObject:SetFakeObject( "" );
		Pet:SetModel(PET_CURRENT_SELECT);
		Pet_FakeObject:SetFakeObject( "My_Pet" );	
		Pet_Show_PetInfo(PET_CURRENT_SELECT);
		tcount = Pet:GetTitleNum(PET_CURRENT_SELECT);
		if(tcount>0)then
			Pet_chenghao:Enable()
		end
	end	
	if PET_CURRENT_SELECT > PET_MAX_NUMBER then
		PET_CURRENT_SELECT = PET_MAX_NUMBER;
	end
	Pet_PetName:SetProperty("DefaultEditBox", "False");
	local strNeedLevel;
	local strNeedLevelColor;
	local nTakeLevel = Pet:GetTakeLevel(PET_CURRENT_SELECT );
	
	if( nTakeLevel > Player:GetData( "LEVEL" ) )then
		strNeedLevelColor="#cFF0000";
	else
		strNeedLevelColor="#c00FF00";
	end
	strNeedLevel = strNeedLevelColor..tostring( nTakeLevel ).."级#W可携带";
	Pet_NeedLevel:SetText( strNeedLevel );
	
end

function Pet_Show_PetInfo(nIndex)
	if not Pet:IsPresent(nIndex) then
		return
	end
	
	local i;
    local nPetEquipAttrData = {0,0,0,0,0,0,0,0,0,0,0,0,0,0} 
	if (Pet:GetIsFighting(nIndex)) then
		local nEx = Lua_GetPetEquipAttr(nIndex)
		nPetEquipAttrData = {nEx[1],0,0,nEx[4],0,0,0,0,nEx[9],0,0,nEx[12],nEx[13],0}
	else
	    nPetEquipAttrData = Lua_GetPetEquipAttr(nIndex)
	end   

	Pet:SetSelectPetIdx(nIndex)
	Pet_Accept:Disable()
	Pet_Cancel:Disable()
	Pet_Amend:Enable()
	Pet_Rest:Enable()
	Pet_Free:Enable()
	Pet_LockPet:Enable()
	Pet_Domesticate:Enable()
	Pet_Feed:Enable()
	Pet_Heti:Enable()
	Pet_Fenli:Enable()
	Pet_Campaign:Enable()
	
	Pet_Str_Addition:Disable()
	Pet_Int_Addition:Disable()
	Pet_Dex_Addition:Disable()
	Pet_PF_Addition:Disable()
	Pet_Sta_Addition:Disable()
	Pet_Str_Subtraction:Disable()
	Pet_Int_Subtraction:Disable()
	Pet_Dex_Subtraction:Disable()
	Pet_PF_Subtraction:Disable()
	Pet_Sta_Subtraction:Disable()
	
	for i=1, PETSKILL_BUTTONS_NUM do
		PETSKILL_BUTTONS[i]:SetActionItem(-1);
	end
 	
	local aiType = Pet:GetAIType(nIndex) 	
	if aiType >= 0 and aiType <= 4 then
		Pet_Type:SetText("#gFF8E92"..PET_AITYPE[aiType])
		Pet_Type:SetToolTip("#{INTERFACE_XML_857}")
	end
	local strName, strName2 = Pet:GetName(nIndex)
	if string.find(strName,"#") then
		strName = string.sub(strName,5,-1);
	end
	local nEra, strTypeName = Pet:GetPetTypeName(nIndex)
 	if 1 == nEra then
 	    strName2 = "二代"..strTypeName
 	end
	
 	Pet_PageHeader : SetText("#gFF0FA0"..strName2);

 	if(PlayerPackage:IsPetLock(nIndex) == 1) then
	 	Pet_lock : Show();
	 	
	 	local nUnlockElapsedTime = PlayerPackage:GetPUnlockElapsedTime_Pet(nIndex);
	 	if( nUnlockElapsedTime ==0) then
	 		Pet_lock : SetProperty("Image","set:UIIcons image:Icon_Lock");
	 		Pet_lock : SetToolTip ("已加锁");
	 	else
	 		local strLeftTime = g_GetUnlockingStr(nUnlockElapsedTime);		
	 		Pet_lock : SetProperty("Image","set:CommonFrame6 image:NewLock");
	 		Pet_lock : SetToolTip (strLeftTime);
	 	end
	 	
	else
	 	Pet_lock : Hide();
	end
	local Changed_Name = Pet_PetName:GetText()
	if Changed_Name ~= strName and Changed_Name ~= "" then
		Pet_PetName:Enable()
	else
		Pet_PetName:Enable()
		Pet_PetName:SetText(strName)
		Pet_PetName : SetProperty("ClearOffset" ,"True" )
	end
	local _, strGUID, iSex = Pet:GetID(nIndex)
	Pet_PetID:SetText("珍兽ID:"..strGUID)
	
	strName = Pet : GetConsort(nIndex);
	if(strName == "00000000") then
		strName = "";
	end;
	local strLoverGUID = Pet:GetConsort(nIndex)
	if strLoverGUID == "00000000" then
		Pet_ConsortID:SetText("配偶ID:")
	else
		Pet_ConsortID:SetText("配偶ID:"..strLoverGUID)
	end
--	
--	if DataPool:GetXYJServerData(500) ~= -1 then
--		--进制转换，获取配偶ID。单人繁殖专用
--		strName = string.upper(string.format("%x",DataPool:GetXYJServerData(500)))
--		local nLen = string.len(strName)
--		if nLen < 8 then
--			nLen = 8 - nLen
--		end
--		strName = string.rep("0",nLen)..strName
--	end
--	Pet_ConsortID : SetText( "配偶ID:"..strName );

	if(iSex == 1) then 
		strName = "雄性";
	else
		strName = "雌性";
	end
    local nHuanHua = LuaFn_GetPetLingXing(nIndex,1)
	if nHuanHua ~= nil and nHuanHua == 1 then
	    strName = "#{RXZS_XML_35}"
    end
	Pet_Sex : SetText( strName );
	
	local iSavvyData = Pet:GetSavvy(nIndex)
	local iSavvy,iCurLingXing = Pet_GetSavvyAndLingXing(iSavvyData)
	Pet_WuXing:SetText("悟性:"..tostring(iSavvy))
	Pet_WuXing:SetToolTip("#{INTERFACE_XML_733}")
	
	Pet_Lingxing:SetText("#{RXZS_XML_28}"..tostring(iCurLingXing))

	local nLingXingAttr = {10,20,50,70,110,140,180,220,260,310}
	if nLingXingAttr[iCurLingXing] ~= nil then
		iCurLingXing = nLingXingAttr[iCurLingXing]
	end
	if tonumber(iCurLingXing) > 0 then
		local rateStr = string.format("%0.1f" , iCurLingXing / 10.0)
		Pet_Lingxing_Info:SetText("#cFF00FF(+"..rateStr.."%)")
	else
		Pet_Lingxing_Info:SetText("");
	end	
	local strNeedLevel;
	local strNeedLevelColor;
	local nTakeLevel = Pet:GetTakeLevel(nIndex);
	
	if( nTakeLevel > Player:GetData( "LEVEL" ) )then
		strNeedLevelColor="#cFF0000";
	else
		strNeedLevelColor="#c00FF00";
	end
	strNeedLevel = strNeedLevelColor..tostring( nTakeLevel ).."级#W可携带";
	Pet_NeedLevel:SetText( strNeedLevel );
	
	local iLife = Pet:GetNaturalLife(nIndex)
	Pet_Life:SetText("寿命:"..tostring(iLife))

	local iLevel = Pet:GetLevel(nIndex)
	Pet_Level:SetText("等级:"..tostring(iLevel))
	
	local iHappy = Pet:GetHappy(nIndex)
	Pet_Happy:SetText("快乐:"..tostring(iHappy))
	
	local iStrAptitude = Pet:GetStrAptitude(nIndex)
	local iSprAptitude = Pet:GetIntAptitude(nIndex)
	local iConAptitude = Pet:GetPFAptitude(nIndex)
	local iIntAptitude = Pet:GetStaAptitude(nIndex)
	local iDexAptitude = Pet:GetDexAptitude(nIndex)
	
	local bHavePetSoul = Pet:LuaFnIsPetEquipPetSoul(nIndex)
	local iStrAptitude_ps = Pet:LuaFnGetStrAptitude_ps(nIndex)
	local iSprAptitude_ps = Pet:LuaFnGetSprAptitude_ps(nIndex)
	local iConAptitude_ps = Pet:LuaFnGetConAptitude_ps(nIndex)
	local iIntAptitude_ps = Pet:LuaFnGetIntAptitude_ps(nIndex)
	local iDexAptitude_ps = Pet:LuaFnGetDexAptitude_ps(nIndex)
	
	if WuXingTbl[iSavvy] ~= nil then
		if bHavePetSoul == 1 then
			Pet_StrAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iStrAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")".."#cFFCC99(+"..tostring(iStrAptitude_ps)..")")
			Pet_NimbusAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iSprAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")".."#cFFCC99(+"..tostring(iSprAptitude_ps)..")")
			Pet_PhysicalStrengthAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iConAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")".."#cFFCC99(+"..tostring(iConAptitude_ps)..")")
			Pet_StabilityAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iIntAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")".."#cFFCC99(+"..tostring(iIntAptitude_ps)..")")
			Pet_DexterityAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iDexAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")".."#cFFCC99(+"..tostring(iDexAptitude_ps)..")")
		else
			Pet_StrAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iStrAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")")
			Pet_NimbusAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iSprAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")")
			Pet_PhysicalStrengthAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iConAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")")
			Pet_StabilityAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iIntAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")")
			Pet_DexterityAptitude:SetText(WuXingTbl[iSavvy].color..tostring(iDexAptitude)..ShowColor.."(+"..WuXingTbl[iSavvy].per..")")
		end
	else
		if bHavePetSoul == 1 then
			Pet_StrAptitude:SetText(tostring(iStrAptitude).."#cFFCC99(+"..tostring(iStrAptitude_ps)..")")
			Pet_NimbusAptitude:SetText(tostring(iSprAptitude).."#cFFCC99(+"..tostring(iSprAptitude_ps)..")")
			Pet_PhysicalStrengthAptitude:SetText(tostring(iConAptitude).."#cFFCC99(+"..tostring(iConAptitude_ps)..")")
			Pet_StabilityAptitude:SetText(tostring(iIntAptitude).."#cFFCC99(+"..tostring(iIntAptitude_ps)..")")
			Pet_DexterityAptitude:SetText(tostring(iDexAptitude).."#cFFCC99(+"..tostring(iDexAptitude_ps)..")")
		else
			Pet_StrAptitude:SetText(tostring(iStrAptitude))
			Pet_NimbusAptitude:SetText(tostring(iSprAptitude))
			Pet_PhysicalStrengthAptitude:SetText(tostring(iConAptitude))
			Pet_StabilityAptitude:SetText(tostring(iIntAptitude))
			Pet_DexterityAptitude:SetText(tostring(iDexAptitude))		
		end
	end
	
	--贵重显示
--	if LuaFn_GetPetLingXing(nIndex,1) == 1 then
--		Pet_GuiZhong:Show()
--	end
	for i=1,PET_ATTR_COUNT do
		if PETATTR[i] == nil then
			PETATTR[i] = 0
		end
	end
	
	local iExp, iLevelUpExp = Pet:GetExp(nIndex)
	Pet_Exp:SetText("经验:"..tostring(iExp) .."/"..tostring(iLevelUpExp))
	
	local iHP = Pet:GetHP(nIndex)
	local iMaxHP = Pet:	GetMaxHP(nIndex);
	Pet_Blood:SetText("血:"..tostring(iHP + nPetEquipAttrData[6]) .."/".. tostring(iMaxHP + nPetEquipAttrData[6]))
	
	local iStr = Pet:GetStr(nIndex) + nPetEquipAttrData[9]
	Pet_Str:SetText(tostring(iStr) + PETATTR[1])
	
	local iSpr = Pet:GetInt(nIndex) +nPetEquipAttrData[4]
	Pet_Nimbus:SetText(tostring(iSpr) + PETATTR[2])
	
	local iCon = Pet:GetPF(nIndex) + nPetEquipAttrData[12]
	Pet_PhysicalStrength:SetText(tostring(iCon) + PETATTR[4])
	
	local iInt = Pet:GetSta(nIndex) + nPetEquipAttrData[13]
	Pet_Stability:SetText(tostring(iInt) + PETATTR[5])
	
	local iDex = Pet:GetDex(nIndex) + nPetEquipAttrData[1]
	Pet_Dexterity:SetText(tostring(iDex) + PETATTR[3])
	
	local iGenGu = Pet:GetBasic(nIndex)
	iGenGu = math.mod(iGenGu,10)
	Pet_GenGu:SetText("根骨:"..tostring(iGenGu))
	Pet_GenGu:SetToolTip("#{INTERFACE_XML_287}")

	Pet_CriticalAttack : SetText( Pet:GetCriticalAttack(nIndex) + nPetEquipAttrData[11] );
	Pet_CriticalDefence : SetText(Pet:GetCriticalDefence(nIndex)+nPetEquipAttrData[14] )

	local iPotential = Pet:GetPotential(nIndex)
	local Sum_Attr = 0
	for i=1,PET_ATTR_COUNT do
		Sum_Attr = Sum_Attr + PETATTR[i]
	end
	
	--出现这种情况是
	if iPotential - Sum_Attr < 0 then
		PET_POTREMAIN = 0 
	 for i=1,PET_ATTR_COUNT do
			PETATTR[i] = 0
	 end
	else
		PET_POTREMAIN = iPotential - Sum_Attr
	end

	Pet_Potential:SetText(PET_POTREMAIN)
	Pet_Refresh_ADDSUB_Button();
	
	local iPhysicsAttack = Pet:GetPhysicsAttack(nIndex) + nPetEquipAttrData[7]
	Pet_PhysicsAttack:SetText(tostring(iPhysicsAttack))
	
	local iMagicAttack = Pet:GetMagicAttack(nIndex) + nPetEquipAttrData[5]
	Pet_MagicAttack:SetText(tostring(iMagicAttack))
	
	local iPhysicsDefence = Pet:GetPhysicsRecovery(nIndex) + nPetEquipAttrData[3]
	Pet_PhysicsRecovery:SetText(tostring(iPhysicsDefence))
	
	local iMagicDefence = Pet:GetMagicRecovery(nIndex) + nPetEquipAttrData[2]
	Pet_MagicRecovery:SetText(tostring(iMagicDefence))

	local iGrowRate = Pet:GetGrowRate(nIndex);
	
	Pet_Growth1:SetText("#{ZS_CZL}")	
	Pet_Growth:SetToolTip("#{INTERFACE_XML_986}")
	Pet_Growth:SetText("#G未知")
	local nGrowLevel = Pet:GetPetGrowLevel(nIndex, tonumber(iGrowRate))
	local strTbl = {"普通", "优秀", "杰出", "卓越", "完美"}
	
	if nGrowLevel >= 0 then
		nGrowLevel = nGrowLevel + 1
		local nGrowRate = Pet:GetGrowRate(nIndex)
		if strTbl[nGrowLevel] ~= nil then
			Pet_Growth : SetText("#G"..strTbl[nGrowLevel]..nGrowRate)
		end
	end

	--闪避率
	local iMiss = Pet:GetMiss(nIndex) + nPetEquipAttrData[10]
	Pet_Miss:SetText(tostring(iMiss))

	--命中率
	local iHit = Pet:GetShootProbability(nIndex) + nPetEquipAttrData[8]
	Pet_ShootProbability:SetText(iHit)
	
	local strTip, strIcon = Pet:GetAttackTrait(nIndex)
	if strIcon ~= "" then
		PetAttack_Type : SetProperty( "Image", "set:Button6 image:"..strIcon )
		PetAttack_Type:SetToolTip(strTip)
		PetAttack_Type:Show()
	end
	
	local SumPetSkill = GetActionNum("petskill")
	local k = 1
	local i = 1

	while i <= PETSKILL_BUTTONS_NUM do
		local theSkillAction = Pet:EnumPetSkill(nIndex, i - 1, "petskill")
		i = i + 1
		if theSkillAction:GetID() ~= 0 then
			PETSKILL_BUTTONS[k]:SetActionItem(theSkillAction:GetID())
			k = k + 1
		end
	end
	----------------------------------------
	Pet_Refresh_Equip();
	if Lua_IsPetHaveEquip(nIndex) == 1 then
		OneKeyUnEquip:Enable();
	else
		OneKeyUnEquip:Disable();
	end

	---------------------------------------
    local _,nGUID = Pet : GetID(nIndex);	
	if(Pet : GetIsFighting(nIndex)) then
		Pet_Campaign : Hide();
		Pet_Rest : Show();
	else
		Pet_Rest : Hide();
		Pet_Campaign : Show();
	end
	
	if DataPool:GetPlayerMission_DataRound(510) == tonumber(nGUID, 16) then
		Pet_Heti:Hide()
		Pet_Fenli:Show()
	else
		Pet_Fenli:Hide()
		Pet_Heti:Show()
	end
	
	local food = Pet : GetFoodType(nIndex);
	strName = "";
	if(food >= 1000) then
		strName = strName .. "肉";
		food = food - 1000;
		if food > 0 then
			strName = strName .. ",";
		end
	end
	if(food >= 100) then
		strName = strName .. "草";
		food = food - 100;
		if food > 0 then
			strName = strName .. ",";
		end
	end
	if(food >= 10) then
		strName = strName .. "虫";
		food = food - 10;
		if food > 0 then
			strName = strName .. ",";
		end
	end
	
	if(food >= 1) then
		strName = strName .. "谷";
	end
	PetFood_Type : Show();
	PetFood_Type : SetToolTip( strName );
	
	Pet_Jian : Show();	
end

function Pet_Str_Add_Clicked()
	if PET_POTREMAIN > 0 then
		PETATTR[1] = PETATTR[1] + 1
		PET_POTREMAIN = PET_POTREMAIN - 1
		Pet_Potential:SetText(PET_POTREMAIN)
		Pet_Str:SetText(Pet_Str:GetText() + 1)
	Pet_Str_Subtraction:Enable()
	end
	
	if PET_POTREMAIN <= 0 then
		Pet_DisableAddButton()
	end
end

function Pet_Int_Add_Clicked()
	if( PET_POTREMAIN >0 ) then
		PETATTR[2] = PETATTR[2] +1;
		PET_POTREMAIN = PET_POTREMAIN - 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Nimbus : SetText( Pet_Nimbus : GetText() + 1 );
		Pet_Int_Subtraction:Enable();
	end
	if( PET_POTREMAIN <=0 ) then
		Pet_DisableAddButton();
	end
end

function Pet_Dex_Add_Clicked()
	if( PET_POTREMAIN >0 ) then
		PETATTR[3] = PETATTR[3] +1;
		PET_POTREMAIN = PET_POTREMAIN - 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Dexterity : SetText( Pet_Dexterity : GetText() + 1 );
		Pet_Dex_Subtraction:Enable();
	end
	if( PET_POTREMAIN <=0 ) then
		Pet_DisableAddButton();
	end
end

function Pet_PF_Add_Clicked()
	if( PET_POTREMAIN >0 ) then
		PETATTR[4] = PETATTR[4] +1;
		PET_POTREMAIN = PET_POTREMAIN - 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_PhysicalStrength : SetText( Pet_PhysicalStrength : GetText() + 1 );
		Pet_PF_Subtraction:Enable();
	end
	if( PET_POTREMAIN <=0 ) then
		Pet_DisableAddButton();
	end
end

function Pet_Sta_Add_Clicked()
	if( PET_POTREMAIN >0 ) then
		PETATTR[5] = PETATTR[5] +1;
		PET_POTREMAIN = PET_POTREMAIN - 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Stability : SetText( Pet_Stability : GetText() + 1 );
		Pet_Sta_Subtraction:Enable();
	end
	if( PET_POTREMAIN <=0 ) then
		Pet_DisableAddButton();
	end
end

function Pet_Str_Sub_Clicked()
	if( PETATTR[1] >0 ) then
		PETATTR[1] = PETATTR[1] -1;
		PET_POTREMAIN = PET_POTREMAIN + 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Str : SetText( Pet_Str : GetText() - 1 );
		Pet_EnableAddButton();
	end
	if( PETATTR[1] <= 0 ) then
		Pet_Str_Subtraction:Disable();
	end
end

function Pet_Int_Sub_Clicked()
	if( PETATTR[2] >0 ) then
		PETATTR[2] = PETATTR[2] -1;
		PET_POTREMAIN = PET_POTREMAIN + 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Nimbus : SetText( Pet_Nimbus : GetText() - 1 );
		Pet_EnableAddButton();
	end
	if( PETATTR[2] <= 0 ) then
		Pet_Int_Subtraction:Disable();
	end
end

function Pet_Dex_Sub_Clicked()
	if( PETATTR[3] >0 ) then
		PETATTR[3] = PETATTR[3] -1;
		PET_POTREMAIN = PET_POTREMAIN + 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Dexterity : SetText( Pet_Dexterity : GetText() - 1 );
		Pet_EnableAddButton();
	end
	if( PETATTR[3] <= 0 ) then
		Pet_Dex_Subtraction:Disable();
	end
end

function Pet_PF_Sub_Clicked()
	if( PETATTR[4] >0 ) then
		PETATTR[4] = PETATTR[4] -1;
		PET_POTREMAIN = PET_POTREMAIN + 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_PhysicalStrength : SetText( Pet_PhysicalStrength : GetText() - 1 );
		Pet_EnableAddButton();
	end
	if( PETATTR[4] <= 0 ) then
		Pet_PF_Subtraction:Disable();
	end
end

function Pet_Sta_Sub_Clicked()
	if( PETATTR[5] >0 ) then
		PETATTR[5] = PETATTR[5] -1;
		PET_POTREMAIN = PET_POTREMAIN + 1;
		Pet_Potential : SetText( PET_POTREMAIN );
		Pet_Stability : SetText( Pet_Stability : GetText() - 1 );
		Pet_EnableAddButton();
	end
	if( PETATTR[5] <= 0 ) then
		Pet_Sta_Subtraction:Disable();
	end
end

function Pet_Accept_Clicked()
	if(not (Pet:IsPresent(PETNUM)) ) then
		return;
	end
	--if(PlayerPackage:IsPetLock(PETNUM) == 1)    then
	--	PushDebugMessage("珍兽已加锁")
	--	for i=1,PET_ATTR_COUNT do
	--		PETATTR[i] = 0;
	--	end
	--	Pet_Show_PetInfo(PETNUM);
	--	return;
	--end
	if(tonumber(DataPool:GetLeftProtectTime()) >0)    then
		PushDebugMessage("#{OR_PILFER_LOCK_FLAG}")
		for i=1,PET_ATTR_COUNT do
			PETATTR[i] = 0;
		end
		Pet_Show_PetInfo(PETNUM);
		return;
	end
 	Pet : Add_Attribute(PETNUM ,PETATTR[1] ,PETATTR[2], PETATTR[3], PETATTR[4], PETATTR[5]);
	for i=1,PET_ATTR_COUNT do
		PETATTR[i] = 0;
	end
end

function Pet_Cancel_Clicked()
	if(not (Pet:IsPresent(PETNUM)) ) then
		return;
	end
	
	for i=1,PET_ATTR_COUNT do
		PETATTR[i] = 0;
	end

	Pet_Show_PetInfo(PETNUM);
end

function Pet_Relax_Clicked()
	Pet : Go_Relax(PETNUM);
end

function Pet_Fight_Clicked()
	-- 已经提交到指定界面容器的珍兽不能出战
	if (IsWindowShow("PetSavvy") and Pet:GetPetLocation(PETNUM) == 12)							-- 用成年珍兽提升珍兽悟性
		or (IsWindowShow("PetSavvyGGD")	and Pet:GetPetLocation(PETNUM) == 3)				-- 用根骨丹提升珍兽悟性
		or (IsWindowShow("MissionReply") and Pet:GetPetLocation(PETNUM) == 7) then	-- 任务提交物品或珍兽
		-- "珍兽处于提交状态，无法出战。"
		PushDebugMessage("#{ZSTJZT_090904}")
		return		
	end
	
	local nGUID_1,nGUID_2 = Pet : GetID(PETNUM);
	if  tonumber(nGUID_2, 16) == DataPool:GetPlayerMission_DataRound(510) then
		PushDebugMessage("#{SHXT_20211230_46}")
		return
	end
	Pet:Go_Fight(PETNUM)
end

function Pet_Free_Clicked()
	if(Pet : GetIsFighting(PETNUM)) then
		--此为BUG 3921中杨婷的原话，在策划案中并没有该需求。
		--但项目紧急，没时间确认，所以就以BUG系统为准。
		PushDebugMessage("珍兽正在出战，不能被放生")
		return;
	end
	if(PlayerPackage:IsPetLock(PETNUM) == 1)    then
		PushDebugMessage("珍兽已加锁")
		return;
	end
	local _,nGUID = Pet : GetID(PETNUM);
	if  tonumber(nGUID, 16) == DataPool:GetPlayerMission_DataRound(510) then
		PushDebugMessage("珍兽已被附身，不能被放生")
		return
	end	
	if Pet:GetPetLocation(PETNUM) ~= -1 then
		PushDebugMessage("珍兽正在进行其他操作，不能放生。")
		return;
	end	
	--处理服务端数据清理
	local hid,lid = Pet:GetGUID(PETNUM)
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "DelPetRestData" );
		Set_XSCRIPT_ScriptID( 900009 );	
		Set_XSCRIPT_Parameter(0,hid)
		Set_XSCRIPT_Parameter(1,lid)
		Set_XSCRIPT_Parameter(2,PETNUM)
		Set_XSCRIPT_ParamCount(3);
	Send_XSCRIPT()
	Pet_Page_Clear();
	Pet_Update();
end

function Pet_LockPet_Clicked()
			PushDebugMessage("暂不支持。")
end
-- function Pet_LockPet_Clicked()
	-- PlayerPackage:OpenLockFrame(2);
-- end
function Pet_Feed_Clicked()
	Pet:Feed(PETNUM);
end

function Pet_Dome_Clicked()
	Pet:Dome(PETNUM);
end

function Pet_AmendName_Clicked()
	if(not (Pet:IsPresent(PETNUM)) ) then
		return;
	end
	strName = Pet_PetName : GetText()
	Changed_Name_Flag = 0;
	AxTrace(0,1,"string.len(strName)="..string.len(strName));
	if(string.len(strName) < 2  or string.len(strName) > 12 ) then
		Pet_Update();
		return;
	end
	Pet : Change_Name(PETNUM,Pet_PetName : GetText());
end

function Pet_Skill_Button_Clicked(nIndex)
--将来主动技能和被动技能，可以在表里查到。
	if(nIndex < 3) then
		
	end

	PETSKILL_BUTTONS[nIndex] : DoAction();

	local SumPetSkill = GetActionNum("petskill");
	local k=1;
	for i=1, SumPetSkill do
		local theSkillAction = EnumAction( i-1, "petskill");
		if( (theSkillAction : GetPetSkillOwner() == nIndex) and (k <= PETSKILL_BUTTONS_NUM ) ) then
			PETSKILL_BUTTONS[k]:SetActionItem(theSkillAction:GetID());
			k = k + 1;
		end
	end
end

----------------------------------------------------------------------------------
--
-- 旋转珍兽模型（向左)
--
function Pet_Modle_TurnLeft(start)
	--向左旋转开始
	if(start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		Pet_FakeObject:RotateBegin(-0.3);
	--向左旋转结束
	else
		Pet_FakeObject:RotateEnd();
	end
end

----------------------------------------------------------------------------------
--
--旋转珍兽模型（向右)
--
function Pet_Modle_TurnRight(start)
	--向右旋转开始
	if(start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		Pet_FakeObject:RotateBegin(0.3);
	--向右旋转结束
	else
		Pet_FakeObject:RotateEnd();
	end
end

function Pet_SelfEquip_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1);

	OpenEquip(1);
	Pet_Close();
	Pet_SelfEquip : SetCheck(0);
	Pet_SelfData : SetCheck(0);
	Pet_Pet : SetCheck(1);
	
end

function Pet_Skill_Clicked(nSkillIndex)

	AxTrace(0,1,"234PETNUM="..PETNUM);

	if(PETNUM < 0 or PETNUM > PET_MAX_NUMBER) then
		return;
	end
	
	if(not (Pet:IsPresent(PETNUM)) ) then
		return;
	end
	
	if Pet : GetSkillPassive(PETNUM,nSkillIndex-1) == 0 then

		PushDebugMessage("请将该技能拖拽到技能快捷栏使用 。");
	
	end

end

function Pet_OnHiden()
	Pet:NotifyPetDlgClosed()
	Pet_PetName:SetProperty("DefaultEditBox", "False");
	for i = 1, table.getn(g_PageTip) do
		g_PageTip[i]:Hide()
	end
end

function Pet_EnableAddButton()
		Pet_Str_Addition:Enable();
		Pet_Int_Addition:Enable();
		Pet_Dex_Addition:Enable();
		Pet_PF_Addition:Enable();
		Pet_Sta_Addition:Enable();
end

function Pet_EnableSubButton()
		Pet_Str_Subtraction:Enable();
		Pet_Int_Subtraction:Enable();
		Pet_Dex_Subtraction:Enable();
		Pet_PF_Subtraction:Enable();
		Pet_Sta_Subtraction:Enable();
end

function Pet_DisableAddButton()
		Pet_Str_Addition:Disable();
		Pet_Int_Addition:Disable();
		Pet_Dex_Addition:Disable();
		Pet_PF_Addition:Disable();
		Pet_Sta_Addition:Disable();
end

function Pet_DisableSubButton()
		Pet_Str_Subtraction:Disable();
		Pet_Int_Subtraction:Disable();
		Pet_Dex_Subtraction:Disable();
		Pet_PF_Subtraction:Disable();
		Pet_Sta_Subtraction:Disable();
end

function Pet_Refresh_ADDSUB_Button()
	
	if PETATTR[1] ~= nil and PETATTR[1] > 0 then
		Pet_Str_Subtraction:Enable();
		Pet_Accept:Enable();
		Pet_Cancel:Enable();
	end
	if PETATTR[2] ~= nil and PETATTR[2] > 0 then
		Pet_Int_Subtraction:Enable();
		Pet_Accept:Enable();
		Pet_Cancel:Enable();
	end
	if PETATTR[3] ~= nil and PETATTR[3] > 0 then
		Pet_Dex_Subtraction:Enable();
		Pet_Accept:Enable();
		Pet_Cancel:Enable();
	end
	if PETATTR[4] ~= nil and PETATTR[4] > 0 then
		Pet_PF_Subtraction:Enable();
		Pet_Accept:Enable();
		Pet_Cancel:Enable();
	end
	if PETATTR[5] ~= nil and PETATTR[5] > 0 then
		Pet_Sta_Subtraction:Enable();
		Pet_Accept:Enable();
		Pet_Cancel:Enable();
	end
	
	if PET_POTREMAIN > 0 then
		AxTrace(0,1,"yes here")
		Pet_EnableAddButton();
		Pet_Accept:Enable();
		Pet_Cancel:Enable();
	else
		Pet_DisableAddButton();
	end
	
	local Sum_Attr = 0;
	for i=1,PET_ATTR_COUNT do
		if PETATTR[i] ~= nil and PETATTR[i] > 0 then
			Sum_Attr = Sum_Attr + PETATTR[i];
		end
	end
	
	if PET_POTREMAIN <=0 and Sum_Attr <= 0 then
		Pet_Accept:Disable();
		Pet_Cancel:Disable();
	end
	
end

function PetName_Change()
	if Pet_PetName:GetText() ~= "" then
		Changed_Name_Flag = 0;
		AxTrace(0,1,"here");
	end
end

function Pet_Other_Info_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1);

	OtherInfoPage();
	Pet_Close();
	Pet_SelfEquip : SetCheck(0);
	Pet_SelfData : SetCheck(0);
	Pet_Pet : SetCheck(1);
	Pet_OtherInfo : SetCheck(0);
end

--打开自己的资料页面
function Pet_SelfData_Switch()
	Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1);

	SystemSetup:OpenPrivatePage("self");
	Pet_Close();
end


function Pet_Open()
	g_AutoClick_Going = -1
	g_AutoClick_BtnFlag = -1
	SetTimer("Pet", "Pet_AutoClick_Timer()", g_AutoClickTimer_Step)

	this:Show();
end
function Pet_Close()
	this:Hide();
end
function Pet_CloseFunction()
	g_AutoClick_Going = -1
	g_AutoClick_BtnFlag = -1
	KillTimer("Pet_AutoClick_Timer()")
	this:Hide();
end
function Pet_chenghao_Clicked()
	if(not (Pet:IsPresent(PETNUM)) ) then
		return;
	end
	Pet:PetOpenTitleList(PETNUM);
end

function Pet_Jian_Clicked()
	if(not (Pet:IsPresent(PETNUM)) ) then
		return;
	end
	Pet:PetOpenPetJian(PETNUM,"self");
end

function Pet_PetSoulEquip_RClick()
	local hid,lid = Pet:GetGUID(PET_CURRENT_SELECT)
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "PetSoulTakeOut" );
		Set_XSCRIPT_ScriptID( 900009 );	
		Set_XSCRIPT_Parameter(0,PETNUM)
		Set_XSCRIPT_Parameter(1,hid)
		Set_XSCRIPT_Parameter(2,lid)		
		Set_XSCRIPT_ParamCount(3);
	Send_XSCRIPT()
end

-- 珍兽附体
function Pet_Possession_Clicked()
	-- 已经提交到指定界面容器的珍兽不能出战
	if (IsWindowShow("PetSavvy") and Pet:GetPetLocation(PETNUM) == 12)			-- 用成年珍兽提升珍兽悟性
		or (IsWindowShow("PetSavvyGGD")	and Pet:GetPetLocation(PETNUM) == 3)	-- 用根骨丹提升珍兽悟性
		or (IsWindowShow("MissionReply") and Pet:GetPetLocation(PETNUM) == 7)	-- 任务提交物品或珍兽
		or (IsWindowShow("PetHuanhua") and Pet:GetPetLocation(PETNUM) == 5)		-- 珍兽在幻化，位置为5
		or (IsWindowShow("PetRHD") and Pet:GetPetLocation(PETNUM) == 17)		-- 提升珍兽融合度
		then
		-- 珍兽处于提交状态，无法附体。
		PushDebugMessage("#{ZSHT_BC_1008_05}")
		return
	end
	if Player:GetData("LEVEL") < 45 then
		PushDebugMessage("#{ZSHT_100809_11}");
		return
	end
	local _,lid = Pet:GetGUID(PET_CURRENT_SELECT);
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "PetCurrent" );
		Set_XSCRIPT_ScriptID(900009);
		Set_XSCRIPT_Parameter(0,0);
		Set_XSCRIPT_Parameter(1,lid);
		Set_XSCRIPT_ParamCount(2);
	Send_XSCRIPT()
end

-- 珍兽分离
function Pet_Restore_Clicked()
	local _,lid = Pet:GetGUID(PET_CURRENT_SELECT);
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "PetCurrent" );
		Set_XSCRIPT_ScriptID(900009);
		Set_XSCRIPT_Parameter(0,2);
		Set_XSCRIPT_Parameter(1,lid);
		Set_XSCRIPT_ParamCount(2);
	Send_XSCRIPT()
end

--zchw 一键卸装
function OneKeyUnEquip_Clicked()
	if Lua_IsPetHaveEquip() ~= 1 then
		return
	end
	local _,lid = Pet:GetGUID(PET_CURRENT_SELECT);
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "PetEquipOnOutOneKey" );
		Set_XSCRIPT_ScriptID(900009);
		Set_XSCRIPT_Parameter(0,lid);
		Set_XSCRIPT_ParamCount(1);
	Send_XSCRIPT()
end
function PetEquip_Equip_Click(num, nType)
	local Pet_Head  = DataPool:GetXYJServerData(15)
	local Pet_Claw  = DataPool:GetXYJServerData(16)
	local Pet_Body  = DataPool:GetXYJServerData(17)
	local Pet_Neck  = DataPool:GetXYJServerData(18)
	local Pet_Charm = DataPool:GetXYJServerData(19)
	local nEquipTab = {Pet_Head,Pet_Claw,Pet_Body,Pet_Neck,Pet_Charm}
	if nEquipTab[num] == 0 then
		return
	end
	if nType ==0 then
		local hid,lid = Pet:GetGUID(PET_CURRENT_SELECT);
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name( "PetEquipOnOut" );
			Set_XSCRIPT_ScriptID(900009);
			Set_XSCRIPT_Parameter(0,hid);
			Set_XSCRIPT_Parameter(1,lid);
			Set_XSCRIPT_Parameter(2,num);
			Set_XSCRIPT_ParamCount(3);
	    Send_XSCRIPT()
	end
end
function Lua_IsPetHaveEquip()
	local Pet_Head  = DataPool:GetXYJServerData(15)
	local Pet_Claw  = DataPool:GetXYJServerData(16)
	local Pet_Body  = DataPool:GetXYJServerData(17)
	local Pet_Neck  = DataPool:GetXYJServerData(18)
	local Pet_Charm = DataPool:GetXYJServerData(19)
	if Pet_Head > 0 then
		return 1
	end
	if Pet_Claw > 0 then
		return 1
	end
	if Pet_Body > 0 then
		return 1
	end
	if Pet_Neck > 0 then
		return 1
	end
	if Pet_Charm > 0 then
		return 1
	end
	return 0
end

function nServerDataSub(Data)
	local nServerData = tostring(Data)
	local nData = {}
	for i = 1,string.len(nServerData) do
		nData[i] = string.sub(nServerData,i,i)
	end
	nData[4] = "8"
	local nFData = ""
	for i = 1,8 do
		nFData = nFData..nData[i]
	end
	return tonumber(nFData)
end
--zchw
function Pet_Refresh_Equip()
	--  清空按钮显示图标
	g_Pet_Head : SetActionItem(-1);
	g_Pet_Claw : SetActionItem(-1);
	g_Pet_Body : SetActionItem(-1);
	g_Pet_Neck : SetActionItem(-1);
	g_Pet_Charm : SetActionItem(-1);
	local Pet_Head  = DataPool:GetXYJServerData(15)
	local Pet_Claw  = DataPool:GetXYJServerData(16)
	local Pet_Body  = DataPool:GetXYJServerData(17)
	local Pet_Neck  = DataPool:GetXYJServerData(18)
	local Pet_Charm = DataPool:GetXYJServerData(19)
	local nEquipTab = {Pet_Head,Pet_Claw,Pet_Body,Pet_Neck,Pet_Charm} 
	local nAction = {g_Pet_Claw,g_Pet_Head,g_Pet_Body,g_Pet_Neck,g_Pet_Charm} 
	for i = 1,5 do
	    if nEquipTab[i] >= 39980000 and nEquipTab[i] <= 39994162 then
			local PrizeAction = GemMelting:UpdateProductAction(nServerDataSub(nEquipTab[i]))	
			nAction[i]:SetActionItem(PrizeAction:GetID())
		else
            nAction[i]:SetActionItem(-1)		
		end
	end
	
	Pet_PetSoul_Equip:SetActionItem(-1)
	Pet_PetSoul1:SetActionItem(-1)
	Pet_PetSoul2:SetProperty( "BackImage", "" )
	Pet_PetSoul_Equip_Check:Disable()
	Pet_PetSoul_Equip_Mask:Hide()
	
	if Pet:LuaFnIsPetEquipPetSoul(PET_CURRENT_SELECT) == 1 then
		local ActionSoul = Pet:LuaFnGetPetSoulActionOnPet()
		if ActionSoul:GetID() ~= 0 then
			Pet_PetSoul_Equip:SetActionItem(ActionSoul:GetID())
		end
	
--		local skillAction = Pet:LuaFnEnumPetSoulSkillActionOnPet(PET_CURRENT_SELECT)
--		if skillAction ~= nil then
--			Pet_PetSoul1:SetActionItem(skillAction:GetID())
--		end
		
		Pet_PetSoul_Equip_Check:Enable()
		
		local _, szPetPossSkillIcon, _, _ = Pet:LuaFnGetPetSoulPossSkillInfo(PET_CURRENT_SELECT, 0)
		if szPetPossSkillIcon ~= "" then
			Pet_PetSoul2:SetProperty( "BackImage", szPetPossSkillIcon )
		end
	end
end
--***************************************************
-- 清空鼠标长按标记
--***************************************************
function Pet_AutoClick_Clear(id)
	id = tonumber(id)
	if (id == g_AutoClick_BtnFlag) then
		g_AutoClick_BtnFlag = -1
	end
end
--***************************************************
-- 定时器回调函数
--    实现慢启动, 以后可以考虑加速(必要性不大)
--***************************************************
function Pet_AutoClick_Timer()
	if (g_AutoClick_BtnFlag ~= -1) then
		-- 第一次LButton后经过X个Timer才算开始, 也就是说是 g_AutoClickTimer_Step * X 的时候开始进行自动加, 这样为了防止本来要点击一下的结果点了好多下
		if (g_AutoClick_Going < 4) then
			g_AutoClick_Going = g_AutoClick_Going + 1
		else
			--目前先设置 6 Step 的等待时间, 下面注释的代码可以后来用于实现慢启动, 逐渐加速效果.
			--if (g_AutoClick_Going == 2 or g_AutoClick_Going == 5) then
				--g_AutoClick_FunList[g_AutoClick_BtnFlag]()
			--end
			g_AutoClick_FunList[g_AutoClick_BtnFlag]()
		end
	end
end

--***************************************************
-- 鼠标左键松开操作
--    注意这里其实是代替 Click, 所以需要执行一次 Click 操作
--***************************************************
function Pet_AutoClick_LButtonUp(id)
	id = tonumber(id)
	Pet_AutoClick_Clear(id)
	g_AutoClick_FunList[id]()
end

--***************************************************
-- 设置定时器
--    设置标记说明鼠标已经按下
--***************************************************
function Pet_AutoClick_SetTimer(id)
	id = tonumber(id)
	g_AutoClick_Going = -1
	g_AutoClick_BtnFlag = id
end
--获取玩家当前等级最大携带数量(以后增加兽栏后要废除,而采用新的方法)-add by xindefeng
function GetMyCurMaxPetCount()
	local mylevel = Player:GetData("LEVEL") --获取玩家等级
	if mylevel == nil or type(mylevel) ~= "number" then
		return 2;
	end 
	local MaxCount = 0	--携带上限
	
	if mylevel < 21 then
		MaxCount = 2	--一开始就携带上限就是2
	elseif mylevel < 41 then
		MaxCount = 3
	elseif mylevel < 61 then
		MaxCount = 4
	elseif mylevel < 81 then
		MaxCount = 5
	else
		MaxCount = 6
	end
	MaxCount = MaxCount + Player:GetData("PET_EXTRANUM")
	
	if MaxCount > PET_MAX_NUMBER then
		MaxCount = PET_MAX_NUMBER
	end
	
	return MaxCount
end
function Pet_Xiulian_Switch()
    nLevel = Player:GetData("LEVEL")
	if(nLevel >= 70) then
		Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1);
		XiuLianPage();
		Pet_Close();
	else
	    Pet_Xiulian : SetCheck(0);
	    PushDebugMessage("#{XL_090707_62}")
	end
end
--显示武魂UI
function Pet_Wuhun_Switch()
	Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1);
	ToggleWuhunPage();		
	Pet_Close();
end
--切换天赋页
function Pet_Talent_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1);
	ToggleTalentPage();
	Pet_Close();
end


function Pet_OnPageClicked(idx)
	Variable:SetVariable("PageNumber", tostring(idx), 1)
	idx = g_PageOrder[idx]
	if idx == 1 then--装备
		Pet_SelfEquip_Page_Switch()
	elseif idx == 2 then--资料
		Pet_SelfData_Switch()
	elseif idx == 3 then--珍兽
		--SelfData_Pet_Down()
		Pet_ClearPage()
	elseif idx == 4 then--武魂
		Pet_Wuhun_Switch()
	elseif idx == 5 then--修炼
		Pet_Xiulian_Switch()
	elseif idx == 6 then--武道
		Pet_Talent_Page_Switch()
	elseif idx == 7 then--灵玉
		Pet_Lingyu_Page_Switch()
	elseif idx == 8 then--神兵
		Pet_Page_ShenBing()
	elseif idx == 9 then
		--SelfData_Profile_Switch()
	elseif idx == 10 then--其他
		Pet_Other_Info_Page_Switch()
	end
end

function Pet_CheckPage(idx)
	if idx == 1 then--装备
		return 1
	elseif idx == 2 then--资料
		return 1
	elseif idx == 3 then--珍兽
		return 1
	elseif idx == 4 then--武魂
		return 1
	elseif idx == 5 then--修炼
		return 1
	elseif idx == 6 then--武道
		return 1
	elseif idx == 7 then--灵玉
		return 1
	elseif idx == 8 then--神兵
		return 1
	elseif idx == 9 then--珍藏
		local my_level = Player:GetData("LEVEL")
		if my_level >= 149 then
			return 1
		end
	elseif idx == 10 then--其他
		 return 1
	end
	return 0
end

function Pet_IsPageEnable(idx)
	if idx == 1 then--装备
		return 1
	elseif idx == 2 then--资料
		return 1
	elseif idx == 3 then--珍兽
		return 1
	elseif idx == 4 then--武魂
			return 1
	elseif idx == 5 then--修炼
	  local my_level = Player:GetData("LEVEL")
		if my_level >= 70 then
			return 1
		end
	elseif idx == 6 then--武道
		local my_level = Player:GetData("LEVEL")
		if my_level >= 60 then
			return 1
		end
	elseif idx == 7 then--灵玉
		local my_level = Player:GetData("LEVEL")
		if my_level >= 85 then
			return 1
		end
	elseif idx == 8 then--神兵
		local my_level = Player:GetData("LEVEL")
		if my_level >= 65 then
			return 1
		end
	elseif idx == 9 then--个人
		return 1
	elseif idx == 10 then--其他
		return 1
	end
	return 0
end

function Pet_ClearPage()
	Variable:SetVariable("PageNumber", tostring(0), 1)
end

function Pet_PetSoul_ShowInfo()
	
	if Pet:LuaFnIsPetEquipPetSoul(PET_CURRENT_SELECT) ~= 1 then
		return
	end
	
	PushEvent("UI_COMMAND",2022050401,0, PET_CURRENT_SELECT)
--	PushEvent("UI_COMMAND",2022050301,0)
end

function Pet_PetSoul2_MouseEnter()
	
	if Pet:LuaFnIsPetEquipPetSoul(PET_CURRENT_SELECT) ~= 1 then
		return
	end
	
	local left, right, top, bottom = Pet_PetSoul2:GetPixelRect()
	
	PushEvent("UI_COMMAND",2022042001,1,PET_CURRENT_SELECT, left, top, right, bottom,0)
	
end

function Pet_PetSoul2_MouseLeave()
	
	local left, right, top, bottom = Pet_PetSoul2:GetPixelRect()
	PushEvent("UI_COMMAND",2022042001,0,PET_CURRENT_SELECT, left, top, right, bottom,0)
	
end

function Pet_GetSavvyAndLingXing(nSavvy)
	--悟性灵性的装换表
	local tSavvyLingXinTab = {
			{1,0},
			{2,0},
			{3,0},
			{4,0},
			{5,0},
			{6,0},
			{7,0},
			{8,0},
			{9,0},
			{10,0},
			{11,0},
			{12,0},
			{13,0},
			{14,0},
			{15,0},
			{0,1},
			{1,1},
			{2,1},
			{3,1},
			{4,1},
			{5,1},
			{6,1},
			{7,1},
			{8,1},
			{9,1},
			{10,1},
			{11,1},
			{12,1},
			{13,1},
			{14,1},
			{15,1},
			{0,2},
			{1,2},
			{2,2},
			{3,2},
			{4,2},
			{5,2},
			{6,2},
			{7,2},
			{8,2},
			{9,2},
			{10,2},
			{11,2},
			{12,2},
			{13,2},
			{14,2},
			{15,2},
			{0,3},
			{1,3},
			{2,3},
			{3,3},
			{4,3},
			{5,3},
			{6,3},
			{7,3},
			{8,3},
			{9,3},
			{10,3},
			{11,3},
			{12,3},
			{13,3},
			{14,3},
			{15,3},
			{0,4},
			{1,4},
			{2,4},
			{3,4},
			{4,4},
			{5,4},
			{6,4},
			{7,4},
			{8,4},
			{9,4},
			{10,4},
			{11,4},
			{12,4},
			{13,4},
			{14,4},
			{15,4},
			{0,5},
			{1,5},
			{2,5},
			{3,5},
			{4,5},
			{5,5},
			{6,5},
			{7,5},
			{8,5},
			{9,5},
			{10,5},
			{11,5},
			{12,5},
			{13,5},
			{14,5},
			{15,5},
			{0,6},
			{1,6},
			{2,6},
			{3,6},
			{4,6},
			{5,6},
			{6,6},
			{7,6},
			{8,6},
			{9,6},
			{10,6},
			{11,6},
			{12,6},
			{13,6},
			{14,6},
			{15,6},
			{0,7},
			{1,7},
			{2,7},
			{3,7},
			{4,7},
			{5,7},
			{6,7},
			{7,7},
			{8,7},
			{9,7},
			{10,7},
			{11,7},
			{12,7},
			{13,7},
			{14,7},
			{15,7},
			{0,8},
			{1,8},
			{2,8},
			{3,8},
			{4,8},
			{5,8},
			{6,8},
			{7,8},
			{8,8},
			{9,8},
			{10,8},
			{11,8},
			{12,8},
			{13,8},
			{14,8},
			{15,8},
			{0,9},
			{1,9},
			{2,9},
			{3,9},
			{4,9},
			{5,9},
			{6,9},
			{7,9},
			{8,9},
			{9,9},
			{10,9},
			{11,9},
			{12,9},
			{13,9},
			{14,9},
			{15,9},
			{0,10},
			{1,10},
			{2,10},
			{3,10},
			{4,10},
			{5,10},
			{6,10},
			{7,10},
			{8,10},
			{9,10},
			{10,10},
			{11,10},
			{12,10},
			{13,10},
			{14,10},
			{15,10},
		}
	if nSavvy >= 1 and nSavvy<= 176 then
		return tSavvyLingXinTab[nSavvy][1],tSavvyLingXinTab[nSavvy][2]
	end
	return 0,0
end
function Pet_Page_ShenBing()
	Variable:SetVariable("SelfUnionPos", Pet_Frame:GetProperty("UnifiedPosition"), 1)
	LuaFnToggleShenBingPage()
	this:Hide()
end
function Pet_Lingyu_Page_Switch()
	PushEvent("UI_COMMAND", 1359689920)
end