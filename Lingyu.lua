--!!!reloadscript =Lingyu

local g_Lingyu_Frame_UnifiedXPosition
local g_Lingyu_Frame_UnifiedYPosition

local g_LingYuAttrElement = {}

local g_LingYuAction = {}

local g_LingYuData = {}

--ͳһ����ҳǩ��ʾ���� Ŀǰ�̶�˳�� ��������� ÿ��ҳǩ����Ҫ���
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
local g_PageButton = {}
local g_PageTip = {}
local g_PageMask = {}
local g_MaxPage = 10
local g_PageCount = 10
local g_PageOrder = {}

function Lingyu_PreLoad()
	this:RegisterEvent("UI_COMMAND")
	--player quit game
	this:RegisterEvent("PLAYER_LEAVE_WORLD", false)
	--update equip
	this:RegisterEvent("REFRESH_EQUIP", false)
	this:RegisterEvent("UNIT_LEVEL", false)

	-- ��Ϸ���ڳߴ緢���˱仯
	this:RegisterEvent("ADJEST_UI_POS")
	-- ��Ϸ�ֱ��ʷ����˱仯
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
	
	this:RegisterEvent("UPDATE_EXTERIOR_TIP")
	
end

function Lingyu_OnLoad()

	-- ��������Ĭ�����λ��
	g_Lingyu_Frame_UnifiedXPosition	= Lingyu_Frame:GetProperty("UnifiedXPosition")
	g_Lingyu_Frame_UnifiedYPosition	= Lingyu_Frame:GetProperty("UnifiedYPosition")
	
	g_PageButton[1] = Lingyu_SelfEquip
	g_PageButton[2] = Lingyu_SelfData
	g_PageButton[3] = Lingyu_Pet
	g_PageButton[4] = Lingyu_Lingyu
	g_PageButton[5] = Lingyu_Xiulian
	g_PageButton[6] = Lingyu_Talent	
	g_PageButton[7] = Lingyu_Lingyu
	g_PageButton[8] = Lingyu_Weapon2
	g_PageButton[9] = Lingyu_Profile
	g_PageButton[10] = Lingyu_OtherInfo
	
	
	g_PageMask[1] = Lingyu_SelfEquip_Mask
	g_PageMask[2] = Lingyu_SelfData_Mask
	g_PageMask[3] = Lingyu_Pet_Mask
	g_PageMask[4] = Lingyu_Lingyu_Mask
	g_PageMask[5] = Lingyu_Xiulian_Mask
	g_PageMask[6] = Lingyu_Talent_Mask
	g_PageMask[7] = Lingyu_Lingyu_Mask
	g_PageMask[8] = Lingyu_Weapon2_Mask
	g_PageMask[9] = Lingyu_Profile_Mask
	g_PageMask[10] = Lingyu_OtherInfo_Mask

	g_PageTip[1] = Lingyu_SelfEquip_tips
	g_PageTip[2] = Lingyu_SelfData_tips
	g_PageTip[3] = Lingyu_Pet_tips
	g_PageTip[4] = Lingyu_Wuhun_tips
	g_PageTip[5] = Lingyu_Xiulian_tips
	g_PageTip[6] = Lingyu_Talent_tips	
	g_PageTip[7] = Lingyu_Lingyu_tips
	g_PageTip[8] = Lingyu_Weapon2_tips
	g_PageTip[9] = Lingyu_Profile_tips
	g_PageTip[10] = Lingyu_OtherInfo_tips
	
	g_LingYuAction[1] = Lingyu_Plan_Item1
	g_LingYuAction[2] = Lingyu_Plan_Item2
	g_LingYuAction[3] = Lingyu_Plan_Item3
	g_LingYuAction[4] = Lingyu_Plan_Item4
	g_LingYuAction[5] = Lingyu_Plan_Item5
	g_LingYuAction[6] = Lingyu_Plan_Item6
	g_LingYuAttrElement = {item = {}, title = {},value = {}}
	for i = 1, 18 do
		g_LingYuAttrElement.item[i] =  _G[string.format("Lingyu_ListContent_Item%d",i)]
		g_LingYuAttrElement.title[i] =  _G[string.format("Lingyu_PropertiesText%d",i)]
		g_LingYuAttrElement.value[i] =  _G[string.format("Lingyu_Properties%d",i)]
	end
end

