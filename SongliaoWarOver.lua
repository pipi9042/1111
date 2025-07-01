
local g_SongliaoWarOver_Frame_UnifiedXPosition;
local g_SongliaoWarOver_Frame_UnifiedYPosition;
local g_SongliaoWarOver_Image = {
						[1] = "set:SongLiao02 image:HJ_Shengli",   --sheng
						[2] = "set:SongLiao02 image:HJ_Baibei", 	--Bai
						[3] = "set:SongLiao02 image:HJ_Pingju",     --ping
						[4] = "set:SongLiao02 image:HJ_Zhengduo" --weiwancheng
	}

local g_select = 0 --1:宋 0：辽
local g_Songliao_ItemBars = {}
local g_SongIsWinner = 0  --0:平局 1：宋胜 2：辽胜
local g_Final = 0
local g_MaxItemBarNum = 5	--每页的最大Bar数量
local g_CurPage = 0
local g_CurMaxPage = 0

local SongliaoWarOver_Battle_FourTimeEnd = 11470--SongLiaoWarSingle.lua 里面有一样的宏
function SongliaoWarOver_PreLoad()
	this:RegisterEvent("SCENE_TRANSED");
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	this:RegisterEvent("UI_COMMAND");	
	this:RegisterEvent("ADJEST_UI_POS");
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED");		
end

function SongliaoWarOver_OnLoad()
	-- 保存界面的默认相对位置
	g_SongliaoWarOver_Frame_UnifiedXPosition	= SongliaoWarOver : GetProperty("UnifiedXPosition");
	g_SongliaoWarOver_Frame_UnifiedYPosition	= SongliaoWarOver : GetProperty("UnifiedYPosition");
	-- 窗体界面初始化
	for i = 1,g_MaxItemBarNum do
		local ItemBar =  _G["SongliaoWarOver_List_Item_"..i]
		local PaiMing =  _G["SongliaoWarOver_List_Item_"..i.."_PaiMing"]
		local RankImage =  _G["SongliaoWarOver_List_Item_"..i.."_RankImage"]
		local Name =  _G["SongliaoWarOver_List_Item_"..i.."_Name"]
		local KillNum =  _G["SongliaoWarOver_List_Item_"..i.."_Kill"]
		local Flag =  _G["SongliaoWarOver_List_Item_"..i.."_Flag"]
		local Point =  _G["SongliaoWarOver_List_Item_"..i.."_Point"]
		local ActionBtn_1 =  _G["SongliaoWarOver_List_Item_"..i.."_ActBtn1"]
		local ActionBtn_2 =  _G["SongliaoWarOver_List_Item_"..i.."_ActBtn2"]
		local ActionBtn_3 =  _G["SongliaoWarOver_List_Item_"..i.."_ActBtn3"]
		local ActionBtn_4 =  _G["SongliaoWarOver_List_Item_"..i.."_ActBtn4"]
		local NoEnd =  _G["SongliaoWarOver_List_Item_"..i.."_NoEnd"]
		
		g_Songliao_ItemBars[i] = {
			ItemBar = ItemBar,
			PaiMing = PaiMing,
			RankImage = RankImage,
			Name = Name,
			KillNum = KillNum,
			Flag = Flag,
			Point = Point,
			ActionBtn = {ActionBtn_1,ActionBtn_2,ActionBtn_3,ActionBtn_4},
			NoEnd = NoEnd,
		}
	end
	
end

