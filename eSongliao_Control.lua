--���ɱ�������-�����߼�
--2022-7-6 10:40:06 lanna

x502011_g_scriptId = 502011
x502011_g_SceneHumanMax = 60 --������������
x502011_g_BaoHuBUFF = 95 --���ɱ���BUFF
x502011_g_Relivepos = {{307,310},{73,82}} --���ɴ��͵�,�����λ��
--x502011_g_nEndTimes = 25 * 60 --�����ĳ���ʱ�䣨25���ӣ�
x502011_g_CloseTick = 60	 	--�����ر�ǰ����ʱ����λ��������
x502011_g_TickTime = 1	   		--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x502011_g_NoUserTime = 20 * 1000  	--������û���˺���Լ��������ʱ�䣨��λ���룩
x502011_g_Score = {}			--ÿ����һ���
x502011_g_HumanID = {}			--ÿ�����ID
x502011_g_PlayerCamp_Song = 156
x502011_g_PlayerCamp_Liao = 157
x502011_g_PlayerCampImpact_Song = 32442
x502011_g_PlayerCampImpact_Liao = 32443
x502011_g_JiTanName = {
	[1] = "����",
	[2] = "�׻�",
	[3] = "����",
	[4] = "��ȸ",
}
x502011_g_JiTanPos = {
	[1] = {285,195},
	[2] = {105,195},
	[3] = {194,107},
	[4] = {191,282},
}
x502011_g_JiTanRaids = 22	--�������ֵľ���


x502011_g_CampName = {
	[156] = "����",
	[157] = "����",
}

--NPC�ĶԻ���Ϣ
x502011_NpcTalk = {
	[1] = {"�ξ�ͳ˧","#{XSLDZ_180521_239}","set:NPCHead02 image:NPCHead02_2",8000},
	[2] = {"�ɾ�ͳ˧","#{XSLDZ_180521_240}","set:NPCHead02 image:NPCHead02_1",8000},
	
	[3] = {"�ξ�ͳ˧","#{XSLDZ_180521_241}","set:NPCHead02 image:NPCHead02_2",8000},
	[4] = {"�ɾ�ͳ˧","#{XSLDZ_180521_241}","set:NPCHead02 image:NPCHead02_1",8000},
	--������̳����
	[5] = {"�ξ�ͳ˧","#{XSLDZ_180521_247}","set:NPCHead02 image:NPCHead02_2",8000},
	[6] = {"�ɾ�ͳ˧","#{XSLDZ_180521_248}","set:NPCHead02 image:NPCHead02_1",8000},
	--�ҷ��ѽ�X��̳ռ��
	[7] = {"�ξ�ͳ˧","#{XSLDZ_180521_255}","set:NPCHead02 image:NPCHead02_2",8000},
	[8] = {"�ɾ�ͳ˧","#{XSLDZ_180521_255}","set:NPCHead02 image:NPCHead02_1",8000},
	--�з��ѽ�X��̳ռ��
	[9] = {"�ξ�ͳ˧","#{XSLDZ_180521_256}","set:NPCHead02 image:NPCHead02_2",8000},
	[10] = {"�ɾ�ͳ˧","#{XSLDZ_180521_256}","set:NPCHead02 image:NPCHead02_1",8000},
	--ƽ����ɫ
	[11] = {"�ξ�ͳ˧","#{XSLDZ_180521_257}","set:NPCHead02 image:NPCHead02_2",8000},
	[12] = {"�ɾ�ͳ˧","#{XSLDZ_180521_257}","set:NPCHead02 image:NPCHead02_1",8000},
	
	[13] = {"�ξ�ͳ˧","#{XSLDZ_180521_258}","set:NPCHead02 image:NPCHead02_2",8000},
	[14] = {"�ɾ�ͳ˧","#{XSLDZ_180521_258}","set:NPCHead02 image:NPCHead02_1",8000},
	[15] = {"�ξ�ͳ˧","#{XSLDZ_180521_259}","set:NPCHead02 image:NPCHead02_2",8000},
	[16] = {"�ɾ�ͳ˧","#{XSLDZ_180521_259}","set:NPCHead02 image:NPCHead02_1",8000},
	[17] = {"�ξ�ͳ˧","#{XSLDZ_180521_260}","set:NPCHead02 image:NPCHead02_2",8000},
	[18] = {"�ɾ�ͳ˧","#{XSLDZ_180521_260}","set:NPCHead02 image:NPCHead02_1",8000},
	[19] = {"�ξ�ͳ˧","#{XSLDZ_180521_261}","set:NPCHead02 image:NPCHead02_2",8000},
	[20] = {"�ɾ�ͳ˧","#{XSLDZ_180521_261}","set:NPCHead02 image:NPCHead02_1",8000},
	[21] = {"�ξ�ͳ˧","#{XSLDZ_180521_262}","set:NPCHead02 image:NPCHead02_2",8000},
	[22] = {"�ɾ�ͳ˧","#{XSLDZ_180521_262}","set:NPCHead02 image:NPCHead02_1",8000},
	[23] = {"�ξ�ͳ˧","#{XSLDZ_180521_263}","set:NPCHead02 image:NPCHead02_2",8000},
	[24] = {"�ɾ�ͳ˧","#{XSLDZ_180521_263}","set:NPCHead02 image:NPCHead02_1",8000},
	[25] = {"�ξ�ͳ˧","#{XSLDZ_180521_264}","set:NPCHead02 image:NPCHead02_2",8000},
	[26] = {"�ɾ�ͳ˧","#{XSLDZ_180521_264}","set:NPCHead02 image:NPCHead02_1",8000},
	[27] = {"�ξ�ͳ˧","#{XSLDZ_180521_265}","set:NPCHead02 image:NPCHead02_2",8000},
	[28] = {"�ɾ�ͳ˧","#{XSLDZ_180521_265}","set:NPCHead02 image:NPCHead02_1",8000},
	--#W%s��̳��ӡ�ѳ���������λȫ���ӻ�%s֮����������̳�ط�֮ʱ�����ҷ�������ڵо�����ɽ����������С�
	[29] = {"�ξ�ͳ˧","#{XSLDZ_180521_315}","set:NPCHead02 image:NPCHead02_2",8000},
	[30] = {"�ɾ�ͳ˧","#{XSLDZ_180521_315}","set:NPCHead02 image:NPCHead02_1",8000},
}

