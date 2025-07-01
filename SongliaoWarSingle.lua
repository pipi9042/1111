
local SongliaoWarSingle_Battle_OneTimeBegin = 10090  --SongLiaoWarSingle.lua ������һ���ĺ�
local SongliaoWarSingle_Battle_OneTimeEnd = 10390
local SongliaoWarSingle_Battle_TwoTimeBegin = 10450
local SongliaoWarSingle_Battle_TwoTimeEnd = 10750
local SongliaoWarSingle_Battle_ThreeTimeBegin = 10810
local SongliaoWarSingle_Battle_ThreeTimeEnd = 11110
local SongliaoWarSingle_Battle_FourTimeBegin = 11170
local SongliaoWarSingle_Battle_FourTimeEnd = 11470--SongLiaoWarSingle.lua ������һ���ĺ�
local SongliaoWarSingle_Battle_Wait = "set:SongLiao01 image:SL_Wait"
local SongliaoWarSingle_Battle_JiHuo = "set:SongLiao01 image:SL_Ping"

local SongliaoWarSingle_Song = "set:SongLiao01 image:SL_Song"
local SongliaoWarSingle_Liao = "set:SongLiao01 image:SL_Liao"
local SongliaoWarSingle_Ping = "set:SongLiao01 image:SL_Ping"
local SongliaoWarSingle_Battle_JiShaScore = 
{
	[1]=10,[2]=11,[3]=12,[4]=13,[5]=14,[6]=15,[7]=16,[8]=17,[9]=18,[10]=19,[11]=20,
}

local SongliaoWarSingle_Buff_Score =                                                        
{                                                                                
{  succkillnum = 1,bias=10},  
{  succkillnum = 2,bias=12},  
{  succkillnum = 3,bias=14},  
{  succkillnum = 4,bias=16},  
{  succkillnum = 5,bias=18},  
{  succkillnum = 6,bias=20},  
{  succkillnum = 7,bias=22},  
{  succkillnum = 8,bias=24},  
{  succkillnum = 9,bias=26},  
{  succkillnum = 10,bias=28}, 
{  succkillnum = 11,bias=30},
}       
local g_SongLiaoWarSingle_Frame_UnifiedXPosition;
local g_SongLiaoWarSingle_Frame_UnifiedYPosition;
function SongliaoWarSingle_PreLoad()
	this:RegisterEvent("SCENE_TRANSED");
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("ADJEST_UI_POS");
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED");
end

function SongliaoWarSingle_OnLoad()
	-- ???????????
	g_SongLiaoWarSingle_Frame_UnifiedXPosition	= SongliaoWarSingle : GetProperty("UnifiedXPosition");
	g_SongLiaoWarSingle_Frame_UnifiedYPosition	= SongliaoWarSingle : GetProperty("UnifiedYPosition");
		
end

