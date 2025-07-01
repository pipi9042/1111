--怀旧兵行四象-核心逻辑
--2022-7-6 10:40:06 lanna

x502011_g_scriptId = 502011
x502011_g_SceneHumanMax = 60 --副本人数上限
x502011_g_BaoHuBUFF = 95 --宋辽保护BUFF
x502011_g_Relivepos = {{307,310},{73,82}} --宋辽传送点,复活点位置
--x502011_g_nEndTimes = 25 * 60 --副本的持续时间（25分钟）
x502011_g_CloseTick = 60	 	--副本关闭前倒计时（单位：次数）
x502011_g_TickTime = 1	   		--回调脚本的时钟时间（单位：秒/次）
x502011_g_NoUserTime = 20 * 1000  	--副本中没有人后可以继续保存的时间（单位：秒）
x502011_g_Score = {}			--每个玩家积分
x502011_g_HumanID = {}			--每个玩家ID
x502011_g_PlayerCamp_Song = 156
x502011_g_PlayerCamp_Liao = 157
x502011_g_PlayerCampImpact_Song = 32442
x502011_g_PlayerCampImpact_Liao = 32443
x502011_g_JiTanName = {
	[1] = "青龙",
	[2] = "白虎",
	[3] = "玄武",
	[4] = "朱雀",
}
x502011_g_JiTanPos = {
	[1] = {285,195},
	[2] = {105,195},
	[3] = {194,107},
	[4] = {191,282},
}
x502011_g_JiTanRaids = 22	--产生积分的距离


x502011_g_CampName = {
	[156] = "大宋",
	[157] = "大辽",
}

--NPC的对话信息
x502011_NpcTalk = {
	[1] = {"宋军统帅","#{XSLDZ_180521_239}","set:NPCHead02 image:NPCHead02_2",8000},
	[2] = {"辽军统帅","#{XSLDZ_180521_240}","set:NPCHead02 image:NPCHead02_1",8000},
	
	[3] = {"宋军统帅","#{XSLDZ_180521_241}","set:NPCHead02 image:NPCHead02_2",8000},
	[4] = {"辽军统帅","#{XSLDZ_180521_241}","set:NPCHead02 image:NPCHead02_1",8000},
	--青龙祭坛激活
	[5] = {"宋军统帅","#{XSLDZ_180521_247}","set:NPCHead02 image:NPCHead02_2",8000},
	[6] = {"辽军统帅","#{XSLDZ_180521_248}","set:NPCHead02 image:NPCHead02_1",8000},
	--我方已将X祭坛占领
	[7] = {"宋军统帅","#{XSLDZ_180521_255}","set:NPCHead02 image:NPCHead02_2",8000},
	[8] = {"辽军统帅","#{XSLDZ_180521_255}","set:NPCHead02 image:NPCHead02_1",8000},
	--敌方已将X祭坛占领
	[9] = {"宋军统帅","#{XSLDZ_180521_256}","set:NPCHead02 image:NPCHead02_2",8000},
	[10] = {"辽军统帅","#{XSLDZ_180521_256}","set:NPCHead02 image:NPCHead02_1",8000},
	--平分秋色
	[11] = {"宋军统帅","#{XSLDZ_180521_257}","set:NPCHead02 image:NPCHead02_2",8000},
	[12] = {"辽军统帅","#{XSLDZ_180521_257}","set:NPCHead02 image:NPCHead02_1",8000},
	
	[13] = {"宋军统帅","#{XSLDZ_180521_258}","set:NPCHead02 image:NPCHead02_2",8000},
	[14] = {"辽军统帅","#{XSLDZ_180521_258}","set:NPCHead02 image:NPCHead02_1",8000},
	[15] = {"宋军统帅","#{XSLDZ_180521_259}","set:NPCHead02 image:NPCHead02_2",8000},
	[16] = {"辽军统帅","#{XSLDZ_180521_259}","set:NPCHead02 image:NPCHead02_1",8000},
	[17] = {"宋军统帅","#{XSLDZ_180521_260}","set:NPCHead02 image:NPCHead02_2",8000},
	[18] = {"辽军统帅","#{XSLDZ_180521_260}","set:NPCHead02 image:NPCHead02_1",8000},
	[19] = {"宋军统帅","#{XSLDZ_180521_261}","set:NPCHead02 image:NPCHead02_2",8000},
	[20] = {"辽军统帅","#{XSLDZ_180521_261}","set:NPCHead02 image:NPCHead02_1",8000},
	[21] = {"宋军统帅","#{XSLDZ_180521_262}","set:NPCHead02 image:NPCHead02_2",8000},
	[22] = {"辽军统帅","#{XSLDZ_180521_262}","set:NPCHead02 image:NPCHead02_1",8000},
	[23] = {"宋军统帅","#{XSLDZ_180521_263}","set:NPCHead02 image:NPCHead02_2",8000},
	[24] = {"辽军统帅","#{XSLDZ_180521_263}","set:NPCHead02 image:NPCHead02_1",8000},
	[25] = {"宋军统帅","#{XSLDZ_180521_264}","set:NPCHead02 image:NPCHead02_2",8000},
	[26] = {"辽军统帅","#{XSLDZ_180521_264}","set:NPCHead02 image:NPCHead02_1",8000},
	[27] = {"宋军统帅","#{XSLDZ_180521_265}","set:NPCHead02 image:NPCHead02_2",8000},
	[28] = {"辽军统帅","#{XSLDZ_180521_265}","set:NPCHead02 image:NPCHead02_1",8000},
	--#W%s祭坛封印已除，还请诸位全力掠获%s之力。待到祭坛重封之时，若我方所获多于敌军，便可将其收入囊中。
	[29] = {"宋军统帅","#{XSLDZ_180521_315}","set:NPCHead02 image:NPCHead02_2",8000},
	[30] = {"辽军统帅","#{XSLDZ_180521_315}","set:NPCHead02 image:NPCHead02_1",8000},
}