--��������������Ϣ
x502011_g_SceneData_ID = 0				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
x502011_g_SceneData_ScriptID = 1		--��1����������Ϊ���������¼��ű���
x502011_g_SceneData_TickCount = 2		--���ö�ʱ�����ô���
x502011_g_SceneData_CloseFlag = 3		--���ø����رձ�־, 0���ţ�1�ر�
x502011_g_SceneData_LeaveTimeCount = 4	--�����뿪����ʱ����
--x502011_g_SceneData_State = 5			--��ǰ����������״̬
x502011_g_SceneData_CampScoure_Song = 6	--�λ���
x502011_g_SceneData_CampScoure_Liao = 7	--�ɻ���
x502011_g_SceneData_JiTanQingLong = 8	--�����ļ�̳����
x502011_g_SceneData_JiTanBaiHu = 9		--�׻��ļ�̳����
x502011_g_SceneData_JiTanXuanWu = 10	--����ļ�̳����
x502011_g_SceneData_JiTanZhuQue = 11	--��ȸ�ļ�̳����

--��������״̬
--x502011_g_SceneState_NULL = 0 			--״̬Ϊ��
--x502011_g_SceneState_30S = 1			--30S����ʱ�׶�
--x502011_g_SceneState_QingLong60S = 2	--������̳���60S׼��
--x502011_g_SceneState_QingLongOpen = 3 	--������̳�ѽ����ӡ

--��ʽ�ļ�̳״̬ʱ��
x502011_g_SongliaoWarSingle_Battle_Start = 10030
x502011_g_SongliaoWarSingle_Battle_OneTimeBegin = 10090
x502011_g_SongliaoWarSingle_Battle_OneTimeEnd = 10390
x502011_g_SongliaoWarSingle_Battle_TwoTimeBegin = 10450
x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd = 10750
x502011_g_SongliaoWarSingle_Battle_ThreeTimeBegin = 10810
x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd = 11110
x502011_g_SongliaoWarSingle_Battle_FourTimeBegin = 11170
x502011_g_SongliaoWarSingle_Battle_FourTimeEnd = 11470