function Lingyu_OnEvent(event)

	if event == "PLAYER_LEAVE_WORLD" then
		this:Hide()
		return
	end
	
	if(event == "UI_COMMAND" and tonumber(arg0) == 1359689920) then
		if this:IsVisible() then
			this:Hide()
			return
		end
		Lingyu_ShowPage()
		Lingyu_Update()
		this:Show()
		
		---Lingyu_ShowPage()
		Lingyu_UpdateRedPoint()
		return
	end
	
	if event == "REFRESH_EQUIP" and this:IsVisible() then
		Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1)
		Lingyu_Update()
	end

	if event == "ADJEST_UI_POS" or event == "VIEW_RESOLUTION_CHANGED" then
		-- ���±�������λ��
		Lingyu_Frame_On_ResetPos()
	end

	if event == "UNIT_LEVEL" and this:IsVisible() then
		Lingyu_Update()	
	end
	
	if(event == "UI_COMMAND" and tonumber(arg0) == 961799378) then
		g_LingYuData = {equip = {}, skill = 0, attr = {}, effect = {}}
		for i = 1, 6 do
			local nLingYuID, nLingYuData = Get_XParam_INT(i - 1), Get_XParam_STR(i - 1)
			if nLingYuID and nLingYuData then
				g_LingYuData.equip[i] = {id = nLingYuID, attr_str = nLingYuData}
			end
		end
		local nSkillID = Get_XParam_INT(6)
		if nSkillID ~= nil then
			g_LingYuData.skill = nSkillID 
		end
		g_LingYuData = LuaFnUpdataLingYuData(g_LingYuData)
		if this:IsVisible() then
			Lingyu_Update()	
		end	
	end
	
	if event == "UPDATE_EXTERIOR_TIP" and this:IsVisible() then
		Lingyu_UpdateRedPoint()
	end
	
	
end

function LuaFnGetLingYuBaseInfo(nItemID)
	local nProductRank = math.ceil((nItemID - 10156999) / 36)
    local nProductKitType = math.mod((nItemID - 10156999) , 36)
    local nProductType = math.mod((nItemID - 10157000), 6) + 1
    if nProductKitType == 0 then
    	nProductKitType = 6
    else
    	nProductKitType = math.ceil(((nProductKitType) / 6))
    end
    return nProductRank, nProductKitType, nProductType