--副本公共数据信息
x502011_g_SceneData_ID = 0				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
x502011_g_SceneData_ScriptID = 1		--将1号数据设置为副本场景事件脚本号
x502011_g_SceneData_TickCount = 2		--设置定时器调用次数
x502011_g_SceneData_CloseFlag = 3		--设置副本关闭标志, 0开放，1关闭
x502011_g_SceneData_LeaveTimeCount = 4	--设置离开倒计时次数
--x502011_g_SceneData_State = 5			--当前副本的运行状态
x502011_g_SceneData_CampScoure_Song = 6	--宋积分
x502011_g_SceneData_CampScoure_Liao = 7	--辽积分
x502011_g_SceneData_JiTanQingLong = 8	--青龙的祭坛归属
x502011_g_SceneData_JiTanBaiHu = 9		--白虎的祭坛归属
x502011_g_SceneData_JiTanXuanWu = 10	--玄武的祭坛归属
x502011_g_SceneData_JiTanZhuQue = 11	--朱雀的祭坛归属

--副本运行状态
--x502011_g_SceneState_NULL = 0 			--状态为空
--x502011_g_SceneState_30S = 1			--30S倒计时阶段
--x502011_g_SceneState_QingLong60S = 2	--青龙祭坛解封60S准备
--x502011_g_SceneState_QingLongOpen = 3 	--青龙祭坛已解除封印

--正式的祭坛状态时钟
x502011_g_SongliaoWarSingle_Battle_Start = 10030
x502011_g_SongliaoWarSingle_Battle_OneTimeBegin = 10090
x502011_g_SongliaoWarSingle_Battle_OneTimeEnd = 10390
x502011_g_SongliaoWarSingle_Battle_TwoTimeBegin = 10450
x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd = 10750
x502011_g_SongliaoWarSingle_Battle_ThreeTimeBegin = 10810
x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd = 11110
x502011_g_SongliaoWarSingle_Battle_FourTimeBegin = 11170
x502011_g_SongliaoWarSingle_Battle_FourTimeEnd = 11470

--玩家私人数据信息
x502011_g_PlayerSelf_MySuccKill = 63	--持有战旗数量
x502011_g_PlayerSelf_Camp = 62			--阵营信息
x502011_g_PlayerSelf_KillNum = 61		--击杀敌人数量
x502011_g_PlayerSelf_Scoure = 60		--增加的阵营分数

--战场时间设定
x502011_g_Campagin_Time ={{20,40},{21,30}} 
--**********************************
--活动时间判断
--**********************************
function x502011_GetCampaginTimer(sceneId)
	local nWeek = GetTodayWeek()
	-- if nWeek ~= 1 and nWeek ~= 3 and nWeek ~= 5 then
		-- return 0,0
	-- end
	local nStartTime = x502011_g_Campagin_Time[1][1] *60 + x502011_g_Campagin_Time[1][2]
	local nEndTime = x502011_g_Campagin_Time[2][1] *60 + x502011_g_Campagin_Time[2][2]
	local nNowTime = floor(mod((LuaFnGetCurrentTime()+28800),86400)/60)
	local is_InTime,nOverTime = 0,0
	if  nStartTime <= nNowTime and   nEndTime >= nNowTime  then
		is_InTime = 1
		nOverTime = nEndTime - nNowTime 
	end
	return is_InTime,nOverTime
end

--**********************************
--创建副本
--**********************************
function x502011_MakeCopyScene( sceneId, selfId )

	local nLeaderGuid = LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "songliao_dazhan.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, nLeaderGuid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x502011_g_NoUserTime);
	LuaFnSetCopySceneData_PvpRuler( sceneId, 3 )  -- 竞技规则
	LuaFnSetCopySceneData_Timer(sceneId, x502011_g_TickTime * 1000);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_ID, FUBEN_SONGLIAO);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_ScriptID, 502011);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_TickCount, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CloseFlag, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_LeaveTimeCount, 0);--设置离开倒计时次数
	--LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_State, x502011_g_SceneState_NULL); --当前副本的运行状态
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao, 0);
	--祭坛归属
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanQingLong, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanBaiHu, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanXuanWu, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanZhuQue, 0);
	
	
	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "songliao_dazhan_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "songliao_dazhan_monster.ini" )
	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
	if bRetSceneID >0 then
		AddText(sceneId,"副本创建成功"); --H宋辽战场副本创建成功！
	else
		AddText(sceneId,"副本创建失败");
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
--**********************************
--副本事件--副本装载完毕
--**********************************
function x502011_OnCopySceneReady( sceneId, destsceneId )
	local nLeaderGuid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	local nLeaderObjId = LuaFnGuid2ObjId(sceneId,nLeaderGuid)
	if LuaFnIsCanDoScriptLogic( sceneId, nLeaderObjId ) ~= 1 then	-- 处于无法执行逻辑的状态
		return
	end
	if nLeaderObjId == -1 then	 -- 找不到该玩家
		return
	end
	--开始进行玩家分配
	local HumanHP = {}
	local HumanID = {}
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount  do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		local Humanhp = GetMaxHp(sceneId, nHumanId)    
		HumanID[i] = nHumanId  	     
		HumanHP[i] = Humanhp
		if i > x502011_g_SceneHumanMax then
			nHumanCount = i
			break
		end
	end
	--对大数进行一次排序
	for i = 1,nHumanCount do
        for j = 1,i do             
			if HumanHP[i] > HumanHP[j]  then
				local temp = HumanHP[i]
				local tempID = HumanID[i]
				HumanHP[i] = HumanHP[j]
				HumanID[i] = HumanID[j]
				HumanHP[j] = temp
				HumanID[j] = tempID
			end
	end
	end  
	--玩家数据初始化以及位置初始化
	for i = 1,nHumanCount do
		if HumanID[i] ~= nil and HumanID[i] >= 15000 then
			if mod(i,2) == 0 then    
				--宋
				SetMissionCacheData(sceneId, HumanID[i], x502011_g_PlayerSelf_Camp, x502011_g_PlayerCamp_Song)
				CallScriptFunction( (400900), "TransferFunc", sceneId,  HumanID[i], destsceneId, x502011_g_Relivepos[1][1] , x502011_g_Relivepos[1][2] )
			else  
				SetMissionCacheData(sceneId, HumanID[i], x502011_g_PlayerSelf_Camp, x502011_g_PlayerCamp_Liao)
				CallScriptFunction( (400900), "TransferFunc", sceneId,  HumanID[i], destsceneId, x502011_g_Relivepos[2][1] , x502011_g_Relivepos[2][2] )
			end
		end
	end