--���˽��������Ϣ
x502011_g_PlayerSelf_MySuccKill = 63	--����ս������
x502011_g_PlayerSelf_Camp = 62			--��Ӫ��Ϣ
x502011_g_PlayerSelf_KillNum = 61		--��ɱ��������
x502011_g_PlayerSelf_Scoure = 60		--���ӵ���Ӫ����

--ս��ʱ���趨
x502011_g_Campagin_Time ={{20,40},{21,30}} 
--**********************************
--�ʱ���ж�
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
--��������
--**********************************
function x502011_MakeCopyScene( sceneId, selfId )

	local nLeaderGuid = LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "songliao_dazhan.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, nLeaderGuid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x502011_g_NoUserTime);
	LuaFnSetCopySceneData_PvpRuler( sceneId, 3 )  -- ��������
	LuaFnSetCopySceneData_Timer(sceneId, x502011_g_TickTime * 1000);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_ID, FUBEN_SONGLIAO);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_ScriptID, 502011);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_TickCount, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CloseFlag, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_LeaveTimeCount, 0);--�����뿪����ʱ����
	--LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_State, x502011_g_SceneState_NULL); --��ǰ����������״̬
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao, 0);
	--��̳����
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanQingLong, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanBaiHu, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanXuanWu, 0);
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_JiTanZhuQue, 0);
	
	
	--���ó����еĸ���Npc������
	LuaFnSetSceneLoad_Area( sceneId, "songliao_dazhan_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "songliao_dazhan_monster.ini" )
	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
	if bRetSceneID >0 then
		AddText(sceneId,"���������ɹ�"); --H����ս�����������ɹ���
	else
		AddText(sceneId,"��������ʧ��");
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
--**********************************
--�����¼�--����װ�����
--**********************************
function x502011_OnCopySceneReady( sceneId, destsceneId )
	local nLeaderGuid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	local nLeaderObjId = LuaFnGuid2ObjId(sceneId,nLeaderGuid)
	if LuaFnIsCanDoScriptLogic( sceneId, nLeaderObjId ) ~= 1 then	-- �����޷�ִ���߼���״̬
		return
	end
	if nLeaderObjId == -1 then	 -- �Ҳ��������
		return
	end
	--��ʼ������ҷ���
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
	--�Դ�������һ������
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
	--������ݳ�ʼ���Լ�λ�ó�ʼ��
	for i = 1,nHumanCount do
		if HumanID[i] ~= nil and HumanID[i] >= 15000 then
			if mod(i,2) == 0 then    
				--��
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
--��ҽ��븱��
--**********************************
function x502011_OnPlayerEnter( sceneId, playerId )
	--�ָ���Ѫ
	RestoreHp( sceneId, playerId )
	RestoreMp( sceneId, playerId )
	RestoreRage( sceneId, playerId)	 

	local nTempCampID = GetMissionCacheData(sceneId, playerId, x502011_g_PlayerSelf_Camp)
	if nTempCampID == x502011_g_PlayerCamp_Liao then	 
		SetUnitCampID(sceneId,playerId ,playerId, x502011_g_PlayerCamp_Liao)
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0",sceneId ,x502011_g_Relivepos[2][1] , x502011_g_Relivepos[2][2] )
		--NPCTalk��Ϣ
		x502011_SendNpcTalk(sceneId,playerId,4)
		LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId,x502011_g_PlayerCampImpact_Liao, 0)
		--�����ӪΪ��
		SetMissionFlag(sceneId,playerId,MF_NewSongLiaoIsSong,0)
	else
		SetUnitCampID(sceneId,playerId ,playerId, x502011_g_PlayerCamp_Song)
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0",sceneId ,x502011_g_Relivepos[1][1] , x502011_g_Relivepos[1][2] )
		--NPCTalk��Ϣ
		x502011_SendNpcTalk(sceneId,playerId,3)
		LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId,x502011_g_PlayerCampImpact_Song, 0)
		--�����ӪΪ��
		SetMissionFlag(sceneId,playerId,MF_NewSongLiaoIsSong,1)
	end
	SetPvpAuthorizationFlagByID(sceneId, playerId, 2, 1) 
	--ս������Ĭ��Ϊ1
	SetMissionCacheData(sceneId,playerId,x502011_g_PlayerSelf_MySuccKill,1);
	--�������ݳ�ʼ��
	SetMissionCacheData(sceneId,playerId,x502011_g_PlayerSelf_KillNum,0);
	SetMissionCacheData(sceneId,playerId,x502011_g_PlayerSelf_Scoure,0);
	--��ǲ�����������
	SetMissionFlag(sceneId,playerId,MF_JoinNewSongLiao,1)
	--ȡ������BUFF