end
function LuaFnGetLingYuTipInfo(nItemName, nItemID, nAuthor)
	local nProductRank, nProductKitType, nProductType = 0, 0, 0
	if nItemID ~= nil then
		nProductRank, nProductKitType, nProductType = LuaFnGetLingYuBaseInfo(nItemID)
	end
    local nRankName, nBaseAttrStr, nKitEffectStr, nExtendedAttrStr = "�ƽ�", "", "", ""
    if nProductRank and nProductType and nProductRank >= 1 and nProductRank <= 4 and nProductType >= 1 and nProductType <= 6 then
    	local nRankNameList = {"�ƽ�", "����", "�ؽ�", "���"}
    	local nColorItemName = {"#G", "#B", "#ccc33cc", "#cff6633"}
    	nRankName = nRankNameList[nProductRank]
    	nItemName = nColorItemName[nProductRank] .. string.gsub(nItemName, "#%w+", "")
    	local g_LingYuBaseAttrInfo = {
    	    [1] = {
    	        [1] = {1110, 0, 0, 0, 0, 0, 0, 0},
    	        [2] = {0, 177, 177, 0, 0, 0, 0, 0},
    	        [3] = {0, 0, 0, 177, 177, 0, 0, 0},
    	        [4] = {0, 0, 0, 0, 0, 220, 0, 0},
    	        [5] = {0, 0, 0, 0, 0, 0, 73, 0},
    	        [6] = {0, 0, 0, 0, 0, 0, 0, 2}
    	    },
    	    [2] = {
    	        [1] = {1876, 0, 0, 0, 0, 0, 0, 0},
    	        [2] = {0, 299, 299, 0, 0, 0, 0, 0},
    	        [3] = {0, 0, 0, 299, 299, 0, 0, 0},
    	        [4] = {0, 0, 0, 0, 0, 372, 0, 0},
    	        [5] = {0, 0, 0, 0, 0, 0, 124, 0},
    	        [6] = {0, 0, 0, 0, 0, 0, 0, 4}
    	    },
    	    [3] = {
    	        [1] = {2795, 0, 0, 0, 0, 0, 0, 0},
    	        [2] = {0, 446, 446, 0, 0, 0, 0, 0},
    	        [3] = {0, 0, 0, 446, 446, 0, 0, 0},
    	        [4] = {0, 0, 0, 0, 0, 554, 0, 0},
    	        [5] = {0, 0, 0, 0, 0, 0, 185, 0},
    	        [6] = {0, 0, 0, 0, 0, 0, 0, 7}
    	    },
    	    [4] = {
    	        [1] = {3830, 0, 0, 0, 0, 0, 0, 0},
    	        [2] = {0, 612, 612, 0, 0, 0, 0, 0},
    	        [3] = {0, 0, 0, 612, 612, 0, 0, 0},
    	        [4] = {0, 0, 0, 0, 0, 760, 0, 0},
    	        [5] = {0, 0, 0, 0, 0, 0, 254, 0},
    	        [6] = {0, 0, 0, 0, 0, 0, 0, 10}
    	    }
    	}
    	if g_LingYuBaseAttrInfo[nProductRank] and g_LingYuBaseAttrInfo[nProductRank][nProductType] then
    		local nBaseAttrInfo = g_LingYuBaseAttrInfo[nProductRank][nProductType]
    		local nBaseAttrName = {"Ѫ����", "�����ڹ�����", "�����⹥����", "�����ڹ�����", "�����⹦����", "��������", "��������", "����"}
    		for i = 1, table.getn(nBaseAttrInfo) do
    			if nBaseAttrInfo[i] and nBaseAttrInfo[i] > 0 then
    				nBaseAttrStr = nBaseAttrStr .. "#cffcc99" .. nBaseAttrName[i] .. " +" .. tostring(nBaseAttrInfo[i]) .. "\n"
    			end
    		end
    	end
    end
    if nAuthor then
    	local nAttrType1, nAttrValue1, nAttrScale1, nAttrScaleValue1, nAttrType2, nAttrValue2, nAttrScale2, nAttrScaleValue2, nAttrType3, nAttrValue3, nAttrScale3, nAttrScaleValue3 = LuaFnParseLingYuAttrData(nAuthor)
    	local function buildExtendedAttrStr(nAttrType, nAttrValue, nAttrScale)
    		local nAttrName = {"Ѫ����", "������", "������", "������", "����Ŀ�����", "�𹥻�", "����", "����Ŀ���", "������", "������", "����Ŀ������", "������", "������", "����Ŀ�궾��", "�⹦����", "�⹦����", "�ڹ�����", "�ڹ�����", "����", "����", "����", "����", "����", "����", "����", "��", "���ķ���", "��������", "����˺�����", "�ܵ��˺�����"}
    		local nResultStr = ""
    		if nAttrType and nAttrType >= 1 and nAttrType <= 30 then
    			if nAttrValue and nAttrValue > 0 then
    				if nAttrScale and nAttrScale > 0 then
    					return string.format("#cffcc00%s +%d #c00ffff+%d%%\n", nAttrName[nAttrType], nAttrValue, nAttrScale)
    				else
    					return string.format("#cffcc00%s +%d\n", nAttrName[nAttrType], nAttrValue)
    				end
    			end
    		end
    		return nResultStr
    	end
    	nExtendedAttrStr = nExtendedAttrStr .. buildExtendedAttrStr(nAttrType1, nAttrValue1, nAttrScale1)
    	nExtendedAttrStr = nExtendedAttrStr .. buildExtendedAttrStr(nAttrType2, nAttrValue2, nAttrScale2)
    	nExtendedAttrStr = nExtendedAttrStr .. buildExtendedAttrStr(nAttrType3, nAttrValue3, nAttrScale3)
    end
    if nProductKitType and nProductKitType >= 1 and nProductKitType <= 6 then
    	local nKitEffectList = {"#Y���������䡿��#r#G3����Ѫ�������ӣ�#r6������ü��ܣ�#r�����Ӱ��ʹ�õ�һ���ķ���һ�����ܹ���5����Ŀ��ʱ���и��ʴ�����ʹ�����ƶ��ٶ����ӣ������߼��٣�����8�룬�����ڼ䲻���ظ�������������ɽׯ����ɢ״̬�£��������ʽ��ͣ�","#Y��ĺ�����䡿#r#G3�����������Թ������ӣ�#r6������ü��ܣ�#rĺ��������ʹ�ú�����Ŀ����и�����ȡ������˺��Ĳ���Ѫ������������10�룬��ȴʱ��100�롣��Ŀ��Ϊ����ʱ����ȡ�����ͣ�","#Y���ǻ����䡿#r#G3�����������ӣ�#r6������ü��ܣ�#r�ǻԲ�ҹ��ʹ�ú�ʹ�õ�һ���ķ���һ����������Ŀ�겢��Ŀ����ɻ���һ��ʱ���и���ʹĿ�����1�룬״̬����10�룬��ȴʱ��120�롣������ɽׯ����ɢ״̬�£��������ʽ��ͣ�","#Y��������䡿#r#G3�����������ӣ�#r6������ü��ܣ�#r��羻�ƣ�ʹ�ú��ܵ��˺�ʱ�������ܵ����˺�������8�룬��ȴʱ��120�롣	","#Y��ҹѩ���䡿#r#G3�����������ӣ�#r6������ü��ܣ�#rҹѩ���񣺶���ԡ�ʧ����ɢ������Ѩ����ӡ��Ŀ����ɵ��˺���ߡ�","#Y���������䡿#r#G3���������������ӣ�#r6������ü��ܣ�#r����ӵ�꣺�Ը���С���ѷ�Ŀ��ʹ�ã��ɳ����Ŀ����ߣ�ͬʱ�������Ŀ����ͷ�һ�����ܣ��������ղ����˺�������3�롣��ȴʱ��120�롣"}
    	nKitEffectStr = " \n"..nKitEffectList[nProductKitType]
    end
    return nItemName, nRankName, nBaseAttrStr, nExtendedAttrStr, nKitEffectStr