end
--**********************************
--玩家进入副本
--**********************************
function x502011_OnPlayerEnter( sceneId, playerId )
	--恢复气血
	RestoreHp( sceneId, playerId )
	RestoreMp( sceneId, playerId )
	RestoreRage( sceneId, playerId)	 

	local nTempCampID = GetMissionCacheData(sceneId, playerId, x502011_g_PlayerSelf_Camp)
	if nTempCampID == x502011_g_PlayerCamp_Liao then	 
		SetUnitCampID(sceneId,playerId ,playerId, x502011_g_PlayerCamp_Liao)
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0",sceneId ,x502011_g_Relivepos[2][1] , x502011_g_Relivepos[2][2] )
		--NPCTalk信息
		x502011_SendNpcTalk(sceneId,playerId,4)
		LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId,x502011_g_PlayerCampImpact_Liao, 0)
		--标记阵营为辽
		SetMissionFlag(sceneId,playerId,MF_NewSongLiaoIsSong,0)
	else
		SetUnitCampID(sceneId,playerId ,playerId, x502011_g_PlayerCamp_Song)
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0",sceneId ,x502011_g_Relivepos[1][1] , x502011_g_Relivepos[1][2] )
		--NPCTalk信息
		x502011_SendNpcTalk(sceneId,playerId,3)
		LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId,x502011_g_PlayerCampImpact_Song, 0)
		--标记阵营为宋
		SetMissionFlag(sceneId,playerId,MF_NewSongLiaoIsSong,1)
	end
	SetPvpAuthorizationFlagByID(sceneId, playerId, 2, 1) 
	--战旗数量默认为1
	SetMissionCacheData(sceneId,playerId,x502011_g_PlayerSelf_MySuccKill,1);
	--其他数据初始化
	SetMissionCacheData(sceneId,playerId,x502011_g_PlayerSelf_KillNum,0);
	SetMissionCacheData(sceneId,playerId,x502011_g_PlayerSelf_Scoure,0);
	--标记参与了新宋辽
	SetMissionFlag(sceneId,playerId,MF_JoinNewSongLiao,1)
	--取消保护BUFF
--	LuaFnCancelSpecificImpact(sceneId,playerId,x502011_g_BaoHuBUFF) 
	--x502011_MsgBox( sceneId, playerId,"#{SLDZ_100805_43}")--H你已进入宋辽战场！
end

--**********************************
--副本时钟
--此处1S回调一次
--**********************************
function x502011_OnCopySceneTimer( sceneId, nowTime )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum < 1 then
		return
	end
	--NPC说话事件
--	x502011_TipAllHumanPaoPao( sceneId, 0,nPaoPaoID )
--	x502011_TipAllHumanPaoPao( sceneId, 2,nPaoPaoID )
	--副本时钟递增
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x502011_g_SceneData_TickCount )
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param(sceneId,x502011_g_SceneData_TickCount,TickCount)
	--广播天门阵具体信息
	x502011_BroadCastCSongliaoWarData( sceneId )
	