--	LuaFnCancelSpecificImpact(sceneId,playerId,x502011_g_BaoHuBUFF) 
	--x502011_MsgBox( sceneId, playerId,"#{SLDZ_100805_43}")--H���ѽ�������ս����
end

--**********************************
--����ʱ��
--�˴�1S�ص�һ��
--**********************************
function x502011_OnCopySceneTimer( sceneId, nowTime )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum < 1 then
		return
	end
	--NPC˵���¼�
--	x502011_TipAllHumanPaoPao( sceneId, 0,nPaoPaoID )
--	x502011_TipAllHumanPaoPao( sceneId, 2,nPaoPaoID )
	--����ʱ�ӵ���
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x502011_g_SceneData_TickCount )
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param(sceneId,x502011_g_SceneData_TickCount,TickCount)
	--�㲥�����������Ϣ
	x502011_BroadCastCSongliaoWarData( sceneId )
	
--	if x502011_g_nEndTimes - TickCount == 10 then	
--		x502011_TipAllHuman( sceneId, "ʱ�䵽������ս��" )
--	end
	
	local nCopySceneFlag = LuaFnGetCopySceneData_Param( sceneId, x502011_g_SceneData_CloseFlag )
	if nCopySceneFlag == 0 then --������������
		if TickCount < 1 then
			x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_181}" )
			return
		end
		if TickCount == 2 or  TickCount == 5 then
			x502011_MonsterTalk( sceneId )
			return
		end
		if TickCount == 10  then
			x502011_TipAllHuman( sceneId, format("����ս�½���%d���չ���������λ����׼����",20) )
			x502011_MonsterTalk( sceneId )
			return
		end
		if TickCount == 20  then
			x502011_TipAllHuman( sceneId, format("����ս�½���%d���չ���������λ����׼����",10) )
			x502011_MonsterTalk( sceneId )
			return
		end
		if TickCount >= 25 and TickCount < 30   then
			x502011_TipAllHuman( sceneId, format("����ս�½���%d���չ���������λ����׼����",30 - TickCount) )
			x502011_MonsterTalk( sceneId )
			return
		end
		--����ս���׶�
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
		--����ս���׶Σ�����������̳û�м���  ������̳��̳����:xxx��
		if (TickCount < x502011_g_SongliaoWarSingle_Battle_OneTimeBegin and TickCount > x502011_g_SongliaoWarSingle_Battle_Start ) then 
			TickCount = x502011_g_SongliaoWarSingle_Battle_OneTimeBegin - TickCount
			
			if TickCount == 30 then
				x502011_TipAllHuman( sceneId, "������̳����30�������ӡ��")
				return
			end
		end
		--//////////////////////////////////////////////////
		--��̳����״̬
		--//////////////////////////////////////////////////
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_OneTimeEnd
			and TickCount < x502011_g_SongliaoWarSingle_Battle_TwoTimeBegin then
			
			TickCount = x502011_g_SongliaoWarSingle_Battle_OneTimeEnd - TickCount
			if TickCount == 0 then
				--����
				x502011_OnJiTanEnd(sceneId,1)
				x502011_TipAllHuman( sceneId, "�׻���̳����60�������ӡ��")
				return
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd
			and TickCount < x502011_g_SongliaoWarSingle_Battle_ThreeTimeBegin then
			
			TickCount = x502011_g_SongliaoWarSingle_Battle_TwoTimeEnd - TickCount
			if TickCount == 0 then
				--����
				x502011_OnJiTanEnd(sceneId,2)
				x502011_TipAllHuman( sceneId, "�����̳����60�������ӡ��")
				return
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd
			and TickCount < x502011_g_SongliaoWarSingle_Battle_FourTimeBegin then
		
			TickCount = x502011_g_SongliaoWarSingle_Battle_ThreeTimeEnd - TickCount
			if TickCount == 0 then
				--����
				x502011_OnJiTanEnd(sceneId,3)
				x502011_TipAllHuman( sceneId, "��ȸ��̳����60�������ӡ��")
				return
			end
		end
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_FourTimeEnd then
			
			TickCount = x502011_g_SongliaoWarSingle_Battle_FourTimeEnd - TickCount
			if TickCount == 0 then
				--����
				x502011_OnJiTanEnd(sceneId,4)
				return
			end
			--���ս���
			x502011_OnFinalCompute(sceneId)
			return
		end
		--//////////////////////////////////////////////////
		--��̳���ֽ���
		--5SΪһ����������
		--//////////////////////////////////////////////////
		if TickCount >= x502011_g_SongliaoWarSingle_Battle_OneTimeBegin and
			TickCount < x502011_g_SongliaoWarSingle_Battle_OneTimeEnd then
			--Ϊ������̳��Χ����ҽ���
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
			--Ϊ�׻���̳��Χ����ҽ���
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
			--Ϊ�����̳��Χ����ҽ���
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
			--Ϊ��ȸ��̳��Χ����ҽ���
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
		
	elseif nCopySceneFlag == 1 then --�����رգ����ɴ�ս����
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, x502011_g_SceneData_LeaveTimeCount)
		if leaveTickCount == x502011_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
			x502011_GoAwayAllPeople(sceneId)
		elseif leaveTickCount < x502011_g_CloseTick then
			if mod(leaveTickCount,10) == 0 then
				x502011_TipAllHuman( sceneId, format("�����̳�����ٶȷ�ӡ������%d����뿪�˵ء�", (x502011_g_CloseTick-leaveTickCount)*x502011_g_TickTime ))
			end
		end
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_LeaveTimeCount, leaveTickCount) ;
	end