end
function LuaFnParseLingYuAttrData(attrData)
    local nAttrSort1, nAttrSort2, nAttrSort3 = 0, 0, 0
    local nAttrScaleValue1, nAttrScaleValue2, nAttrScaleValue3 = 0, 0, 0
    local _, _, nAttrType1, nAttrValue1, nAttrScale1, nAttrType2, nAttrValue2, nAttrScale2, nAttrType3, nAttrValue3, nAttrScale3 = string.find(attrData, "&LY(%w)(%w%w%w)(%w%w)(%w)(%w%w%w)(%w%w)(%w)(%w%w%w)(%w%w)")
    if nAttrType1 and nAttrValue1 and nAttrScale1 and nAttrType2 and nAttrValue2 and nAttrScale2 and nAttrType3 and nAttrValue3 and nAttrScale3 then
    	local function LuaFnBase32To10(str)
    		str = string.upper(str)
    		local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUV"
    		local num = 0
    		local weight = 1
    		for i = string.len(str), 1, -1 do
    			local digit = string.find(digits, string.sub(str, i, i), 1, true)
    			if digit then
    				num = num + (digit - 1) * weight
    				weight = weight * 32
    			else
    				return 0
    			end
    		end
    		return num
    	end
    	nAttrType1 = LuaFnBase32To10(nAttrType1)
    	nAttrType2 = LuaFnBase32To10(nAttrType2)
    	nAttrType3 = LuaFnBase32To10(nAttrType3)
    	nAttrValue1 = LuaFnBase32To10(nAttrValue1)
    	nAttrScale1 = LuaFnBase32To10(nAttrScale1)
    	nAttrValue2 = LuaFnBase32To10(nAttrValue2)
    	nAttrScale2 = LuaFnBase32To10(nAttrScale2)
    	nAttrValue3 = LuaFnBase32To10(nAttrValue3)
    	nAttrScale3 = LuaFnBase32To10(nAttrScale3)
    	local nAttrSort = {1,2,3,8,25,4,7,26,5,9,27,6,10,28,11,12,13,14,15,17,16,18,19,20,21,22,23,24,29,30}
    	local nUnSortAttr = {{nAttrType1, nAttrValue1, nAttrScale1, nAttrSort[nAttrType1], 1}, {nAttrType2, nAttrValue2, nAttrScale2, nAttrSort[nAttrType2], 2}, {nAttrType3, nAttrValue3, nAttrScale3, nAttrSort[nAttrType3], 3}}
    	for i = 1, 3 do
    		for j = 1, 3 - i do
    			if nUnSortAttr[j][4] == nil then
    				nUnSortAttr[j][4] = 31
    			end
    			if nUnSortAttr[j+1][4] == nil then
    				nUnSortAttr[j+1][4] = 31
    			end
    			if nUnSortAttr[j][4] > nUnSortAttr[j+1][4] then
    				nUnSortAttr[j], nUnSortAttr[j+1] = nUnSortAttr[j+1], nUnSortAttr[j]
    			end
    		end
    	end
    	nAttrType1, nAttrValue1, nAttrScale1, nAttrSort1 = nUnSortAttr[1][1], nUnSortAttr[1][2], nUnSortAttr[1][3], nUnSortAttr[1][5]
    	nAttrType2, nAttrValue2, nAttrScale2, nAttrSort2 = nUnSortAttr[2][1], nUnSortAttr[2][2], nUnSortAttr[2][3], nUnSortAttr[2][5]
    	nAttrType3, nAttrValue3, nAttrScale3, nAttrSort3 = nUnSortAttr[3][1], nUnSortAttr[3][2], nUnSortAttr[3][3], nUnSortAttr[3][5]
    	local calculateAttrValue = function (attrValue, attrScale)
    		if attrValue > 0 then
    			if attrScale > 0 then
    				return attrValue + (attrValue * attrScale)/100
    			end
    			return attrValue
    		end
    		return 0
    	end
    	nAttrScaleValue1 = calculateAttrValue(nAttrValue1, nAttrScale1)
    	nAttrScaleValue2 = calculateAttrValue(nAttrValue2, nAttrScale2)
    	nAttrScaleValue3 = calculateAttrValue(nAttrValue3, nAttrScale3)
    end
    return nAttrType1, nAttrValue1, nAttrScale1, nAttrScaleValue1, nAttrType2, nAttrValue2, nAttrScale2, nAttrScaleValue2, nAttrType3, nAttrValue3, nAttrScale3, nAttrScaleValue3, nAttrSort1, nAttrSort2, nAttrSort3