--	if x502011_g_nEndTimes - TickCount == 10 then	
--		x502011_TipAllHuman( sceneId, "时间到，结束战斗" )
--	end
	
	local nCopySceneFlag = LuaFnGetCopySceneData_Param( sceneId, x502011_g_SceneData_CloseFlag )
	if nCopySceneFlag == 0 then --副本正常运作
		if TickCount < 1 then
			x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_181}" )
			return
		end
		if TickCount == 2 or  TickCount == 5 then
			x502011_MonsterTalk( sceneId )
			return
		end
		if TickCount == 10  then
			x502011_TipAllHuman( sceneId, format("四象战事将于%d秒后展开，还请各位做好准备。",20) )
			x502011_MonsterTalk( sceneId )
			return
		end
		if TickCount == 20  then
			x502011_TipAllHuman( sceneId, format("四象战事将于%d秒后展开，还请各位做好准备。",10) )
			x502011_MonsterTalk( sceneId )
			return
		end
		if TickCount >= 25 and TickCount < 30   then
			x502011_TipAllHuman( sceneId, format("四象战事将于%d秒后展开，还请各位做好准备。",30 - TickCount) )
			x502011_MonsterTalk( sceneId )
			return
		end
		--进入战斗阶段
		if TickCount == 30   then
			LuaFnSetCopySceneData_Param(sceneId,x502011_g_SceneData_TickCount,x502011_g_SongliaoWarSingle_Battle_Start)
			x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_299}")
			
			local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
			for i = 1,nHumanCount do   
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
				if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
						
					local nTempCampID = GetUnitCampID(sceneId, nHumanId,nHumanId)
					if nTempCampID == x502011_g_PlayerCamp_Liao then	
						x502011_SendNpcTalk(sceneId,PlayerId,2,"#{XSLDZ_180521_300}")
					else
						x502011_SendNpcTalk(sceneId,PlayerId,1,"#{XSLDZ_180521_300}")
					end
				end
			end
			x502011_MonsterTalk( sceneId )
			
			return
		end
		--处于战斗阶段，但是青龙祭坛没有激活  青龙祭坛祭坛激活:xxx秒
		if (TickCount < x502011_g_SongliaoWarSingle_Battle_OneTimeBegin and TickCount > x502011_g_SongliaoWarSingle_Battle_Start ) then 
			TickCount = x502011_g_SongliaoWarSingle_Battle_OneTimeBegin - TickCount
			
			if TickCount == 30 then
				x502011_TipAllHuman( sceneId, "青龙祭坛将于30秒后解除封印。")
				return
			end
		end
		--//////////////////////////////////////////////////
		--祭坛修整状态
		--//////////////////////////////////////////////////
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_OneTimeEnd
			and TickCount < x502011_g_SongliaoWarSingle_Battle_TwoTimeBegin then
			
			TickCount = x502011_g_SongliaoWarSingle_Battle_OneTimeEnd - TickCount
			if TickCount == 0 then
				--结算
				x502011_OnJiTanEnd(sceneId,1)
				x502011_TipAllHuman( sceneId, "白虎祭坛将于60秒后解除封印。")
				return
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd
			and TickCount < x502011_g_SongliaoWarSingle_Battle_ThreeTimeBegin then
			
			TickCount = x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd - TickCount
			if TickCount == 0 then
				--结算
				x502011_OnJiTanEnd(sceneId,2)
				x502011_TipAllHuman( sceneId, "玄武祭坛将于60秒后解除封印。")
				return
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd
			and TickCount < x502011_g_SongliaoWarSingle_Battle_FourTimeBegin then
		
			TickCount = x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd - TickCount
			if TickCount == 0 then
				--结算
				x502011_OnJiTanEnd(sceneId,3)
				x502011_TipAllHuman( sceneId, "朱雀祭坛将于60秒后解除封印。")
				return
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_FourTimeEnd then
			
			TickCount = x502011_g_SongliaoWarSingle_Battle_FourTimeEnd - TickCount
			if TickCount == 0 then
				--结算
				x502011_OnJiTanEnd(sceneId,4)
				return
			end
			--最终结算
			x502011_OnFinalCompute(sceneId)
			return
		end
		--//////////////////////////////////////////////////
		--祭坛积分结算
		--5S为一个结算周期
		--//////////////////////////////////////////////////
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_OneTimeBegin and
			TickCount < x502011_g_SongliaoWarSingle_Battle_OneTimeEnd then
			--为青龙祭坛周围的玩家结算
			if mod(TickCount,5) == 0 then
				x502011_RefreshPlayerRankScore(sceneId,1)
			end
			TickCount = x502011_g_SongliaoWarSingle_Battle_OneTimeEnd - TickCount
			if TickCount == 0 or TickCount == 1 then
				x502011_OnJiTanOpen(sceneId,1)
			end
			if TickCount == 120 then
				x502011_OnJiTanNearEnd(sceneId,1,1)
			end
			if TickCount == 60 then
				x502011_OnJiTanNearEnd(sceneId,2,1)
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_TwoTimeBegin and
			TickCount < x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd then
			--为白虎祭坛周围的玩家结算
			if mod(TickCount,5) == 0 then
				x502011_RefreshPlayerRankScore(sceneId,2)
			end
			TickCount = x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd - TickCount
			if TickCount == 0 or TickCount == 1 then
				x502011_OnJiTanOpen(sceneId,2)
			end
			if TickCount == 120 then
				x502011_OnJiTanNearEnd(sceneId,1,2)
			end
			if TickCount == 60 then
				x502011_OnJiTanNearEnd(sceneId,2,2)
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_ThreeTimeBegin and
			TickCount < x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd then
			--为玄武祭坛周围的玩家结算
			if mod(TickCount,5) == 0 then
				x502011_RefreshPlayerRankScore(sceneId,3)
			end
			TickCount = x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd - TickCount
			if TickCount == 0 or TickCount == 1 then
				x502011_OnJiTanOpen(sceneId,3)
			end
			if TickCount == 120 then
				x502011_OnJiTanNearEnd(sceneId,1,3)
			end
			if TickCount == 60 then
				x502011_OnJiTanNearEnd(sceneId,2,3)
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_FourTimeBegin and
			TickCount < x502011_g_SongliaoWarSingle_Battle_FourTimeEnd then
			--为朱雀祭坛周围的玩家结算
			if mod(TickCount,5) == 0 then
				x502011_RefreshPlayerRankScore(sceneId,4)
			end
			TickCount = x502011_g_SongliaoWarSingle_Battle_FourTimeEnd - TickCount
			if TickCount == 0 or TickCount == 1 then
				x502011_OnJiTanOpen(sceneId,4)
			end
			if TickCount == 120 then
				x502011_OnJiTanNearEnd(sceneId,1,4)
			end
			if TickCount == 60 then
				x502011_OnJiTanNearEnd(sceneId,2,4)
			end
		end
		
	elseif nCopySceneFlag == 1 then --副本关闭，宋辽大战结束
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_LeaveTimeCount)
		if leaveTickCount == x502011_g_CloseTick then --倒计时间到，大家都出去吧
			x502011_GoAwayAllPeople(sceneId)
		elseif leaveTickCount < x502011_g_CloseTick then
			if mod(leaveTickCount,10) == 0 then
				x502011_TipAllHuman( sceneId, format("四象祭坛均已再度封印，将于%d秒后离开此地。", (x502011_g_CloseTick-leaveTickCount)*x502011_g_TickTime ))
			end
		end
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_LeaveTimeCount, leaveTickCount) ;
	end