end

--*********************************
--���ս���
--��IMPORTANT��
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
	--ƽ�֣�˫���и�
	local nSongWin = 0
	local nLiaoWin = 0
	if nNumOfL == nNumOfS then
		x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_324}")
		MonsterTalk(sceneId, -1, "����������","#{XSLDZ_180521_326}")
	else
		if nNumOfL > nNumOfS then
			--��ʤ
			x502011_TipAllHuman( sceneId, "��ս�ɾ���ռ��̳�Ӷ࣬��Ӯ�ñ���ʤ����")
			MonsterTalk(sceneId, -1, "����������","#P�˴α�������#G�ɾ�#P��ռ��̳�Ӷ࣬��Ӯ�ñ���ս��ʤ����")
			nLiaoWin = 1
		else
			--��ʤ
			x502011_TipAllHuman( sceneId, "��ս�ξ���ռ��̳�Ӷ࣬��Ӯ�ñ���ʤ����")
			MonsterTalk(sceneId, -1, "����������","#P�˴α�������#G�ξ�#P��ռ��̳�Ӷ࣬��Ӯ�ñ���ս��ʤ����")
			nSongWin = 1
		end
	end
	--��Ǹ�������
	LuaFnSetCopySceneData_Param( sceneId, x502011_g_SceneData_CloseFlag,1 )
	--˫�������������
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
				nFinalResult = 2--ƽ��
			end
			SetPvpAuthorizationFlagByID(sceneId,nHumanId, 2, 0)--�趨PVP״̬
			SetUnitCampID(sceneId,nHumanId,nHumanId, -1) --�����趨��Ӫ
			SetMissionDataEx(sceneId,nHumanId,MDEX_NEWSONGLIAO_FINALRESULT,nFinalResult)--���ô˴ν��
			--�����ȡ״̬Ϊ��
			SetMissionFlag(sceneId,nHumanId,MF_NewSongLiaoGetPrize,0)
			--�ͻ��˽���UI����
			BeginUICommand( sceneId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, nHumanId, 502011 )
		end
	end
	sort(tPlayerListSong,compare_NewSongLiaoResult)
	sort(tPlayerListLiao,compare_NewSongLiaoResult)
	
	--��¼����
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
--��̳���Ὺʼ
--*********************************
function x502011_OnJiTanOpen(sceneId,nIndex)
	if nIndex < 1 or nIndex > 4 then
		return
	end
	--x502011_TipAllHuman( sceneId, "��ȸ��̳�ѽ����ӡ��")
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			x502011_MsgBox( sceneId, nHumanId, format("%s��̳�ѽ����ӡ��",x502011_g_JiTanName[nIndex]) )
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			if nCampID == x502011_g_PlayerCamp_Song then
				x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("#W%s��̳��ӡ�ѳ���������λȫ���ӻ�%s֮����������̳�ط�֮ʱ�����ҷ�������ڵо�����ɽ����������С�",
						x502011_g_JiTanName[nIndex],x502011_g_JiTanName[nIndex]))
			else
				x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("#W%s��̳��ӡ�ѳ���������λȫ���ӻ�%s֮����������̳�ط�֮ʱ�����ҷ�������ڵо�����ɽ����������С�",
						x502011_g_JiTanName[nIndex],x502011_g_JiTanName[nIndex]))
			end
		end
	end