function SongliaoWarOver_OnEvent(event)
	if (event=="SCENE_TRANSED") then
		if(548~=GetSceneID()) then
			DataPool:ClearSongliaoData()
		end
		if arg0=="songliao_dazhan" then
			this:Hide()
		end
	elseif (event=="PLAYER_LEAVE_WORLD") then
		if( this:IsVisible() ) then
			this:Hide()
		end
	elseif (event == "UI_COMMAND") and tonumber(arg0) == 502011 then 
		this:Show()
		SongliaoWarOver_Open(1)
	-- 游戏窗口尺寸发生了变化
	elseif (event == "ADJEST_UI_POS" ) then
		SongliaoWarOver_Frame_On_ResetPos();
	-- 游戏分辨率发生了变化		
	elseif (event == "VIEW_RESOLUTION_CHANGED" ) then
		SongliaoWarOver_Frame_On_ResetPos();
	elseif (event == "UI_COMMAND" and tonumber(arg0) == 2022070305 ) then
		this:Show()
		SongliaoWarOver_Open(0)
	elseif (event=="UI_COMMAND" and tonumber(arg0) == 2022070306 and this:IsVisible()) then
		SongliaoWarOver_Open(0)
	end
end

function SongliaoWarOver_Open(final)
	g_SongIsWinner = 0
	--页面置1
	g_CurPage = 0
	
	local nTick = DataPool:GetSongliaoWarTick()
	if nTick >= SongliaoWarOver_Battle_FourTimeEnd then
		final = 1
	end
	
	g_Final = final
	if g_Final == 1 then
		SongliaoWarOver_Sure:Enable()
	else
		SongliaoWarOver_Sure:Disable()
	end
	local myRet, myName, myCamp, myScore= DataPool:GetSongliaoWarMyScore()

	if myCamp == 156 then
		g_select = 1
		SongliaoWarOver_Song_Check:SetProperty("Selected", "True"); 
		SongliaoWarOver_Liao_Check:SetProperty("Selected", "False");   
		SongliaoWarOver_SongCamp:SetText("本方")
		SongliaoWarOver_LiaoCamp:SetText("敌方")
	else
		g_select = 0
		SongliaoWarOver_Song_Check:SetProperty("Selected", "False"); 
		SongliaoWarOver_Liao_Check:SetProperty("Selected", "True");   
		SongliaoWarOver_SongCamp:SetText("敌方")
		SongliaoWarOver_LiaoCamp:SetText("本方")
	end

	--Lua_TDU_Log("myRet="..myRet.." myName="..myName.." myCamp="..myCamp.." myScore="..myScore.." mykillNum="..mykillNum)
	
	--local nState = CSongliaoWarData:GetState()
	
	local winSong = {0,0,0,0}
	local winLiao = {0,0,0,0}

	for nState=1,4 do
		if nState == 1 then --第一阶段
			
			local nStateWinner=  DataPool:GetSongliaoWarStateWinner(nState)
			--Lua_TDU_Log("nState"..nState.." nStateWinner="..nStateWinner)
			if nStateWinner == 1 then --宋	
				SongliaoWarOver_QL:SetProperty("Visible" , "True" )
				SongliaoWarOver_QL2:SetProperty("Visible" , "False" )
				winSong[1] = 1
			elseif nStateWinner == 2 then --辽
				SongliaoWarOver_QL:SetProperty("Visible" , "False" )
				SongliaoWarOver_QL2:SetProperty("Visible" , "True" )
				winLiao[1] = 1
			else --平
				SongliaoWarOver_QL:SetProperty("Visible" , "False" )
				SongliaoWarOver_QL2:SetProperty("Visible" , "False" )	
			end
			
		elseif nState == 2 then --第二阶段

			local nStateWinner=  DataPool:GetSongliaoWarStateWinner(nState)
			if nStateWinner == 1 then --宋	
				SongliaoWarOver_BH:SetProperty("Visible" , "True" )
				SongliaoWarOver_BH2:SetProperty("Visible" , "False" )
				winSong[2] = 1
			elseif nStateWinner == 2 then --辽
				SongliaoWarOver_BH:SetProperty("Visible" , "False" )
				SongliaoWarOver_BH2:SetProperty("Visible" , "True" )
				winLiao[2] = 1
			else --平
				SongliaoWarOver_BH:SetProperty("Visible" , "False" )
				SongliaoWarOver_BH2:SetProperty("Visible" , "False" )	
			end

		elseif nState == 3 then --第三阶段

			local nStateWinner=  DataPool:GetSongliaoWarStateWinner(nState)

			if nStateWinner == 1 then --宋	
				SongliaoWarOver_XW:SetProperty("Visible" , "True" )
				SongliaoWarOver_XW2:SetProperty("Visible" , "False" )
				winSong[3] = 1
			elseif nStateWinner == 2 then --辽
				SongliaoWarOver_XW:SetProperty("Visible" , "False" )
				SongliaoWarOver_XW2:SetProperty("Visible" , "True" )
				winLiao[3] = 1
			else --平
				SongliaoWarOver_XW:SetProperty("Visible" , "False" )
				SongliaoWarOver_XW2:SetProperty("Visible" , "False" )	
			end

		elseif nState == 4 then --第四阶段

			local nStateWinner=  DataPool:GetSongliaoWarStateWinner(nState)
			if nStateWinner == 1 then --宋	
				SongliaoWarOver_ZQ:SetProperty("Visible" , "True" )
				SongliaoWarOver_ZQ2:SetProperty("Visible" , "False" )
				winSong[4] = 1
			elseif nStateWinner == 2 then --辽
				SongliaoWarOver_ZQ:SetProperty("Visible" , "False" )
				SongliaoWarOver_ZQ2:SetProperty("Visible" , "True" )
				winLiao[4] = 1
			else --平
				SongliaoWarOver_ZQ:SetProperty("Visible" , "False" )
				SongliaoWarOver_ZQ2:SetProperty("Visible" , "False" )				
			end
		end
	end

	local songcnt =0 
	local liaocnt =0
	for i=1,4 do
		songcnt = songcnt + winSong[i]
		liaocnt = liaocnt + winLiao[i]
	end

	if g_Final == 1 then
		if songcnt > liaocnt then
			if myCamp ==  156 then --我是宋
				SongliaoWarOver_Sheng:SetProperty("Image", g_SongliaoWarOver_Image[1])
			else
				SongliaoWarOver_Sheng:SetProperty("Image", g_SongliaoWarOver_Image[2])
			end
			g_SongIsWinner = 1
		elseif songcnt < liaocnt then
			if myCamp ==  156 then --我是宋
				SongliaoWarOver_Sheng:SetProperty("Image", g_SongliaoWarOver_Image[2])
			else
				SongliaoWarOver_Sheng:SetProperty("Image", g_SongliaoWarOver_Image[1])
			end
			g_SongIsWinner = 2
		elseif songcnt == liaocnt then
			SongliaoWarOver_Sheng:SetProperty("Image", g_SongliaoWarOver_Image[3])
			g_SongIsWinner = 0
		end
	else
		SongliaoWarOver_Sheng:SetProperty("Image", g_SongliaoWarOver_Image[4])
	end

	SongliaoWarOver_Frame_Draw(g_Final)
	