end
function LuaFnUpdataLingYuData(nGlobalLingYuData)
	local nAttrList, nSortAttrList, nKitData = {}, {}, {}
    local nKitInfo = {
    	{kit_name = "����(%d��)", skill_name = "�����Ӱ", attr_type = "Ѫ����", attr_values = {1109, 1952, 3150, 4438}},
    	{kit_name = "ĺ��(%d��)", skill_name = "ĺ������", attr_type = "�������Թ���", attr_values = {10, 17, 28, 40}}, 
    	{kit_name = "�ǻ�(%d��)", skill_name = "�ǻԲ�ҹ", attr_type = "����", attr_values = {3, 6, 10, 15}}, 
    	{kit_name = "���(%d��)", skill_name = "��羻��", attr_type = "����", attr_values = {90, 158, 255, 360}}, 
    	{kit_name = "ҹѩ(%d��)", skill_name = "ҹѩ����", attr_type = "����", attr_values = {270, 475, 766, 1080}}, 
    	{kit_name = "����(%d��)", skill_name = "����ӵ��", attr_type = "��������", attr_values = {5, 8, 13, 20}}, 
    }
	local nAttrSort = {1,2,3,8,25,4,7,26,5,9,27,6,10,28,11,12,13,14,15,17,16,18,19,20,21,22,23,24,29,30}
	local function nUpdateAttrDataFunc(nAttrType, nAttrValue)
    	if nAttrType and nAttrType >= 1 and nAttrType <= 30 then
    		if nAttrValue and nAttrValue > 0 then
    			if nAttrList[nAttrType] == nil then
    				nAttrList[nAttrType] = nAttrValue
    			else
    				nAttrList[nAttrType] = nAttrList[nAttrType] + nAttrValue
    			end
    		end
    	end
    end
	for i = 1, 6 do
		if nGlobalLingYuData.equip and nGlobalLingYuData.equip[i] and nGlobalLingYuData.equip[i].id and nGlobalLingYuData.equip[i].attr_str then
			local nItemID = nGlobalLingYuData.equip[i].id
			if nItemID >= 10157000 and nItemID <= 10157143 then
				local nProductRank, nProductKitType, nProductType = LuaFnGetLingYuBaseInfo(nItemID)
				if nProductKitType >= 1 and nProductKitType <= 6 then
					if nKitData[nProductKitType] then
						if nKitData[nProductKitType].rank > nProductRank then
							nKitData[nProductKitType].rank = nProductRank
						end
						nKitData[nProductKitType].value = nKitData[nProductKitType].value + 1
					else
						nKitData[nProductKitType] = {value = 1, rank = nProductRank}
					end
				end
				local nAttrType1, _, _, nAttrScaleValue1, nAttrType2, _, _, nAttrScaleValue2, nAttrType3, _, _, nAttrScaleValue3 = LuaFnParseLingYuAttrData(nGlobalLingYuData.equip[i].attr_str)
				nUpdateAttrDataFunc(nAttrType1, nAttrScaleValue1)
				nUpdateAttrDataFunc(nAttrType2, nAttrScaleValue2)
				nUpdateAttrDataFunc(nAttrType3, nAttrScaleValue3)
			end
		end
	end
	nGlobalLingYuData.attr = {}
	for i = 1, 30 do
		if nAttrList[i] ~= nil and nAttrList[i] > 0 and nAttrSort and nAttrSort[i] > 0 then
			nSortAttrList[nAttrSort[i]] = {attr_type = i, attr_value = nAttrList[i]}
		end
	end
	for i = 1, 30 do
		if nSortAttrList[i] and nSortAttrList[i].attr_type and nSortAttrList[i].attr_type > 0 then
			table.insert(nGlobalLingYuData.attr, nSortAttrList[i])
		end
	end
	nGlobalLingYuData.effect = {}
	for i = 1, 6 do
		if nKitData[i] and nKitData[i].value and nKitData[i].rank then
			if nKitData[i].value == 6 then
				table.insert(nGlobalLingYuData.effect, {string.format(nKitInfo[i].kit_name, 3), nKitInfo[i].attr_type, nKitInfo[i].attr_values[nKitData[i].rank]})
				table.insert(nGlobalLingYuData.effect, {string.format(nKitInfo[i].kit_name, 6), "��ü���", nKitInfo[i].skill_name})
				break
			end
			if nKitData[i].value >= 3 and nKitData[i].value < 6 then
				table.insert(nGlobalLingYuData.effect, {string.format(nKitInfo[i].kit_name, 3), nKitInfo[i].attr_type, nKitInfo[i].attr_values[nKitData[i].rank]})
			end
		end
	end
	return nGlobalLingYuData
end
function LuaFnGetLingYuAttrData(index, nOtherLingYuData)
	if nOtherLingYuData and nOtherLingYuData.equip[index] and nOtherLingYuData.equip[index].attr_str then
		return nOtherLingYuData.equip[index].attr_str
	end
	if g_LingYuData.equip[index] and g_LingYuData.equip[index].attr_str then
		return g_LingYuData.equip[index].attr_str
	end
	return ""
end
function LuaFnGetLingYuID(index, nOtherLingYuData)
	if nOtherLingYuData and nOtherLingYuData.equip[index] and nOtherLingYuData.equip[index].id then
		return nOtherLingYuData.equip[index].id
	end
	if g_LingYuData.equip[index] and g_LingYuData.equip[index].id then
		return g_LingYuData.equip[index].id
	end
	return -1
end
function LuaFnGetLingYuSkill(nOtherLingYuData)
	if nOtherLingYuData and nOtherLingYuData.skill then
		return nOtherLingYuData.skill
	end
	if g_LingYuData.skill then
		return g_LingYuData.skill
	end
	return -1
end
function LuaFnGetLingYuAttrCount(nOtherLingYuData)
	if nOtherLingYuData and nOtherLingYuData.attr then
		return table.getn(nOtherLingYuData.attr)
	end
	if g_LingYuData.attr then
		return table.getn(g_LingYuData.attr)
	end
	return 0
end
function LuaFnGetLingYuAttrValueString(index, nOtherLingYuData)
	if nOtherLingYuData and nOtherLingYuData.attr and nOtherLingYuData.attr[index] and nOtherLingYuData.attr[index].attr_value then
		return nOtherLingYuData.attr[index].attr_value
	end
	if g_LingYuData.attr and g_LingYuData.attr[index] and g_LingYuData.attr[index].attr_value then
		return g_LingYuData.attr[index].attr_value
	end
	return 0