end

--*********************************
--最终结算
--【IMPORTANT】
--*********************************
function compare_NewSongLiaoResult(a,b)
	return a.scoure > b.scoure
end
function x502011_OnFinalCompute(sceneId)
	local nJiTanState = {x502011_g_SceneData_JiTanQingLong,x502011_g_SceneData_JiTanBaiHu,x502011_g_SceneData_JiTanXuanWu,x502011_g_SceneData_JiTanZhuQue}
	local nNumOfS = 0
	local nNumOfL = 0
	for i = 1,getn(nJiTanState) do
		local nState = LuaFnGetCopySceneData_Param(sceneId, nJiTanState[i]);
		if nState == x502011_g_PlayerCamp_Song then
			nNumOfS  = nNumOfS + 1
		end
		if nState == x502011_g_PlayerCamp_Liao then
			nNumOfL  = nNumOfL + 1
		end
	end
	--平局，双方判负
	local nSongWin = 0
	local nLiaoWin = 0
	if nNumOfL == nNumOfS then
		x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_324}")
		MonsterTalk(sceneId, -1, "四象天门阵","#{XSLDZ_180521_326}")
	else
		if nNumOfL > nNumOfS then
			--辽胜
			x502011_TipAllHuman( sceneId, "此战辽军所占祭坛居多，已赢得本场胜利。")
			MonsterTalk(sceneId, -1, "四象天门阵","#P此次兵行四象#G辽军#P所占祭坛居多，已赢得本场战事胜利。")
			nLiaoWin = 1
		else
			--宋胜
			x502011_TipAllHuman( sceneId, "此战宋军所占祭坛居多，已赢得本场胜利。")
			MonsterTalk(sceneId, -1, "四象天门阵","#P此次兵行四象#G宋军#P所占祭坛居多，已赢得本场战事胜利。")
			nSongWin = 1
		end
	end
	--标记副本结束
	LuaFnSetCopySceneData_Param( sceneId, x502011_g_SceneData_CloseFlag,1 )
	--双方玩家数据排序
	local tPlayerListSong = {}
	local tPlayerListLiao = {}
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			local nFlagNum = GetMissionCacheData(sceneId,nHumanId,x502011_g_PlayerSelf_MySuccKill)
			local nScoure = GetMissionCacheData(sceneId,nHumanId,x502011_g_PlayerSelf_Scoure)
			local nFinalResult = 0
			
			if nCampID == x502011_g_PlayerCamp_Song then
				tinsert(tPlayerListSong,{flagNum = nFlagNum,scoure = nScoure,objid = nHumanId})
				if nSongWin == 1 then
					nFinalResult = 1
				end
			end
			if nCampID == x502011_g_PlayerCamp_Liao then
				tinsert(tPlayerListLiao,{flagNum = nFlagNum,scoure = nScoure,objid = nHumanId})
				if nLiaoWin == 1 then
					nFinalResult = 1
				end
			end
			if nLiaoWin == nSongWin then
				nFinalResult = 2--平局
			end
			SetPvpAuthorizationFlagByID(sceneId,nHumanId, 2, 0)--设定PVP状态
			SetUnitCampID(sceneId,nHumanId,nHumanId, -1) --重新设定阵营
			SetMissionDataEx(sceneId,nHumanId,MDEX_NEWSONGLIAO_FINALRESULT,nFinalResult)--设置此次结果
			--标记领取状态为空
			SetMissionFlag(sceneId,nHumanId,MF_NewSongLiaoGetPrize,0)
			--客户端结束UI开启
			BeginUICommand( sceneId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, nHumanId, 502011 )
		end
	end
	sort(tPlayerListSong,compare_NewSongLiaoResult)
	sort(tPlayerListLiao,compare_NewSongLiaoResult)
	
	--记录名次
	for i = 1,getn(tPlayerListSong) do
		local nObjid = tPlayerListSong[i].objid
		SetMissionDataEx(sceneId,nObjid,MDEX_NEWSONGLIAO_PRIZE_LEVEL,i);
	end
	for i = 1,getn(tPlayerListLiao) do
		local nObjid = tPlayerListLiao[i].objid
		SetMissionDataEx(sceneId,nObjid,MDEX_NEWSONGLIAO_PRIZE_LEVEL,i);
	end
	
--	local m_nIndex,m_SongBonusItemID,m_SongBonusItemNum,m_SongBonusProNum,
--		    m_LiaoBonusItemID,m_LiaoBonusItemNum,m_LiaoonusProNum,
--			m_BonusItemID1,m_BonusItemNum1,m_BonusProNum1,
--			m_BonusItemID2,m_BonusItemNum2,m_BonusProNum2,
--			m_RYValue,m_RYVictoryValue,m_LossRYRankValue,m_RYLossValue = Lua_GetSongLiaoBonusInfo(0)
--	if m_nIndex == nil then
--		return
--	end	
end
--*********************************
--祭坛争夺开始
--*********************************
function x502011_OnJiTanOpen(sceneId,nIndex)
	if nIndex < 1 or nIndex > 4 then
		return
	end
	--x502011_TipAllHuman( sceneId, "朱雀祭坛已解除封印。")
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			x502011_MsgBox( sceneId, nHumanId, format("%s祭坛已解除封印。",x502011_g_JiTanName[nIndex]) )
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			if nCampID == x502011_g_PlayerCamp_Song then
				x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("#W%s祭坛封印已除，还请诸位全力掠获%s之力。待到祭坛重封之时，若我方所获多于敌军，便可将其收入囊中。",
						x502011_g_JiTanName[nIndex],x502011_g_JiTanName[nIndex]))
			else
				x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("#W%s祭坛封印已除，还请诸位全力掠获%s之力。待到祭坛重封之时，若我方所获多于敌军，便可将其收入囊中。",
						x502011_g_JiTanName[nIndex],x502011_g_JiTanName[nIndex]))
			end
		end
	end