end

function SongliaoWarOver_Close()
	this:Hide()
end

function SongliaoWarOver_Sure_Clicked()

	SongliaoWarOver_Close()
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "Transfer" )
		Set_XSCRIPT_ScriptID(502021) --别忘了：AllowableScriptFunc.txt中加上这个接口和脚本号
		Set_XSCRIPT_ParamCount(0)
	Send_XSCRIPT()		
	--SongliaoWarOver_Time:SetProperty("Timer", "-1");
end

--更新主界面位置
function SongliaoWarOver_Frame_On_ResetPos()

	SongliaoWarOver : SetProperty("UnifiedXPosition", g_SongliaoWarOver_Frame_UnifiedXPosition);
	SongliaoWarOver : SetProperty("UnifiedYPosition", g_SongliaoWarOver_Frame_UnifiedYPosition);

end

function SongliaoWarOver_Frame_Song_Check()

	if g_select == 0 then 
		SongliaoWarOver_Song_Check:SetProperty("Selected", "True");  
		SongliaoWarOver_Liao_Check:SetProperty("Selected", "False");  
		g_select = 1
		SongliaoWarOver_Frame_Draw(g_Final)
	end
	
end

function SongliaoWarOver_Frame_Liao_Check()

	if g_select == 1 then
		SongliaoWarOver_Song_Check:SetProperty("Selected", "False"); 
		SongliaoWarOver_Liao_Check:SetProperty("Selected", "True");   
		g_select = 0
		SongliaoWarOver_Frame_Draw(g_Final)
	end
	