end
function LuaFnGetLingYuAttrName(index, nOtherLingYuData)
	local nAttrName = {"Ѫ����", "������", "������", "������", "����Ŀ�����", "�𹥻�", "����", "����Ŀ���", "������", "������", "����Ŀ������", "������", "������", "����Ŀ�궾��", "�⹦����", "�⹦����", "�ڹ�����", "�ڹ�����", "����", "����", "����", "����", "����", "����", "����", "��", "���ķ���", "��������", "����˺�����", "�ܵ��˺�����"}
	if nOtherLingYuData and nOtherLingYuData.attr then
		return nAttrName[nOtherLingYuData.attr[index].attr_type]
	end
	return nAttrName[g_LingYuData.attr[index].attr_type]
end
function LuaFnGetLingYuEffectDesc(field, index, nOtherLingYuData)
	-- index 0, 1
	-- field 0��װ����(����) 1�������� 2����ֵ
	local nEffectData = g_LingYuData.effect[index+1]
	if nOtherLingYuData and nOtherLingYuData.effect then
		nEffectData = nOtherLingYuData.effect[index+1]
	end
	if nEffectData and nEffectData[field] then
		return nEffectData[field]
	end
	return ""
end
function LuaFnGetLingYuEffectCount(nOtherLingYuData)
	if nOtherLingYuData.effect then
		return table.getn(nOtherLingYuData.effect)
	end
	if g_LingYuData.effect then
		return table.getn(g_LingYuData.effect)
	end
	return 0
end
function Lingyu_OnScrollPosChanged(idx)
	if idx == 1 then
		local nIndex = math.ceil(Lingyu_ListContent_Scrollbar:GetPosition())
		if nIndex == 0 then
			Lingyu_ListContent_Container:SetProperty("UnifiedPosition", "{{0.000000,0.000000},{0.000000,0.000000}}")
		else
			Lingyu_ListContent_Container:SetProperty("UnifiedPosition", "{{0.000000,0.000000},{0.000000,-"..tostring((nIndex-1)*20+10)..".000000}}")
		end
		Lingyu_Sync_Scrollbar_Position(2, nIndex)
	elseif idx == 2 then
		local nIndex = math.ceil(Lingyu_ListContent_Container:GetPosition())
		if nIndex >= 0 then
			Lingyu_Sync_Scrollbar_Position(1, nIndex)
		end
	end
end
function Lingyu_Sync_Scrollbar_Position(nIndex, nPosition)
	local nScrollbar = Lingyu_ListContent_Scrollbar
	if nIndex == 2 then
		nScrollbar = Lingyu_ListContent_Container
	end
	if nPosition and nPosition >= 0 then
		nPosition = math.ceil(nPosition)
		local nCurrentPosition = math.ceil(nScrollbar:GetPosition())
		if nCurrentPosition ~= nPosition then
			nScrollbar:SetPosition(nPosition)
		end
	end
end
function Lingyu_OnScrollConfigChanged()
	local nFieldName = {"DocumentSize", "StepSize", "PageSize"}
	for i = 1, table.getn(nFieldName) do
		Lingyu_ListContent_Container:SetProperty(nFieldName[i], Lingyu_ListContent_Scrollbar:GetProperty(nFieldName[i]))
	end
end