function SongliaoWarSingle_OnEvent(event)

	if (event=="SCENE_TRANSED") then
        if (548 ~= GetSceneID()) then
			DataPool:ClearSongliaoData()
			this:Hide()
			return
		end
		local myRet, myName, myCamp, myScore = DataPool:GetSongliaoWarMyScore()
		if myRet == 1 then
			local songScore,liaoScore=DataPool:GetSongliaoWarCampScore()
			SongliaoWarSingle_SongNum:SetText(tostring(songScore))
			SongliaoWarSingle_LiaoNum:SetText(tostring(liaoScore))
			local MaxScore = songScore + liaoScore
			
			if tonumber(MaxScore) == 0  then
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
			else
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(songScore, MaxScore)
			end
			SongliaoWarSingle_Battle_Fresh()
			this:Show()
		end
	elseif (event=="PLAYER_LEAVE_WORLD") then 
		if( this:IsVisible() ) then
			this:Hide()
		end
	elseif (event=="UI_COMMAND" and tonumber(arg0) == 2022070302) then
		if (548 ~= GetSceneID()) then  
			return
		end
		if arg1=="1" then
			
			local myRet, myName, myCamp, myScore = DataPool:GetSongliaoWarMyScore()
	
			local songScore,liaoScore=DataPool:GetSongliaoWarCampScore()
			SongliaoWarSingle_SongNum:SetText(tostring(songScore))
			SongliaoWarSingle_LiaoNum:SetText(tostring(liaoScore))
			local MaxScore = songScore + liaoScore
			
			if tonumber(MaxScore) == 0  then
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
			else
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(songScore, MaxScore)
			end
			SongliaoWarSingle_Battle_Fresh()
			this:Show()
		end
	elseif (event=="UI_COMMAND" and tonumber(arg0) == 2022070303) then

		if (548 ~= GetSceneID()) then  
			return
		end
		local myRet, myName, myCamp, myScore = DataPool:GetSongliaoWarMyScore()

		local nTick = DataPool:GetSongliaoWarTick()
		if nTick > SongliaoWarSingle_Battle_FourTimeEnd then
			this:Hide()
		else
			if myRet == 1 and IsWindowShow("SongliaoWarOver") == false then
				PushEvent("UI_COMMAND",2022070302,1)
			end
		end

		SongliaoWarSingle_Battle_Fresh()
	elseif (event == "ADJEST_UI_POS" ) then
		
		SongliaoWarSingle_Frame_On_ResetPos();
	elseif (event == "VIEW_RESOLUTION_CHANGED" ) then
		SongliaoWarSingle_Frame_On_ResetPos();
	end
end

function SongliaoWarSingle_Open()
	PushEvent("UI_COMMAND",2022070305)
    this:Hide()
end

function SongliaoWarSingle_Goto()

	local nTick = DataPool:GetSongliaoWarTick()

	if nTick < SongliaoWarSingle_Battle_OneTimeBegin-60 then
		PushDebugMessage("#{XSLDZ_180521_308}")
	elseif nTick < SongliaoWarSingle_Battle_OneTimeEnd then
		local tooltip = string.format("#H�������Զ�ǰ��%s��̳��","����")
		PushDebugMessage(tooltip)
		AutoRunToTarget(280.13, 195.09)		
	elseif nTick < SongliaoWarSingle_Battle_TwoTimeEnd then
		local tooltip = string.format("#H�������Զ�ǰ��%s��̳��","�׻�")
		PushDebugMessage(tooltip)
		AutoRunToTarget(105.34, 194.68)		
	elseif nTick < SongliaoWarSingle_Battle_ThreeTimeEnd then
		local tooltip = string.format("#H�������Զ�ǰ��%s��̳��","����")
		PushDebugMessage(tooltip)
		AutoRunToTarget(193.83, 106.62)			
	elseif nTick < SongliaoWarSingle_Battle_FourTimeEnd then
		local tooltip = string.format("#H�������Զ�ǰ��%s��̳��","��ȸ")
		PushDebugMessage(tooltip)
		AutoRunToTarget(192.09, 282.09)	
	end

end

function SongliaoWarSingle_Help1()
	local str = "#{XSLDZ_180521_238}"
end

function SongliaoWarSingle_Help2()
end