end
--*********************************
--祭坛争夺即将结束
--全场玩家提醒
--*********************************
function x502011_OnJiTanNearEnd(sceneId,nType,nIndex)
	--nType 1:剩2分 2:剩1分
	if nIndex < 1 or nIndex > 4 then
		return
	end
	local nScoreS = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song)
	local nScoreL = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao)
	
	local nResult = 0
	if nScoreS > nScoreL then
		nResult = x502011_g_PlayerCamp_Song
	end
	if nScoreS < nScoreL then
		nResult = x502011_g_PlayerCamp_Liao
	end
	
	--发送NPC的图贴
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			if nResult == 0 then
				if nCampID == x502011_g_PlayerCamp_Song then
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("%s祭坛将于2分钟后关闭，我军与对方平分秋色，还请诸位多加努力，击败敌军，为我军占领此地！",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("距离%s祭坛关闭只余1分钟，我军与对方平分秋色，还请诸位多加努力，击败敌军，为我军占领此地！",
						x502011_g_JiTanName[nIndex]))
					end
				else
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("%s祭坛将于2分钟后关闭，我军与对方平分秋色，还请诸位多加努力，击败敌军，为我军占领此地！",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("距离%s祭坛关闭只余1分钟，我军与对方平分秋色，还请诸位多加努力，击败敌军，为我军占领此地！",
						x502011_g_JiTanName[nIndex]))
					end
				end
				return
			end
			if nResult == nCampID then
				if nCampID == x502011_g_PlayerCamp_Song then
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("%s祭坛将于2分钟后关闭，我军目前略有领先，还请诸位再接再厉，保持优势，为我军占领此地！",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("距离%s祭坛关闭只余1分钟，我军目前处于上风，诸位可莫要放松，决计不能给对方机会，定要夺下此地！",
						x502011_g_JiTanName[nIndex]))
					end
				else
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("%s祭坛将于2分钟后关闭，我军目前略有领先，还请诸位再接再厉，保持优势，为我军占领此地！",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("距离%s祭坛关闭只余1分钟，我军目前处于上风，诸位可莫要放松，决计不能给对方机会，定要夺下此地！",
						x502011_g_JiTanName[nIndex]))
					end
				end
			else
				if nCampID == x502011_g_PlayerCamp_Song then
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("%s祭坛将于2分钟后关闭，我军目前稍显落后，诸位还请多加坚持，助我军扭转乾坤！",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("距离%s祭坛关闭只余1分钟，我军目前稍显落后，诸位可莫要放弃，请尽力将敌军驱逐出境，为我军反败为胜！",
						x502011_g_JiTanName[nIndex]))
					end
				else
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("%s祭坛将于2分钟后关闭，我军目前稍显落后，诸位还请多加坚持，助我军扭转乾坤！",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("距离%s祭坛关闭只余1分钟，我军目前稍显落后，诸位可莫要放弃，请尽力将敌军驱逐出境，为我军反败为胜！",
						x502011_g_JiTanName[nIndex]))
					end
				end
			end
			
		end
	end