--Update
function Lingyu_Update()
	--Tab
	Lingyu_Lingyu:SetCheck(1)
	Lingyu_Sync_Scrollbar_Position(1, 0)
	Lingyu_ListContent_Scrollbar:SetProperty("DocumentSize", 0)
	for i = 1, 6 do
		g_LingYuAction[i]:SetActionItem(-1)
		local LingYuID = LuaFnGetLingYuID(i)
		if LingYuID > 0 then
			local ActionLY = GemMelting:UpdateProductAction(LingYuID)
			g_LingYuAction[i]:SetActionItem(ActionLY:GetID())
		end
	end
	Lingyu_SetItemsSkill:SetActionItem(-1)
	Lingyu_SetItemsSkill:SetProperty("DraggingEnabled", "False")
	Lingyu_SetItemsSkill:Hide()
	local skill_id = LuaFnGetLingYuSkill()
	if skill_id > 0 then
		local nSumSkill = GetActionNum("skill")
		for i = 1, nSumSkill do
			local theAction = EnumAction(i - 1, "skill")
			if theAction:GetDefineID() == skill_id then
				Lingyu_SetItemsSkill:SetProperty("UseDefaultTooltip", "False")
				Lingyu_SetItemsSkill:SetActionItem(theAction:GetID())
				Lingyu_SetItemsSkill:SetProperty("DraggingEnabled", "True")
				Lingyu_SetItemsSkill:Show()
				break
			end
		end
	end
	for i = 1, 18 do
		g_LingYuAttrElement.item[i]:Hide()
	end
	
	local attr_list_count = LuaFnGetLingYuAttrCount()
	if attr_list_count > 0 then
		for i = 1, attr_list_count do	
			local strAttrName = LuaFnGetLingYuAttrName(i)
			local strAttrValue = LuaFnGetLingYuAttrValueString(i)
			g_LingYuAttrElement.item[i]:Show();
			g_LingYuAttrElement.title[i]:SetText(strAttrName)
			g_LingYuAttrElement.value[i]:SetText(strAttrValue)
		end
		Lingyu_ListContent_Container:SetProperty("UnifiedPosition", "{{0.000000,0.000000},{0.000000,0.000000}}")
		if attr_list_count < 11 then
			Lingyu_ListContent_Scrollbar:SetProperty("DocumentSize", 0)
		else
			Lingyu_ListContent_Scrollbar:SetProperty("DocumentSize", attr_list_count)
		end
		Lingyu_ListContent_Container:Show()
	else
		Lingyu_ListContent_Container:Hide()
	end
	local effect_count = LuaFnGetLingYuEffectCount()	
	if effect_count < 1 then
		Lingyu_SetItemsInfo:SetText("#{SZXT_221216_202}")
	else
		Lingyu_SetItemsInfo:SetText("")
	end
	if effect_count >= 1 then
		Lingyu_SetItemsInfo1:Show()
		local effect_title = LuaFnGetLingYuEffectDesc(1, 0)
		Lingyu_SetItemsInfo1_1:SetText(effect_title)
		
		local effect_name = LuaFnGetLingYuEffectDesc(2, 0)
		Lingyu_SetItemsInfo1_Text:SetText(effect_name)
		
		local effect_num = LuaFnGetLingYuEffectDesc(3, 0)
		Lingyu_SetItemsInfo1_Text2:SetText("#cFFF263+"..effect_num)
	else
		Lingyu_SetItemsInfo1:Hide()
	end
	if effect_count >= 2 then
		if LuaFnGetLingYuSkill() > 0 and Lingyu_SetItemsSkill:GetProperty("DraggingEnabled") == "True" then		
			Lingyu_SetItemsInfo2:Show()
			Lingyu_SetItemsInfo3:Hide()
			local effect_title = LuaFnGetLingYuEffectDesc(1, 1)
			Lingyu_SetItemsInfo2_1:SetText(effect_title)
			
			local effect_name = LuaFnGetLingYuEffectDesc(2, 1)
			Lingyu_SetItemsInfo2_Text:SetText(effect_name)
			
			local effect_num = LuaFnGetLingYuEffectDesc(3, 1)
			Lingyu_SetItemsInfo2_Text2:SetText("#cFFF263"..effect_num)
		else
			Lingyu_SetItemsInfo2:Hide()
			Lingyu_SetItemsInfo3:Show()
			local effect_title = LuaFnGetLingYuEffectDesc(1, 1)
			Lingyu_SetItemsInfo3_1:SetText(effect_title)
			
			local effect_name = LuaFnGetLingYuEffectDesc(2, 1)
			Lingyu_SetItemsInfo3_Text:SetText(effect_name)
			
			local effect_num = LuaFnGetLingYuEffectDesc(3, 1)
			Lingyu_SetItemsInfo3_Text2:SetText("#cFFF263+"..effect_num)
		end
	else
		Lingyu_SetItemsInfo2:Hide()
		Lingyu_SetItemsInfo3:Hide()
	end

end

function Lingyu_Equip_Clicked(nPos)
	if LuaFnGetLingYuID(nPos) > 0 then
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("LingWu_Operation")
		Set_XSCRIPT_ScriptID(888808);
		Set_XSCRIPT_Parameter(0, 2);
		Set_XSCRIPT_Parameter(1, nPos);
		Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT()
	end
end

function Lingyu_OnShown()
	local selfUnionPos = Variable:GetVariable("SelfUnionPos")
	if selfUnionPos ~= nil then
		Lingyu_Frame:SetProperty("UnifiedPosition", selfUnionPos)
	end
end

function Lingyu_OnHiden()
	--Lingyu_ListContent:Clear()
end

--player's equip
function Lingyu_Page_SelfEquip()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1)
	OpenEquip(1)
end

--player's info
function Lingyu_Page_SelfData()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1)
	SystemSetup:OpenPrivatePage("self")
end

--player's pet
function Lingyu_Page_Pet()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1)
	TogglePetPage()
end

function Lingyu_Page_Wuhun()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1);
	ToggleWuhunPage();
	this:Hide()
end

--xiu lian
function Lingyu_Page_Xiulian()
	local nLevel = Player:GetData("LEVEL")
	if(nLevel >= 70) then
		Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1);
		XiuLianPage();
		this:Hide()
	else
		SelfEquip_Xiulian : SetCheck(0)
		PushDebugMessage("#{XL_090707_62}")
	end
end

function Lingyu_Page_Talent()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1);
	ToggleTalentPage();
	this:Hide()
end

--�л�����չʾ����
function Lingyu_Page_Profile()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1);
	Exterior:LuaFnExteriorPlayerOpenProfileUI()	
end

--player's other info
function Lingyu_Page_OtherInfo()
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1);
	OtherInfoPage();
    UpdateDoubleExpData();
end

--================================================
-- �ָ������Ĭ�����λ��
--================================================
function Lingyu_Frame_On_ResetPos()
	Lingyu_Frame:SetProperty("UnifiedXPosition", g_Lingyu_Frame_UnifiedXPosition)
	Lingyu_Frame:SetProperty("UnifiedYPosition", g_Lingyu_Frame_UnifiedYPosition)