function SongliaoWarSingle_Battle_Fresh()	

	SongliaoWarSingle_QLImage:SetProperty("Image", "set:SongLiao02 image:SL_QL_Big2_Dis")
	SongliaoWarSingle_BHImage:SetProperty("Image", "set:SongLiao02 image:SL_BH_Big2_Dis")
	SongliaoWarSingle_XWImage:SetProperty("Image", "set:SongLiao02 image:SL_XW_Big2_Dis")
	SongliaoWarSingle_ZQImage:SetProperty("Image", "set:SongLiao02 image:SL_ZQ_Big2_Dis")

	local nTick = DataPool:GetSongliaoWarTick()
	local myRet, myName, myCamp, myScore, mykillNum, myGUID,mySuccKill = DataPool:GetSongliaoWarMyScore()
	if mySuccKill == nil then
		return
	end
	local nSucckill =  SongliaoWarSingle_Frame_GetScore(mySuccKill)
	local nSucckilltext = string.format("#G%s��", nSucckill)
	SongliaoWarSingle_Time:SetText(nSucckilltext)

	local mysucckilltext = string.format("#G%s��", mySuccKill)
	SongliaoWarSingle_Text3:SetText(mysucckilltext)


	local chiyouzhanqi = string.format("#cfff263����#G%s#cfff263ս�죺", "�ξ�")
	if myCamp == 157 then
		chiyouzhanqi = string.format("#cfff263����#G%s#cfff263ս�죺", "�ɾ�")
	end
	SongliaoWarSingle_Text2:SetText(chiyouzhanqi)

	local nStateWinner1=  DataPool:GetSongliaoWarStateWinner(1)
	local nStateWinner2=  DataPool:GetSongliaoWarStateWinner(2)
	local nStateWinner3=  DataPool:GetSongliaoWarStateWinner(3)
	local nStateWinner4=  DataPool:GetSongliaoWarStateWinner(4)

	 
	SongliaoWarSingle_Frame_JiefengZhong(1,3)  --XSLDZ_180521_304	#Tδ���
	SongliaoWarSingle_Frame_JiefengZhong(2,3)  --XSLDZ_180521_304	#Tδ���
	SongliaoWarSingle_Frame_JiefengZhong(3,3)  --XSLDZ_180521_304	#Tδ���
	SongliaoWarSingle_Frame_JiefengZhong(4,3)  --XSLDZ_180521_304	#Tδ���

	if nTick >= SongliaoWarSingle_Battle_FourTimeEnd then
		SongliaoWarSingle_QLText1BK:Hide()
		SongliaoWarSingle_QLText2BK:Hide()
		SongliaoWarSingle_BHText1BK:Hide()
		SongliaoWarSingle_BHText2BK:Hide()
		SongliaoWarSingle_XWText1BK:Hide()
		SongliaoWarSingle_XWText2BK:Hide()
		SongliaoWarSingle_ZQText1BK:Hide()
		SongliaoWarSingle_ZQText2BK:Hide()
	elseif nTick >= SongliaoWarSingle_Battle_ThreeTimeEnd then
		SongliaoWarSingle_QLText1BK:Hide()
		SongliaoWarSingle_QLText2BK:Hide()
		SongliaoWarSingle_BHText1BK:Hide()
		SongliaoWarSingle_BHText2BK:Hide()
		SongliaoWarSingle_XWText1BK:Hide()
		SongliaoWarSingle_XWText2BK:Hide()
	elseif nTick >= SongliaoWarSingle_Battle_TwoTimeEnd then
		SongliaoWarSingle_QLText1BK:Hide()
		SongliaoWarSingle_QLText2BK:Hide()
		SongliaoWarSingle_BHText1BK:Hide()
		SongliaoWarSingle_BHText2BK:Hide()
	elseif nTick >= SongliaoWarSingle_Battle_OneTimeEnd then
		SongliaoWarSingle_QLText1BK:Hide()
		SongliaoWarSingle_QLText2BK:Hide()
 	end

	if nTick >= SongliaoWarSingle_Battle_OneTimeEnd then
		SongliaoWarSingle_QLHold:Show()
		if nStateWinner1 == 1 then 
			SongliaoWarSingle_QLHold:SetProperty("Image", SongliaoWarSingle_Song)
		elseif nStateWinner1 == 2 then 
			SongliaoWarSingle_QLHold:SetProperty("Image", SongliaoWarSingle_Liao)
		else 
			SongliaoWarSingle_QLHold:SetProperty("Image", SongliaoWarSingle_Ping)
		end
		SongliaoWarSingle_QLImage:SetProperty("Image", "set:SongLiao02 image:SL_QL_Big2")
	else												
		SongliaoWarSingle_QLHold:Hide()
	end

	if nTick >= SongliaoWarSingle_Battle_TwoTimeEnd then
		SongliaoWarSingle_BHHold:Show()
		if nStateWinner2 == 1 then  --��
			SongliaoWarSingle_BHHold:SetProperty("Image", SongliaoWarSingle_Song)
		elseif nStateWinner2 == 2 then  --��
			SongliaoWarSingle_BHHold:SetProperty("Image", SongliaoWarSingle_Liao)
		else  --ƽ
			SongliaoWarSingle_BHHold:SetProperty("Image", SongliaoWarSingle_Ping)
		end
		SongliaoWarSingle_BHImage:SetProperty("Image", "set:SongLiao02 image:SL_BH_Big2")
	else
		SongliaoWarSingle_BHHold:Hide()
	end

	if nTick >= SongliaoWarSingle_Battle_ThreeTimeEnd then
		SongliaoWarSingle_XWHold:Show()
		if nStateWinner3 == 1 then 
			SongliaoWarSingle_XWHold:SetProperty("Image", SongliaoWarSingle_Song)
		elseif nStateWinner3 == 2 then 
			SongliaoWarSingle_XWHold:SetProperty("Image", SongliaoWarSingle_Liao)
		else 
			SongliaoWarSingle_XWHold:SetProperty("Image", SongliaoWarSingle_Ping)
		end
		SongliaoWarSingle_XWImage:SetProperty("Image", "set:SongLiao02 image:SL_XW_Big2")
	else
		SongliaoWarSingle_XWHold:Hide()
	end

	if nTick >= SongliaoWarSingle_Battle_FourTimeEnd then
		SongliaoWarSingle_ZQHold:Show()
		if nStateWinner4 == 1 then
			SongliaoWarSingle_ZQHold:SetProperty("Image", SongliaoWarSingle_Song)
		elseif nStateWinner4 == 2 then
			SongliaoWarSingle_ZQHold:SetProperty("Image", SongliaoWarSingle_Liao)
		else
			SongliaoWarSingle_ZQHold:SetProperty("Image", SongliaoWarSingle_Ping)
		end
		SongliaoWarSingle_ZQImage:SetProperty("Image", "set:SongLiao02 image:SL_ZQ_Big2")
	else
		SongliaoWarSingle_ZQHold:Hide()
	end

	--SongliaoWarSingle_Icon:SetProperty("Image",SongliaoWarSingle_Battle_JiHuo)
	if nTick >= SongliaoWarSingle_Battle_OneTimeBegin and nTick < SongliaoWarSingle_Battle_OneTimeEnd then
		nTick = SongliaoWarSingle_Battle_OneTimeEnd - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_QLTime:SetToolTip("#{XSLDZ_180424_24}")
		SongliaoWarSingle_QLImage:SetProperty("Image", "set:SongLiao02 image:SL_QL_Big2")
		local songScore,liaoScore=DataPool:GetSongliaoWarCampScore()
		if songScore~=nil and liaoScore~=nil then
			 SongliaoWarSingle_SongNum:SetText(tostring(songScore))
			 SongliaoWarSingle_LiaoNum:SetText(tostring(liaoScore))
			local MaxScore = songScore + liaoScore
			if tonumber(MaxScore) == 0  then
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
			else
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(songScore, MaxScore)
			end
		end
		SongliaoWarSingle_QLTime:SetProperty("Timer", tonumber(nTick));
		SongliaoWarSingle_Frame_JiefengZhong(1,2) --XSLDZ_180521_303	#A������
		
	elseif nTick >= SongliaoWarSingle_Battle_TwoTimeBegin and nTick < SongliaoWarSingle_Battle_TwoTimeEnd then
		nTick = SongliaoWarSingle_Battle_TwoTimeEnd - nTick
	
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_BHTime:SetToolTip("#{XSLDZ_180424_24}")

		SongliaoWarSingle_BHImage:SetProperty("Image", "set:SongLiao02 image:SL_BH_Big2")
		local songScore,liaoScore=DataPool:GetSongliaoWarCampScore()
		if songScore~=nil and liaoScore~=nil then
			 SongliaoWarSingle_SongNum:SetText(tostring(songScore))
			 SongliaoWarSingle_LiaoNum:SetText(tostring(liaoScore))
			local MaxScore = songScore + liaoScore
			if tonumber(MaxScore) == 0  then
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
			else
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(songScore, MaxScore)
			end
		end
		SongliaoWarSingle_BHTime:SetProperty("Timer", tonumber(nTick));
		SongliaoWarSingle_Frame_JiefengZhong(2,2) --XSLDZ_180521_303	#A������
	elseif nTick >= SongliaoWarSingle_Battle_ThreeTimeBegin and nTick < SongliaoWarSingle_Battle_ThreeTimeEnd then
		nTick = SongliaoWarSingle_Battle_ThreeTimeEnd - nTick

		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_XWTime:SetToolTip("#{XSLDZ_180424_24}")
		SongliaoWarSingle_XWImage:SetProperty("Image", "set:SongLiao02 image:SL_XW_Big2")

		local songScore,liaoScore=DataPool:GetSongliaoWarCampScore()
		if songScore~=nil and liaoScore~=nil then
			 SongliaoWarSingle_SongNum:SetText(tostring(songScore))
			 SongliaoWarSingle_LiaoNum:SetText(tostring(liaoScore))
			local MaxScore = songScore + liaoScore
			if tonumber(MaxScore) == 0  then
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
			else
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(songScore, MaxScore)
			end
		end

		SongliaoWarSingle_XWTime:SetProperty("Timer", tonumber(nTick));
		SongliaoWarSingle_Frame_JiefengZhong(3,2) --XSLDZ_180521_303	#A������
	elseif nTick >= SongliaoWarSingle_Battle_FourTimeBegin and nTick < SongliaoWarSingle_Battle_FourTimeEnd then
		nTick = SongliaoWarSingle_Battle_FourTimeEnd - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_ZQTime:SetToolTip("#{XSLDZ_180424_24}")
		SongliaoWarSingle_ZQImage:SetProperty("Image", "set:SongLiao02 image:SL_ZQ_Big2")
		local songScore,liaoScore=DataPool:GetSongliaoWarCampScore()
		if songScore~=nil and liaoScore~=nil then
			 SongliaoWarSingle_SongNum:SetText(tostring(songScore))
			 SongliaoWarSingle_LiaoNum:SetText(tostring(liaoScore))
			local MaxScore = songScore + liaoScore
			if tonumber(MaxScore) == 0  then
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
			else
				SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
				SongliaoWarSingle_Client_Progress:SetProgress(songScore, MaxScore)
			end
		end
		SongliaoWarSingle_ZQTime:SetProperty("Timer", tonumber(nTick));
		SongliaoWarSingle_Frame_JiefengZhong(4,2) --XSLDZ_180521_303	#A������
	elseif nTick < 30 then --����Ԥ���׶� ������̳��̳����:xxx��
		nTick = 60 - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_QLTime:SetToolTip("#{XSLDZ_180521_155}")
		--SongliaoWarSingle_Icon:SetProperty("Image",SongliaoWarSingle_Battle_Wait)
		--SongliaoWarSingle_QLTime:SetProperty("Timer", tonumber(nTick));
		--SongliaoWarSingle_Frame_JiefengZhong(1,1) --XSLDZ_180521_302	#A�����
	elseif (nTick < SongliaoWarSingle_Battle_OneTimeBegin and nTick > 10000 ) then --����ս���׶Σ�����������̳û�м���  ������̳��̳����:xxx��
		nTick = SongliaoWarSingle_Battle_OneTimeBegin - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_QLTime:SetToolTip("#{XSLDZ_180521_155}")
		--SongliaoWarSingle_Icon:SetProperty("Image",SongliaoWarSingle_Battle_Wait)
		SongliaoWarSingle_QLTime:SetProperty("Timer", tonumber(nTick));
		SongliaoWarSingle_Frame_JiefengZhong(1,1)--XSLDZ_180521_302	#A�����
	elseif nTick >= SongliaoWarSingle_Battle_OneTimeEnd and nTick < SongliaoWarSingle_Battle_TwoTimeBegin then --����ս���׶Σ�����������̳û�м���  ������̳��̳����:xxx��
		nTick = SongliaoWarSingle_Battle_TwoTimeBegin - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_BHTime:SetToolTip("#{XSLDZ_180521_155}")
		SongliaoWarSingle_BHTime:SetProperty("Timer", tonumber(nTick));
		--SongliaoWarSingle_Icon:SetProperty("Image",SongliaoWarSingle_Battle_Wait)

		SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
		SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
		SongliaoWarSingle_SongNum:SetText(tostring(0))
		SongliaoWarSingle_LiaoNum:SetText(tostring(0))
		SongliaoWarSingle_Frame_JiefengZhong(2,1)--XSLDZ_180521_302	#A�����
	elseif nTick >= SongliaoWarSingle_Battle_TwoTimeEnd and nTick < SongliaoWarSingle_Battle_ThreeTimeBegin then
		nTick = SongliaoWarSingle_Battle_ThreeTimeBegin - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_XWTime:SetToolTip("#{XSLDZ_180521_155}")
		SongliaoWarSingle_XWTime:SetProperty("Timer", tonumber(nTick));
		--SongliaoWarSingle_Icon:SetProperty("Image",SongliaoWarSingle_Battle_Wait)
		SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
		SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
		SongliaoWarSingle_SongNum:SetText(tostring(0))
		SongliaoWarSingle_LiaoNum:SetText(tostring(0))
		SongliaoWarSingle_Frame_JiefengZhong(3,1)
	elseif nTick >= SongliaoWarSingle_Battle_ThreeTimeEnd and nTick < SongliaoWarSingle_Battle_FourTimeBegin then
		nTick = SongliaoWarSingle_Battle_FourTimeBegin - nTick
		
		SongliaoWarSingle_Text:SetText("#{XSLDZ_180521_306}")
		SongliaoWarSingle_ZQTime:SetToolTip("#{XSLDZ_180521_155}")
		SongliaoWarSingle_ZQTime:SetProperty("Timer", tonumber(nTick));
		--SongliaoWarSingle_Icon:SetProperty("Image",SongliaoWarSingle_Battle_Wait)
		SongliaoWarSingle_Client_Progress2:SetProgress(100, 100)
		SongliaoWarSingle_Client_Progress:SetProgress(50, 100)
		SongliaoWarSingle_SongNum:SetText(tostring(0))
		SongliaoWarSingle_LiaoNum:SetText(tostring(0))
		SongliaoWarSingle_Frame_JiefengZhong(4,1)--XSLDZ_180521_302	#A�����
	end



	if  nTick >= SongliaoWarSingle_Battle_FourTimeEnd then
		nTick = 0
	end