end
--*********************************
--��̳���ἴ������
--ȫ���������
--*********************************
function x502011_OnJiTanNearEnd(sceneId,nType,nIndex)
	--nType 1:ʣ2�� 2:ʣ1��
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
	
	--����NPC��ͼ��
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			if nResult == 0 then
				if nCampID == x502011_g_PlayerCamp_Song then
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("%s��̳����2���Ӻ�رգ��Ҿ���Է�ƽ����ɫ��������λ���Ŭ�������ܵо���Ϊ�Ҿ�ռ��˵أ�",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("����%s��̳�ر�ֻ��1���ӣ��Ҿ���Է�ƽ����ɫ��������λ���Ŭ�������ܵо���Ϊ�Ҿ�ռ��˵أ�",
						x502011_g_JiTanName[nIndex]))
					end
				else
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("%s��̳����2���Ӻ�رգ��Ҿ���Է�ƽ����ɫ��������λ���Ŭ�������ܵо���Ϊ�Ҿ�ռ��˵أ�",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("����%s��̳�ر�ֻ��1���ӣ��Ҿ���Է�ƽ����ɫ��������λ���Ŭ�������ܵо���Ϊ�Ҿ�ռ��˵أ�",
						x502011_g_JiTanName[nIndex]))
					end
				end
				return
			end
			if nResult == nCampID then
				if nCampID == x502011_g_PlayerCamp_Song then
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("%s��̳����2���Ӻ�رգ��Ҿ�Ŀǰ�������ȣ�������λ�ٽ��������������ƣ�Ϊ�Ҿ�ռ��˵أ�",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("����%s��̳�ر�ֻ��1���ӣ��Ҿ�Ŀǰ�����Ϸ磬��λ��ĪҪ���ɣ����Ʋ��ܸ��Է����ᣬ��Ҫ���´˵أ�",
						x502011_g_JiTanName[nIndex]))
					end
				else
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("%s��̳����2���Ӻ�رգ��Ҿ�Ŀǰ�������ȣ�������λ�ٽ��������������ƣ�Ϊ�Ҿ�ռ��˵أ�",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("����%s��̳�ر�ֻ��1���ӣ��Ҿ�Ŀǰ�����Ϸ磬��λ��ĪҪ���ɣ����Ʋ��ܸ��Է����ᣬ��Ҫ���´˵أ�",
						x502011_g_JiTanName[nIndex]))
					end
				end
			else
				if nCampID == x502011_g_PlayerCamp_Song then
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("%s��̳����2���Ӻ�رգ��Ҿ�Ŀǰ���������λ�����Ӽ�֣����Ҿ�ŤתǬ����",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,11,
						format("����%s��̳�ر�ֻ��1���ӣ��Ҿ�Ŀǰ���������λ��ĪҪ�������뾡�����о����������Ϊ�Ҿ�����Ϊʤ��",
						x502011_g_JiTanName[nIndex]))
					end
				else
					if nType == 1 then
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("%s��̳����2���Ӻ�رգ��Ҿ�Ŀǰ���������λ�����Ӽ�֣����Ҿ�ŤתǬ����",
						x502011_g_JiTanName[nIndex]))
					else
						x502011_SendNpcTalk(sceneId,nHumanId,12,
						format("����%s��̳�ر�ֻ��1���ӣ��Ҿ�Ŀǰ���������λ��ĪҪ�������뾡�����о����������Ϊ�Ҿ�����Ϊʤ��",
						x502011_g_JiTanName[nIndex]))
					end
				end
			end
			
		end
	end