end

function Lingyu_ShowPage()

	for i = 1, g_MaxPage do
		g_PageButton[i]:Hide()
	end
	local nPageNumber = tonumber(Variable:GetVariable("PageNumber"))
	Lingyu_ClearPage()
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
		if Lingyu_CheckPage(i) == 1 then
			g_PageCount = g_PageCount + 1
			g_PageButton[g_PageCount]:Show()
			g_PageButton[g_PageCount]:SetText(g_Page[i].Text)	
			g_PageOrder[g_PageCount] = i
			
			if Lingyu_IsPageEnable(i) == 1 then
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

function Lingyu_OnPageClicked(idx)
	Variable:SetVariable("PageNumber", tostring(idx), 1)
	idx = g_PageOrder[idx]
	if idx == 1 then--װ��
		Lingyu_Page_SelfEquip()
	elseif idx == 2 then--����
		Lingyu_Page_SelfData()
	elseif idx == 3 then--����
		Lingyu_Page_Pet()
	elseif idx == 4 then--���
		Lingyu_Page_Wuhun()
	elseif idx == 5 then--����
		Lingyu_Page_Xiulian()
	elseif idx == 6 then--���
		Lingyu_Page_Talent()
	elseif idx == 7 then--����
		Lingyu_ClearPage()
	elseif idx == 8 then--���
		Lingyu_Page_ShenBing()
	elseif idx == 9 then--����
		--Lingyu_Page_Profile()
	elseif idx == 10 then--����
		Lingyu_Page_OtherInfo()
	end
end

function Lingyu_CheckPage(idx)
	if idx == 1 then--װ��
		return 1
	elseif idx == 2 then--����
		return 1
	elseif idx == 3 then--����
		return 1
	elseif idx == 4 then--���
		return 1
	elseif idx == 5 then--����
		return 1
	elseif idx == 6 then--���
		return 1
	elseif idx == 7 then--����
		return 1
	elseif idx == 8 then--���
		return 1
	elseif idx == 9 then--���
		local my_level = Player:GetData("LEVEL")
		if my_level >= 149 then
			return 1
		end
	elseif idx == 10 then--����
		 return 1
		-- local my_level = Player:GetData("LEVEL")
		-- if my_level >= 15 then
			-- return 1
		-- end
	end
end

function Lingyu_IsPageEnable(idx)
	if idx == 1 then--װ��
		return 1
	elseif idx == 2 then--����
		return 1
	elseif idx == 3 then--����
		return 1
	elseif idx == 4 then--���
			return 1
	elseif idx == 5 then--����
	  local my_level = Player:GetData("LEVEL")
		if my_level >= 70 then
			return 1
		end
	elseif idx == 6 then--���
		local my_level = Player:GetData("LEVEL")
		if my_level >= 60 then
			return 1
		end
	elseif idx == 7 then--����
		local my_level = Player:GetData("LEVEL")
		if my_level >= 85 then
			return 1
		end
	elseif idx == 8 then--���
		local my_level = Player:GetData("LEVEL")
		if my_level >= 65 then
			return 1
		end
	elseif idx == 9 then--����
		return 1
	elseif idx == 10 then--����
		return 1
	end
	return 0
end

function Lingyu_Equip_MouseEnter(index)
	if LuaFnGetLingYuID(index) > 0 then
		local nLingYuData = LuaFnGetLingYuAttrData(index)
		if nLingYuData ~= "" then
			PushEvent("UI_COMMAND", 11605923, nLingYuData)
		end
	end
end

function Lingyu_Equip_MouseLeave()
	PushEvent("UI_COMMAND", 11605923, "")
end

function Lingyu_ClearPage()
	Variable:SetVariable("PageNumber", tostring(0), 1)
end

--���·�ҳ���
function Lingyu_UpdateRedPoint()
	for i = 1, g_MaxPage do
		g_PageTip[i]:Hide()
	end
end

function Lingyu_ShowPage()

	for i = 1, g_MaxPage do
		g_PageButton[i]:Hide()
	end
	local nPageNumber = tonumber(Variable:GetVariable("PageNumber"));
	Lingyu_ClearPage()
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
		if Lingyu_CheckPage(i) == 1 then
			g_PageCount = g_PageCount + 1
			g_PageButton[g_PageCount]:Show()
			g_PageButton[g_PageCount]:SetText(g_Page[i].Text)	
			g_PageOrder[g_PageCount] = i
			if Lingyu_IsPageEnable(i) == 1 then
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

function Lingyu_Page_ShenBing()
	-- local isopen = T300Func:IsNoDifOpen(7)
	-- if isopen ~= nil and isopen == 1 then
		-- Lingyu_Weapon2:SetCheck(0)
		-- Lingyu_ClearPage()
		-- return
	-- end
	
	Variable:SetVariable("SelfUnionPos", Lingyu_Frame:GetProperty("UnifiedPosition"), 1)
	LuaFnToggleShenBingPage()
	Lingyu_Close()
end

function Lingyu_Close()
	this:Hide()
end