end

function SongliaoWarOver_Hidden()

	PushEvent("UI_COMMAND",2022070302, 1)
    this:Hide()
	
end

function SongliaoWarOver_MoveUp()
	if g_CurPage <= 0 then
		return
	end
    g_CurPage = g_CurPage - 1
	SongliaoWarOver_Frame_Draw(g_Final)
end

function SongliaoWarOver_MoveDown()
	if g_CurPage >= g_CurMaxPage then
		return
	end
    g_CurPage = g_CurPage + 1
	SongliaoWarOver_Frame_Draw(g_Final)
end

function SongliaoWarOver_Frame_UpdatePlayerList(nFinal)
	
	for i = 1,g_MaxItemBarNum do
		g_Songliao_ItemBars[i].ItemBar:Hide()
	end
	--g_CurMaxPage
	--g_CurPage
	local nStart = g_CurPage * g_MaxItemBarNum
	
	local nCount = 0
	for i = nStart,nStart + g_MaxItemBarNum -1 do
		local ret,charname,camp,score,killnum, humanGUID, SuccKill= DataPool:GetSongliaoWarScoreByIndex(i)
--		PushDebugMessage("i "..i.." ret "..ret)
		
		--PushDebugMessage("List".."nNum="..nNum.." ret="..ret.." charname="..charname.." camp="..camp.." score="..score.." killnum="..killnum)
		if ret == nil or ret ~= 1  then
			continue
		end
		
		if 	g_select == 1 then
			if camp == 157 then
				continue
			end
		else
			if camp == 156 then
				continue
			end
		end
		local nIndex = nCount + 1--i - nStart + 1

		if g_Songliao_ItemBars[nIndex].ItemBar == nil then
			return
		end
--		PushDebugMessage("nIndex "..nIndex)
		
		g_Songliao_ItemBars[nIndex].ItemBar:Show()
		
		if nFinal == 0 then
			g_Songliao_ItemBars[nIndex].NoEnd:Show()
			g_Songliao_ItemBars[nIndex].NoEnd:SetText("未分胜负")
		else
			g_Songliao_ItemBars[nIndex].NoEnd:Hide()
		end

		if (nCount+1) == 1 then
			g_Songliao_ItemBars[nIndex].RankImage:SetProperty("Image", "set:SongLiao02 image:Win_1")
			g_Songliao_ItemBars[nIndex].RankImage:Show()
			g_Songliao_ItemBars[nIndex].PaiMing:Hide()
		elseif (nCount+1) == 2 then
			g_Songliao_ItemBars[nIndex].RankImage:SetProperty("Image", "set:SongLiao02 image:Win_2")
			g_Songliao_ItemBars[nIndex].RankImage:Show()
			g_Songliao_ItemBars[nIndex].PaiMing:Hide()
		elseif (nCount+1) == 3 then
			g_Songliao_ItemBars[nIndex].RankImage:SetProperty("Image", "set:SongLiao02 image:Win_3")
			g_Songliao_ItemBars[nIndex].RankImage:Show()
			g_Songliao_ItemBars[nIndex].PaiMing:Hide()
		else
			g_Songliao_ItemBars[nIndex].RankImage:Hide()
			g_Songliao_ItemBars[nIndex].PaiMing:Show()
		end

		
		g_Songliao_ItemBars[nIndex].PaiMing:SetText(tostring(nCount+1))
		g_Songliao_ItemBars[nIndex].Name:SetText(charname)
		g_Songliao_ItemBars[nIndex].KillNum:SetText(killnum)
		g_Songliao_ItemBars[nIndex].Flag:SetText(SuccKill)
		g_Songliao_ItemBars[nIndex].Point:SetText(score)

		local m_nIndex,m_SongBonusItemID,m_SongBonusItemNum,m_SongBonusProNum,
		    m_LiaoBonusItemID,m_LiaoBonusItemNum,m_LiaoonusProNum,
			m_BonusItemID1,m_BonusItemNum1,m_BonusProNum1,
			m_BonusItemID2,m_BonusItemNum2,m_BonusProNum2,
			m_RYItemID,m_RYValue,m_RYVictoryValue,m_LossRYRankValue,m_RYLossValue = Lua_GetSongLiaoBonusInfo(nCount)
		