end
--*********************************
--��̳����������������
--���������չ���
--*********************************
function x502011_OnJiTanEnd(sceneId,nIndex)
	if nIndex < 1 or nIndex > 4 then
		AddGlobalCountNews(sceneId,"[����������]��̳�����������ϵ�ͷ�������� nIndex:"..nIndex)
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
		x502011_TipAllHuman( sceneId, format("%s��̳�ѱ�%sռ��",x502011_g_JiTanName[nIndex],x502011_g_CampName[nResult]))
		MonsterTalk(sceneId, -1, "����������",format("#P��#G%s#P����#G%s֮��#P�Ӷ࣬��#G%s#P��̳�ѱ�#G%s#Pռ�졣",
			x502011_g_CampName[nResult],
			x502011_g_JiTanName[nIndex],
			x502011_g_JiTanName[nIndex],
			x502011_g_CampName[nResult]))
	else
		--ƽ����ɫ
		x502011_TipAllHuman( sceneId, "#{XSLDZ_180521_310}")
		MonsterTalk(sceneId, -1, "����������",format("#P����˫������#G%s֮��#P���ֲ��٣���#G%s#P��̳����ռ�졣",x502011_g_JiTanName[nIndex]))
	end
	
	--˫���ȷ����
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Song,0)
	LuaFnSetCopySceneData_Param(sceneId, x502011_g_SceneData_CampScoure_Liao,0)
	
	if nIndex >= 4 then
		return
	end
	--����NPC��ͼ��
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=1, nHumanCount do   
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			local nCampID = GetUnitCampID(sceneId,nHumanId,nHumanId)
			if nResult == 0 then
				if nCampID == x502011_g_PlayerCamp_Song then
					x502011_SendNpcTalk(sceneId,nHumanId,11,
					format("��ս����ƽ����ɫ�������ܽ�%s��̳�������С�Ȼ%s��̳����ڼ���������λ������ģ�����ǰ����̳֮���ڣ�����Э������һ�����¡�",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				else
					x502011_SendNpcTalk(sceneId,nHumanId,12,
					format("��ս����ƽ����ɫ�������ܽ�%s��̳�������С�Ȼ%s��̳����ڼ���������λ������ģ�����ǰ����̳֮���ڣ�����Э������һ�����¡�",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				end
				return
			end
			if nResult == nCampID then
				if nCampID == x502011_g_PlayerCamp_Song then
					x502011_SendNpcTalk(sceneId,nHumanId,11,
					format("�ݱ���������λ����Э�����ҷ��ѽ�%s��̳ռ�죡Ȼ%s��̳����ڼ���������λ����ǰ����Я��ս֮����������һ�����¡�",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				else
					x502011_SendNpcTalk(sceneId,nHumanId,12,
					format("�ݱ���������λ����Э�����ҷ��ѽ�%s��̳ռ�죡Ȼ%s��̳����ڼ���������λ����ǰ����Я��ս֮����������һ�����¡�",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				end
			else
				if nCampID == x502011_g_PlayerCamp_Song then
					x502011_SendNpcTalk(sceneId,nHumanId,11,
					format("���ź���%s��̳�ѱ��з�ռ�졣Ȼ%s��̳����ڼ���������λ������ģ�����ǰ����̳֮���ڣ�����Э������һ�����¡�",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				else
					x502011_SendNpcTalk(sceneId,nHumanId,12,
					format("���ź���%s��̳�ѱ��з�ռ�졣Ȼ%s��̳����ڼ���������λ������ģ�����ǰ����̳֮���ڣ�����Э������һ�����¡�",
					x502011_g_JiTanName[nIndex],
					x502011_g_JiTanName[nIndex + 1]))
				end
			end
			
		end
	end
	
end
--*********************************
--ˢ��ÿλ��ҵĸ��˻���
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
					x502011_MsgBox( sceneId, nHumanId, format("��Ϊ������ȡ%s��%s֮����",tostring(nSuccKill),x502011_g_JiTanName[nIndex]) )
					--���˻�������
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
--ɱ����������
--**********************************
function x502011_OnKillObject( sceneId, selfId, objdataId, objId )
	
end
--**********************************
--���������¼�
--**********************************
function x502011_OnHumanDie(sceneId, dieId, nHumanId)
	-- ������ɱ���Ǹ������Ҫ���ҵ�����
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
		--����Ī������
		return
	end
	if IsSameMAC(sceneId,dieId,killerId) > 0 then
		--��ͬ��MAC����С�ţ�����¼
		--return
	end
	if GetUnitCampID(sceneId, killerId, killerId)  == GetUnitCampID(sceneId, dieId, dieId) then
		--ͬһ����Ӫ�Ͳ�����
		return
	end
	--������öԷ�һ������ģ��Է����ı�Ϊ1
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
	--��ɱ����ͳ��
	local nCurKillNum = GetMissionCacheData(sceneId,killerId,x502011_g_PlayerSelf_KillNum);
	SetMissionCacheData(sceneId,killerId,x502011_g_PlayerSelf_KillNum,nCurKillNum + 1);
	--�߻�ɱͨ��
	local nKillerCamp = GetUnitCampID(sceneId,killerId,killerId)
	if nCurKillSuccKill >= 15 then
		MonsterTalk(sceneId, -1, "����������",format("#P#G%s#P���µ�#{_INFOUSR%s}������ս����ն��#G%s#P��ս�죬һʱ���ͷ�޶������˿ɵ���",
				x502011_g_CampName[nKillerCamp],GetName(sceneId,killerId),tostring(nCurKillSuccKill)))
	end
	--���͸�Die��ɱ����Ϣ
	--dieId
	BeginUICommand(sceneId)
		UICommand_AddInt( sceneId,LuaFnGetGUID(sceneId,killerId))
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,dieId, 2022070304)	
end

--*********************************
--������Ա���
--*********************************
function x502011_GoAwayAllPeople(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
    for i = 1,nHumanCount do   
        local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
		SetPvpAuthorizationFlagByID(sceneId,nHumanId, 2, 0)--�趨PVP״̬
		SetUnitCampID(sceneId,nHumanId,nHumanId, -1) --�����趨��Ӫ
        CallScriptFunction( (400900), "TransferFunc",sceneId, nHumanId,1,random(192,194),random(143,145))
    end
end

--���˻�ɱ��������
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
--�����ɱ��õ��ķ���
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
--�㲥�����ڵľ�����Ϣ
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
			--���¿ͻ�����Ϣ
			LuaFnUpdateClientSongLiaoWarData(sceneId,nHumanId,nTickCount,nScoreS,nScoreL,nJiTanState_1,nJiTanState_2,nJiTanState_3,nJiTanState_4)
		end
	end
	
	
end


--**********************************
--��ΧNPC
--**********************************
function x502011_MonsterTalk( sceneId )
	MonsterTalk(sceneId, 0, "����������","#{XSLDZ_180521_112}")
	MonsterTalk(sceneId, 2, "����������","#{XSLDZ_180521_112}")
end


--**********************************
--�򸱱�������ҹ㲥����
--**********************************
function x502011_TipAllHumanPaoPao( sceneId, targetId,nPaoPaoID )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		Msg2Player(  sceneId, nHumanId,"@*;npcpaopao;"..targetId..";"..nPaoPaoID,MSG2PLAYER_PARA )
	end
end

--**********************************
--�����ڹ㲥���黭��
--**********************************
function x502011_BroadCastNpcTalk( sceneId, nIndex,nStr )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- û���˵ĳ�����ʲô������
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
--���黭��
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
--��ʾ���и��������
--**********************************
function x502011_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- û���˵ĳ�����ʲô������
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
--��Ϣ��ʾ
--**********************************
function x502011_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x502011_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end



