--!!!reloadscript =Lingyu

local g_Lingyu_Frame_UnifiedXPosition
local g_Lingyu_Frame_UnifiedYPosition

local g_LingYuAttrElement = {}

local g_LingYuAction = {}

local g_LingYuData = {}

--统一化下页签显示隐藏 目前固定顺序 新增改序号 每个页签都需要添加
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

	-- 游戏窗口尺寸发生了变化
	this:RegisterEvent("ADJEST_UI_POS")
	-- 游戏分辨率发生了变化
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
	
	this:RegisterEvent("UPDATE_EXTERIOR_TIP")
	
end

function Lingyu_OnLoad()

	-- 保存界面的默认相对位置
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
		-- 更新背包界面位置
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
    local nRankName, nBaseAttrStr, nKitEffectStr, nExtendedAttrStr = "黄阶", "", "", ""
    if nProductRank and nProductType and nProductRank >= 1 and nProductRank <= 4 and nProductType >= 1 and nProductType <= 6 then
    	local nRankNameList = {"黄阶", "玄阶", "地阶", "天阶"}
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
    		local nBaseAttrName = {"血上限", "基础内功攻击", "基础外攻攻击", "基础内功防御", "基础外功防御", "基础命中", "基础闪避", "会心"}
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
    		local nAttrName = {"血上限", "气上限", "冰攻击", "冰抗性", "忽略目标冰抗", "火攻击", "火抗性", "忽略目标火抗", "玄攻击", "玄抗性", "忽略目标玄抗", "毒攻击", "毒抗性", "忽略目标毒抗", "外功攻击", "外功防御", "内功攻击", "内功防御", "命中", "闪避", "会心", "力量", "灵气", "体力", "定力", "身法", "会心防御", "所有属性", "造成伤害增加", "受到伤害降低"}
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
    	local nKitEffectList = {"#Y【流光灵武】：#r#G3件：血上限增加；#r6件：获得技能：#r流光飞影：使用第一本心法第一个技能攻击5米内目标时，有概率触发：使自身移动速度增加，且免疫减速，持续8秒，触发期间不再重复触发。（曼陀山庄广陵散状态下，触发概率降低）","#Y【暮雨灵武】#r#G3件：所有属性攻击增加；#r6件：获得技能：#r暮雨留春：使用后，命中目标后有概率吸取所造成伤害的部分血量给自身，持续10秒，冷却时间100秒。（目标为怪物时，吸取量降低）","#Y【星辉灵武】#r#G3件：会心增加；#r6件：获得技能：#r星辉缠夜：使用后，使用第一本心法第一个技能命中目标并对目标造成会心一击时，有概率使目标麻痹1秒，状态持续10秒，冷却时间120秒。（曼陀山庄广陵散状态下，触发概率降低）","#Y【清风灵武】#r#G3件：闪避增加；#r6件：获得技能：#r轻风净云：使用后，受到伤害时，减少受到的伤害，持续8秒，冷却时间120秒。	","#Y【夜雪灵武】#r#G3件：命中增加；#r6件：获得技能：#r夜雪折竹：对麻痹、失明、散功、封穴、封印的目标造成的伤害提高。","#Y【御雷灵武】#r#G3件：所有属性增加；#r6件：获得技能：#r御雷拥雨：对附近小队友方目标使用，可冲锋至目标身边，同时给自身和目标各释放一个护盾，护盾吸收部分伤害，持续3秒。冷却时间120秒。"}
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
    	{kit_name = "流光(%d件)", skill_name = "流光飞影", attr_type = "血上限", attr_values = {1109, 1952, 3150, 4438}},
    	{kit_name = "暮雨(%d件)", skill_name = "暮雨留春", attr_type = "所有属性攻击", attr_values = {10, 17, 28, 40}}, 
    	{kit_name = "星辉(%d件)", skill_name = "星辉缠夜", attr_type = "会心", attr_values = {3, 6, 10, 15}}, 
    	{kit_name = "清风(%d件)", skill_name = "轻风净云", attr_type = "闪避", attr_values = {90, 158, 255, 360}}, 
    	{kit_name = "夜雪(%d件)", skill_name = "夜雪折竹", attr_type = "命中", attr_values = {270, 475, 766, 1080}}, 
    	{kit_name = "御雷(%d件)", skill_name = "御雷拥雨", attr_type = "所有属性", attr_values = {5, 8, 13, 20}}, 
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
				table.insert(nGlobalLingYuData.effect, {string.format(nKitInfo[i].kit_name, 6), "获得技能", nKitInfo[i].skill_name})
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
	local nAttrName = {"血上限", "气上限", "冰攻击", "冰抗性", "忽略目标冰抗", "火攻击", "火抗性", "忽略目标火抗", "玄攻击", "玄抗性", "忽略目标玄抗", "毒攻击", "毒抗性", "忽略目标毒抗", "外功攻击", "外功防御", "内功攻击", "内功防御", "命中", "闪避", "会心", "力量", "灵气", "体力", "定力", "身法", "会心防御", "所有属性", "造成伤害增加", "受到伤害降低"}
	if nOtherLingYuData and nOtherLingYuData.attr then
		return nAttrName[nOtherLingYuData.attr[index].attr_type]
	end
	return nAttrName[g_LingYuData.attr[index].attr_type]
end
function LuaFnGetLingYuEffectDesc(field, index, nOtherLingYuData)
	-- index 0, 1
	-- field 0套装名称(件数) 1属性名称 2属性值
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

--切换个人展示界面
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
-- 恢复界面的默认相对位置
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
	if idx == 1 then--装备
		Lingyu_Page_SelfEquip()
	elseif idx == 2 then--资料
		Lingyu_Page_SelfData()
	elseif idx == 3 then--珍兽
		Lingyu_Page_Pet()
	elseif idx == 4 then--武魂
		Lingyu_Page_Wuhun()
	elseif idx == 5 then--修炼
		Lingyu_Page_Xiulian()
	elseif idx == 6 then--武道
		Lingyu_Page_Talent()
	elseif idx == 7 then--灵玉
		Lingyu_ClearPage()
	elseif idx == 8 then--神兵
		Lingyu_Page_ShenBing()
	elseif idx == 9 then--个人
		--Lingyu_Page_Profile()
	elseif idx == 10 then--其他
		Lingyu_Page_OtherInfo()
	end
end

function Lingyu_CheckPage(idx)
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
		-- local my_level = Player:GetData("LEVEL")
		-- if my_level >= 15 then
			-- return 1
		-- end
	end
end

function Lingyu_IsPageEnable(idx)
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

--更新分页红点
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