--		PushDebugMessage("m_RYItemID "..m_RYItemID.." m_RYValue "..m_RYValue)
         --选择展示宋界面 宋赢了 or 选择展示辽界面  辽赢了
		if ( g_select == 1 and g_SongIsWinner == 1 ) or ( g_select == 0 and g_SongIsWinner == 2 ) then

			if m_RYValue > 0 then
				theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_RYValue)
				itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[1]
				if theAction:GetID() ~= 0 then 
					itemButton:SetActionItem(theAction:GetID())
				end
			end

			if g_select == 1 and m_SongBonusItemNum > 0 then
				local itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[2]
				theAction = DataPool:CreateActionItemForShow(m_SongBonusItemID, m_SongBonusItemNum)
				if theAction:GetID() ~= 0 then 
					itemButton:SetActionItem(theAction:GetID())
				end
			elseif g_select == 0 and m_LiaoBonusItemNum > 0 then
				local itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[2]
				theAction = DataPool:CreateActionItemForShow(m_LiaoBonusItemID, m_LiaoBonusItemNum)
				if theAction:GetID() ~= 0 then 
					itemButton:SetActionItem(theAction:GetID())
				end
			end

			if m_RYVictoryValue > 0 then
				itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[3]
				if nFinal == 1 then
					theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_RYVictoryValue)
					if theAction:GetID() ~= 0 then 
						itemButton:SetActionItem(theAction:GetID())
					end
					itemButton:Show()
				else
					itemButton:Hide()
				end
				
			end

			if m_BonusItemNum1 > 0 then
				itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[4]
				if nFinal == 1 then
				    theAction = DataPool:CreateActionItemForShow(m_BonusItemID1, m_BonusItemNum1)
				    if theAction:GetID() ~= 0 then 
					    itemButton:SetActionItem(theAction:GetID())
					end
					itemButton:Show()
				else
					itemButton:Hide()
				end
			end

		else
			if m_LossRYRankValue > 0 then
				itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[1]
				theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_LossRYRankValue)
				if theAction:GetID() ~= 0 then 
					itemButton:SetActionItem(theAction:GetID())
				end
			end
			
			if g_select == 1 and m_SongBonusItemNum > 0 then

				local itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[2]
				theAction = DataPool:CreateActionItemForShow(m_SongBonusItemID, m_SongBonusItemNum)
				if theAction:GetID() ~= 0 then 
					itemButton:SetActionItem(theAction:GetID())
				end
			elseif g_select == 0 and m_LiaoBonusItemNum > 0 then

				local itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[2]
				theAction = DataPool:CreateActionItemForShow(m_LiaoBonusItemID, m_LiaoBonusItemNum)
				if theAction:GetID() ~= 0 then 
					itemButton:SetActionItem(theAction:GetID())
				end
			end

			if m_RYLossValue > 0 then
				itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[3]
				if nFinal == 1 then
					theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_RYLossValue)
					if theAction:GetID() ~= 0 then 
						itemButton:SetActionItem(theAction:GetID())
					end
					itemButton:Show()
				else
					itemButton:Hide()
				end
			end

			if m_BonusItemNum2 > 0 then
				itemButton  = g_Songliao_ItemBars[nIndex].ActionBtn[4]
				if nFinal == 1 then
					theAction = DataPool:CreateActionItemForShow(m_BonusItemID2, m_BonusItemNum2)
					if theAction:GetID() ~= 0 then 
						itemButton:SetActionItem(theAction:GetID())
					end
					itemButton:Show()
				else
					itemButton:Hide()
				end
			end

		end

		-- save itembar
		nCount = nCount + 1

	end