end
--*********************************
--祭坛争夺结束，计算归属
--不计算最终归属
--*********************************
function x502011_OnJiTanEnd(sceneId,nIndex)
	if nIndex < 1 or nIndex > 4 then
		AddGlobalCountNews(sceneId,"[四象天门阵]祭坛结算错误，请联系客服解决问题 nIndex:"..nIndex)
		return
	end
	
	local nScoreS = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song)
	local nScoreL = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao)
	
	local nResult = 0
	if nScoreS > nScoreL then
		nResult = x502011_g_PlayerCamp_Song
	end
	if nScoreS < nScoreL then
		nResult = x502011_g_PlayerCamp_Liao
	end
	local nJiTanState = {x502011_g_SceneData_JiTanQingLong,x502011_g_SceneData_JiTanBaiHu,x502011_g_SceneData_JiTanXuanWu,x502011_g_SceneData_JiTanZhuQue}
	LuaFnSetCopySceneData_Param(sceneId, nJiTanState[nIndex], nResult);
	
	if nResult ~= 0 then
		x502011_TipAllHuman( sceneId, format("%s祭坛已被%s占领",x502011_g_JiTanName[nIndex],x502011_g_CampName[nResult]))
		MonsterTalk(sceneId, -1, "四象天门阵",format("#P因#G%s#P所获#G%s之力#P居多，故#G%s#P祭坛已被#G%s#P占领。",
			x502011_g_CampName[nResult],
			x502011_g_JiTanName[nIndex],
			x502011_g_JiTanName[nIndex],
			x502011_g_CampName[nResult]))
	else
		--平分秋色
		x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_310}")
		MonsterTalk(sceneId, -1, "四象天门阵",format("#P宋辽双方所获#G%s之力#P不分伯仲，故#G%s#P祭坛无人占领。",x502011_g_JiTanName[nIndex]))
	end
	
	--双方比分清空
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song,0)
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao,0)
	
	if nIndex >= 4 then
		return
	end
	--发送NPC的图贴
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			if nResult == 0 then
				if nCampID == x502011_g_PlayerCamp_Song then
					x502011_SendNpcTalk(sceneId,nHumanId,11,
					format("此战两军平分秋色，无人能将%s祭坛收入囊中。然%s祭坛解封在即，还望诸位重整旗鼓，速速前往祭坛之所在，齐心协作将其一举拿下。",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				else
					x502011_SendNpcTalk(sceneId,nHumanId,12,
					format("此战两军平分秋色，无人能将%s祭坛收入囊中。然%s祭坛解封在即，还望诸位重整旗鼓，速速前往祭坛之所在，齐心协作将其一举拿下。",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				end
				return
			end
			if nResult == nCampID then
				if nCampID == x502011_g_PlayerCamp_Song then
					x502011_SendNpcTalk(sceneId,nHumanId,11,
					format("捷报！承蒙诸位齐心协作，我方已将%s祭坛占领！然%s祭坛解封在即，还望诸位速速前往，携此战之余威，将其一并拿下。",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				else
					x502011_SendNpcTalk(sceneId,nHumanId,12,
					format("捷报！承蒙诸位齐心协作，我方已将%s祭坛占领！然%s祭坛解封在即，还望诸位速速前往，携此战之余威，将其一并拿下。",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				end
			else
				if nCampID == x502011_g_PlayerCamp_Song then
					x502011_SendNpcTalk(sceneId,nHumanId,11,
					format("很遗憾，%s祭坛已被敌方占领。然%s祭坛解封在即，还望诸位重整旗鼓，速速前往祭坛之所在，齐心协作将其一举拿下。",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				else
					x502011_SendNpcTalk(sceneId,nHumanId,12,
					format("很遗憾，%s祭坛已被敌方占领。然%s祭坛解封在即，还望诸位重整旗鼓，速速前往祭坛之所在，齐心协作将其一举拿下。",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				end
			end
			
		end
	end
	
end
--*********************************
--刷新每位玩家的个人积分
--*********************************
function x502011_RefreshPlayerRankScore(sceneId,nIndex)
	local nPosX = x502011_g_JiTanPos[nIndex][1];
	local nPosZ = x502011_g_JiTanPos[nIndex][2];

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			local PlayerX = GetHumanWorldX(sceneId,nHumanId)
			local PlayerZ = GetHumanWorldZ(sceneId,nHumanId)
			local nDistance = floor(sqrt((nPosX-PlayerX)*(nPosX-PlayerX)+(nPosZ-PlayerZ)*(nPosZ-PlayerZ)))
			--nDistance
--			x502011_MsgBox( sceneId, nHumanId, "nDistance "..nDistance )
			if nDistance <= x502011_g_JiTanRaids then
				local nSuccKill = GetMissionCacheData(sceneId,nHumanId,x502011_g_PlayerSelf_MySuccKill);
				if nSuccKill < 1 then
					nSuccKill = 1
					SetMissionCacheData(sceneId,nHumanId,x502011_g_PlayerSelf_MySuccKill,nSuccKill);
				end
				nSuccKill = x502011_GetScore( nSuccKill)
				if nSuccKill > 0 then
					local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
					x502011_MsgBox( sceneId, nHumanId, format("您为本方夺取%s点%s之力。",tostring(nSuccKill),x502011_g_JiTanName[nIndex]) )
					--个人积分增加
					local nCurSelfScoure = GetMissionCacheData(sceneId,nHumanId,x502011_g_PlayerSelf_Scoure);
					SetMissionCacheData(sceneId,nHumanId,x502011_g_PlayerSelf_Scoure,nCurSelfScoure + nSuccKill);
	
					local nScore = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song) + nSuccKill;
					if nCampID == x502011_g_PlayerCamp_Liao then
						nScore = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao) + nSuccKill;
						LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao,nScore);
					else
						LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song,nScore);
					end
					
				end
			end
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x502011_OnKillObject( sceneId, selfId, objdataId, objId )
	
end
--**********************************
--人物死亡事件
--**********************************
function x502011_OnHumanDie(sceneId, dieId, nHumanId)
	-- 如果这个杀手是个宠物，需要现找到主人
	local nObjType = GetCharacterType(sceneId, nHumanId);
	local killerId = -1;
	if nObjType then
		if nObjType == 1 then	
			killerId = nHumanId
		elseif nObjType == 3 then
			killerId = GetPetCreator(sceneId, nHumanId);
		else
			return
		end
	end
	if killerId == -1 then
		--死的莫名其妙
		return
	end
	if IsSameMAC(sceneId,dieId,killerId) > 0 then
		--相同的MAC，是小号，不记录
		--return
	end
	if GetUnitCampID(sceneId, killerId, killerId)  == GetUnitCampID(sceneId, dieId, dieId) then
		--同一个阵营就不能行
		return
	end
	--己方夺得对方一半的旗帜，对方旗帜变为1
	local nCurKillSuccKill = GetMissionCacheData(sceneId,killerId,x502011_g_PlayerSelf_MySuccKill);
	local nCurDieSuccKill = GetMissionCacheData(sceneId,dieId,x502011_g_PlayerSelf_MySuccKill);
	nCurDieSuccKill = floor(nCurDieSuccKill/2);
	if nCurDieSuccKill <= 0 then
		nCurDieSuccKill = 1
	end
	nCurKillSuccKill = nCurKillSuccKill + nCurDieSuccKill
	if nCurKillSuccKill >= 255 then
		nCurKillSuccKill = 255;
		x502011_MsgBox( sceneId, killerId,"#{XSLDZ_180521_333}" )
	end
	SetMissionCacheData(sceneId,killerId,x502011_g_PlayerSelf_MySuccKill,nCurKillSuccKill);
	SetMissionCacheData(sceneId,dieId,x502011_g_PlayerSelf_MySuccKill,1);
	--击杀数量统计
	local nCurKillNum = GetMissionCacheData(sceneId,killerId,x502011_g_PlayerSelf_KillNum);
	SetMissionCacheData(sceneId,killerId,x502011_g_PlayerSelf_KillNum,nCurKillNum + 1);
	--高击杀通报
	local nKillerCamp = GetUnitCampID(sceneId,killerId,killerId)
	if nCurKillSuccKill >= 15 then
		MonsterTalk(sceneId, -1, "四象天门阵",format("#P#G%s#P麾下的#{_INFOUSR%s}骁勇善战，已斩获#G%s#P面战旗，一时间风头无二，无人可挡！",
				x502011_g_CampName[nKillerCamp],GetName(sceneId,killerId),tostring(nCurKillSuccKill)))
	end
	--发送给Die击杀者信息
	--dieId
	BeginUICommand(sceneId)
		UICommand_AddInt( sceneId,LuaFnGetGUID(sceneId,killerId))
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,dieId, 2022070304)	
end

--*********************************
--副本人员清空
--*********************************
function x502011_GoAwayAllPeople(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
    for i = 1,nHumanCount do   
        local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		SetPvpAuthorizationFlagByID(sceneId,nHumanId, 2, 0)--设定PVP状态
		SetUnitCampID(sceneId,nHumanId,nHumanId, -1) --重新设定阵营
        CallScriptFunction( (400900), "TransferFunc",sceneId, nHumanId,1,random(192,194),random(143,145))
    end
end

--个人击杀分数计算
x502011_g_SongliaoWarSingle_Buff_Score =                                                        
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

--**********************************
--计算击杀后得到的分数
--**********************************
function x502011_GetScore( playerSucc)
	if playerSucc == nil then
		return 0
	end
	local nIndex = 1
	for i = 1,getn(x502011_g_SongliaoWarSingle_Buff_Score) do
		if playerSucc  >= x502011_g_SongliaoWarSingle_Buff_Score[i].succkillnum then
			nIndex = i
		end
	end

	return 1 * x502011_g_SongliaoWarSingle_Buff_Score[nIndex].bias
end

--**********************************
--广播副本内的具体信息
--**********************************
function x502011_BroadCastCSongliaoWarData( sceneId )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum < 1 then
		return
	end
	local nTickCount = LuaFnGetCopySceneData_Param( sceneId, x502011_g_SceneData_TickCount )
	local nScoreS = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song);
	local nScoreL = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao);
	local nJiTanState_1 = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanQingLong);
	local nJiTanState_2 = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanBaiHu);
	local nJiTanState_3 = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanXuanWu);
	local nJiTanState_4 = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanZhuQue);
	
	if nJiTanState_1 == x502011_g_PlayerCamp_Song then
		nJiTanState_1 = 1
	elseif nJiTanState_1 == x502011_g_PlayerCamp_Liao then
		nJiTanState_1 = 2
	end
	if nJiTanState_2 == x502011_g_PlayerCamp_Song then
		nJiTanState_2 = 1
	elseif nJiTanState_2 == x502011_g_PlayerCamp_Liao then
		nJiTanState_2 = 2
	end
	if nJiTanState_3 == x502011_g_PlayerCamp_Song then
		nJiTanState_3 = 1
	elseif nJiTanState_3 == x502011_g_PlayerCamp_Liao then
		nJiTanState_3 = 2
	end
	if nJiTanState_4 == x502011_g_PlayerCamp_Song then
		nJiTanState_4 = 1
	elseif nJiTanState_4 == x502011_g_PlayerCamp_Liao then
		nJiTanState_4 = 2
	end
	
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			--更新客户端信息
			LuaFnUpdateClientSongLiaoWarData(sceneId,nHumanId,nTickCount,nScoreS,nScoreL,nJiTanState_1,nJiTanState_2,nJiTanState_3,nJiTanState_4)
		end
	end
	
	
end


--**********************************
--氛围NPC
--**********************************
function x502011_MonsterTalk( sceneId )
	MonsterTalk(sceneId, 0, "四象天门阵","#{XSLDZ_180521_112}")
	MonsterTalk(sceneId, 2, "四象天门阵","#{XSLDZ_180521_112}")
end


--**********************************
--向副本所有玩家广播泡泡
--**********************************
function x502011_TipAllHumanPaoPao( sceneId, targetId,nPaoPaoID )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		Msg2Player(  sceneId, nHumanId,"@*;npcpaopao;"..targetId..";"..nPaoPaoID,MSG2PLAYER_PARA )
	end
end

--**********************************
--副本内广播剧情画框
--**********************************
function x502011_BroadCastNpcTalk( sceneId, nIndex,nStr )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			x502011_SendNpcTalk(sceneId,nHumanId,nIndex,nStr)
		end
	end
end

--**********************************
--剧情画框
--**********************************
function x502011_SendNpcTalk(sceneId,selfId,nIndex,nStr)
	BeginUICommand(sceneId)
		UICommand_AddString( sceneId,x502011_NpcTalk[nIndex][1])
		if nStr == nil then
			UICommand_AddString( sceneId,x502011_NpcTalk[nIndex][2])
		else
			UICommand_AddString( sceneId,nStr)
		end
		UICommand_AddString( sceneId,x502011_NpcTalk[nIndex][3])
		UICommand_AddInt( sceneId,x502011_NpcTalk[nIndex][4])
		UICommand_AddInt( sceneId,0)
		UICommand_AddInt( sceneId,0)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 201708311)	
end

--**********************************
--提示所有副本内玩家
--**********************************
function x502011_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, nHumanId)
		end
	end
end

--**********************************
--消息提示
--**********************************
function x502011_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x502011_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end