end


function SongliaoWarSingle_Frame_On_ResetPos()

	
	SongliaoWarSingle : SetProperty("UnifiedXPosition", g_SongLiaoWarSingle_Frame_UnifiedXPosition);
	SongliaoWarSingle : SetProperty("UnifiedYPosition", g_SongLiaoWarSingle_Frame_UnifiedYPosition);

end



function SongliaoWarSingle_Frame_JiefengZhong(nType,jiefeng)

	if 1 == nType and jiefeng == 1 then 
	    SongliaoWarSingle_QLText1:SetText("#{XSLDZ_180521_302}") ----XSLDZ_180521_302	#A�����
		SongliaoWarSingle_QLText1BK:Show()
		SongliaoWarSingle_QLTimeBK:Show()
		SongliaoWarSingle_QLTime:Show()
		SongliaoWarSingle_QLText2BK:Hide()
	elseif 1 == nType and jiefeng == 2 then 
	    SongliaoWarSingle_QLText1:SetText("#{XSLDZ_180521_303}") --XSLDZ_180521_303	 #A������
		SongliaoWarSingle_QLText1BK:Show()
		SongliaoWarSingle_QLTimeBK:Show()
		SongliaoWarSingle_QLTime:Show()
		SongliaoWarSingle_QLText2BK:Hide()
	elseif 1 == nType and jiefeng == 3 then
	    SongliaoWarSingle_QLText2:SetText("#{XSLDZ_180521_304}") --XSLDZ_180521_304	#Tδ���
		SongliaoWarSingle_QLText2BK:Show()
		SongliaoWarSingle_QLTimeBK:Hide()
		SongliaoWarSingle_QLTime:Hide()
		SongliaoWarSingle_QLText1BK:Hide()
	elseif 2 == nType and jiefeng == 1  then
		SongliaoWarSingle_BHText1:SetText("#{XSLDZ_180521_302}") --XSLDZ_180521_302	#A�����
		SongliaoWarSingle_BHText1BK:Show()
		SongliaoWarSingle_BHTimeBK:Show()
		SongliaoWarSingle_BHTime:Show()
		SongliaoWarSingle_BHText2BK:Hide()
	elseif 2 == nType and jiefeng == 2  then
		SongliaoWarSingle_BHText1:SetText("#{XSLDZ_180521_303}")
		SongliaoWarSingle_BHText1BK:Show()
		SongliaoWarSingle_BHTimeBK:Show()
		SongliaoWarSingle_BHTime:Show()
		SongliaoWarSingle_BHText2BK:Hide()
	elseif 2 == nType and jiefeng == 3  then
		SongliaoWarSingle_BHText2:SetText("#{XSLDZ_180521_304}")
		SongliaoWarSingle_BHText2BK:Show()
		SongliaoWarSingle_BHTimeBK:Hide()
		SongliaoWarSingle_BHTime:Hide()
		SongliaoWarSingle_BHText1BK:Hide()
	elseif 3 == nType and jiefeng == 1  then
		SongliaoWarSingle_XWText1:SetText("#{XSLDZ_180521_302}")
		SongliaoWarSingle_XWText1BK:Show()
		SongliaoWarSingle_XWTimeBK:Show()
		SongliaoWarSingle_XWTime:Show()
		SongliaoWarSingle_XWText2BK:Hide()
	elseif 3 == nType and jiefeng == 2  then
		SongliaoWarSingle_XWText1:SetText("#{XSLDZ_180521_303}")
		SongliaoWarSingle_XWText1BK:Show()
		SongliaoWarSingle_XWTimeBK:Show()
		SongliaoWarSingle_XWTime:Show()
		SongliaoWarSingle_XWText2BK:Hide()
	elseif 3 == nType and jiefeng == 3  then
		SongliaoWarSingle_XWText2:SetText("#{XSLDZ_180521_304}")
		SongliaoWarSingle_XWText2BK:Show()
		SongliaoWarSingle_XWTimeBK:Hide()
		SongliaoWarSingle_XWTime:Hide()
		SongliaoWarSingle_XWText1BK:Hide()
	elseif 4 == nType and jiefeng == 1  then
		SongliaoWarSingle_ZQText1:SetText("#{XSLDZ_180521_302}")
		SongliaoWarSingle_ZQText1BK:Show()
		SongliaoWarSingle_ZQTimeBK:Show()
		SongliaoWarSingle_ZQTime:Show()
		SongliaoWarSingle_ZQText2BK:Hide()
	elseif 4 == nType and jiefeng == 2  then
		SongliaoWarSingle_ZQText1:SetText("#{XSLDZ_180521_303}")
		SongliaoWarSingle_ZQText1BK:Show()
		SongliaoWarSingle_ZQTimeBK:Show()
		SongliaoWarSingle_ZQTime:Show()
		SongliaoWarSingle_ZQText2BK:Hide()
	elseif 4 == nType and jiefeng == 3  then
		SongliaoWarSingle_ZQText2:SetText("#{XSLDZ_180521_304}")
		SongliaoWarSingle_ZQText2BK:Show()
		SongliaoWarSingle_ZQTimeBK:Hide()
		SongliaoWarSingle_ZQTime:Hide()
		SongliaoWarSingle_ZQText1BK:Hide()
	end


end


function SongliaoWarSingle_Frame_GetScore( playerSucc)
	
	if playerSucc == nil then
		return
	end
	local nIndex = 1
	for i = 1,table.getn(SongliaoWarSingle_Buff_Score) do
		if playerSucc  >= SongliaoWarSingle_Buff_Score[i].succkillnum then
			nIndex = i
		end
	end

	return 1 * SongliaoWarSingle_Buff_Score[nIndex].bias

end

function SongliaoWarSingle_Help1_Click()
	PushEvent("UI_COMMAND",20211201, 2)
end

function SongliaoWarSingle_Help2_Click()
	PushEvent("UI_COMMAND",20211201, 3)
end