end

function SongliaoWarOver_Frame_Draw(nFinal)

	local myRet, myName, myCamp, myScore, mykillNum, myGUID,mySuccKill= DataPool:GetSongliaoWarMyScore()
	if myRet == nil or myRet ~= 1  then
		return
	end
	local theAction

	local nNum = DataPool:GetSongliaoWarPlayerNum()
	--页面计算
	g_CurMaxPage = math.ceil(nNum / g_MaxItemBarNum)
--	PushDebugMessage("nNum:"..nNum.." g_CurMaxPage:"..g_CurMaxPage)
	--总排名呈现
	SongliaoWarOver_Frame_UpdatePlayerList(nFinal)
	
	--个人排名计算
	local myCount = 0
	for i = 0,nNum -1 do
		local ret,charname,camp,score,killnum, humanGUID = DataPool:GetSongliaoWarScoreByIndex(i)

		if ret == nil or ret ~= 1  then
			continue
		end

		if camp ~= myCamp then
			continue
		end

		if myGUID == humanGUID then
			break	
		end
		
		myCount = myCount + 1
	end


	if nFinal == 0 then
		SongliaoWarOver_NoEnd:Show()
		SongliaoWarOver_NoEnd:SetText("未分胜负")
		SongliaoWarOver_SelfButton5:Hide()
		SongliaoWarOver_SelfButton6:Hide()
	elseif nFinal == 1 then
		SongliaoWarOver_NoEnd:Hide()
		SongliaoWarOver_SelfButton5:Show()
		SongliaoWarOver_SelfButton6:Show()
	end

	if (myCount+1) == 1 then								
		SongliaoWarOver_SelfRankImage:SetProperty("Image", "set:SongLiao02 image:Win_1")
		SongliaoWarOver_SelfRankImage:Show()
		SongliaoWarOver_SelfRank:SetText("")
	elseif (myCount+1) == 2 then
		SongliaoWarOver_SelfRankImage:SetProperty("Image", "set:SongLiao02 image:Win_2")
		SongliaoWarOver_SelfRankImage:Show()
		SongliaoWarOver_SelfRank:SetText("")
	elseif (myCount+1) == 3 then
		SongliaoWarOver_SelfRankImage:SetProperty("Image", "set:SongLiao02 image:Win_3")
		SongliaoWarOver_SelfRankImage:Show()
		SongliaoWarOver_SelfRank:SetText("")
	else
		SongliaoWarOver_SelfRankImage:Hide()
		SongliaoWarOver_SelfRank:SetText(myCount+1)
		
	end


	SongliaoWarOver_SelfItem:Show()
	--SongliaoWarOver_SelfRank:SetText(myCount+1)
	SongliaoWarOver_SelfName:SetText(myName)
	SongliaoWarOver_SelfKill:SetText(mykillNum)
	SongliaoWarOver_SelfFlag:SetText(mySuccKill)
	SongliaoWarOver_SelfPoints:SetText(myScore)
	
--	PushDebugMessage("myCount "..myCount);
	
	local m_nIndex,m_SongBonusItemID,m_SongBonusItemNum,m_SongBonusProNum,
		m_LiaoBonusItemID,m_LiaoBonusItemNum,m_LiaoonusProNum,
		m_BonusItemID1,m_BonusItemNum1,m_BonusProNum1,
		m_BonusItemID2,m_BonusItemNum2,m_BonusProNum2,
		m_RYItemID,m_RYValue,m_RYVictoryValue,m_LossRYRankValue,m_RYLossValue = Lua_GetSongLiaoBonusInfo(myCount)

	if ( g_SongIsWinner == 1 and myCamp == 156 ) or ( g_SongIsWinner == 2 and myCamp == 157 ) then

		if m_RYValue > 0 then
			theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_RYValue)
			if theAction:GetID() > 0 then 
				SongliaoWarOver_SelfButton3:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton3:SetActionItem(-1);
			end	
		else
			SongliaoWarOver_SelfButton3:SetActionItem(-1);			
		end

		if myCamp == 156 and m_SongBonusItemID > 0 then
			theAction = DataPool:CreateActionItemForShow(m_SongBonusItemID, m_SongBonusItemNum)
			if theAction:GetID() > 0 then 
				SongliaoWarOver_SelfButton4:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton4:SetActionItem(-1);
			end	
		elseif myCamp == 157 and m_LiaoBonusItemID > 0 then
			theAction = DataPool:CreateActionItemForShow(m_LiaoBonusItemID, m_LiaoBonusItemNum)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton4:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton4:SetActionItem(-1);
			end	
		elseif myCamp == 156 and m_SongBonusItemID <= 0 then
			SongliaoWarOver_SelfButton4:SetActionItem(-1);			
		elseif myCamp == 157 and m_LiaoBonusItemID <= 0 then
			SongliaoWarOver_SelfButton4:SetActionItem(-1);		
		end

		if nFinal==1 and m_RYVictoryValue > 0 then
			theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_RYVictoryValue)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton5:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton5:SetActionItem(-1);
			end
		elseif nFinal==1 and m_RYVictoryValue <= 0 then	
			SongliaoWarOver_SelfButton5:SetActionItem(-1);
		end

		if nFinal==1 and m_BonusItemNum1 > 0 then
			theAction = DataPool:CreateActionItemForShow(m_BonusItemID1, m_BonusItemNum1)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton6:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton6:SetActionItem(-1);
			end		
		elseif nFinal==1 and m_BonusItemNum1 <= 0 then
			SongliaoWarOver_SelfButton6:SetActionItem(-1);			
		end

	else
		if m_LossRYRankValue > 0 then
			theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_LossRYRankValue)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton3:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton3:SetActionItem(-1);
			end
		elseif m_LossRYRankValue <= 0 then
			SongliaoWarOver_SelfButton3:SetActionItem(-1);			
		end


		if  myCamp == 156 and m_SongBonusItemID > 0 then
			theAction = DataPool:CreateActionItemForShow(m_SongBonusItemID, m_SongBonusItemNum)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton4:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton4:SetActionItem(-1);
			end
		elseif myCamp == 157 and m_LiaoBonusItemID > 0 then
			theAction = DataPool:CreateActionItemForShow(m_LiaoBonusItemID, m_LiaoBonusItemNum)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton4:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton4:SetActionItem(-1);
			end
		elseif  myCamp == 156 and m_SongBonusItemID <= 0 then
			SongliaoWarOver_SelfButton4:SetActionItem(-1);
		elseif myCamp == 157 and m_LiaoBonusItemID <= 0 then			
			SongliaoWarOver_SelfButton4:SetActionItem(-1);			
		end
	
		if  nFinal==1 and m_RYLossValue > 0 then 
			theAction = DataPool:CreateActionItemForShow(m_RYItemID, m_RYLossValue)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton5:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton5:SetActionItem(-1);
			end
		elseif  nFinal==1 and m_RYLossValue <= 0 then 
			SongliaoWarOver_SelfButton5:SetActionItem(-1);
		end

		if  nFinal==1 and m_BonusItemNum2 >0 then
			theAction = DataPool:CreateActionItemForShow(m_BonusItemID2, m_BonusItemNum2)
			if theAction:GetID() ~= 0 then 
				SongliaoWarOver_SelfButton6:SetActionItem(theAction:GetID())
			else
				SongliaoWarOver_SelfButton6:SetActionItem(-1);
			end
		elseif  nFinal==1 and m_BonusItemNum2 <= 0 then
			SongliaoWarOver_SelfButton6:SetActionItem(-1);
		end

	end


	if ( g_select == 1 and myCamp == 156 ) or ( g_select == 0 and myCamp == 157 ) then
	else
		SongliaoWarOver_SelfRank:SetText("无排名")
		SongliaoWarOver_SelfRankImage:Hide()
	end

end
