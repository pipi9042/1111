local CU_MONEY			= 1	-- Ǯ
local CU_GOODBAD		= 2	-- �ƶ�ֵ
local CU_MORALPOINT	= 3	-- ʦ�µ�
local CU_TICKET			= 4 -- ��ƱǮ
local CU_YUANBAO		= 5	-- Ԫ��
local CU_ZENGDIAN		= 6 -- ����
local CU_MENPAI_POINT	= 7 -- ʦ�Ź��׶�
local CU_MONEYJZ		= 8 -- ����
local CU_BIND_YUANBAO	= 9 -- ��Ԫ��
local CU_GIFTTOKEN	= 10 -- ��ȯ

local g_pos1;
local g_pos2;
local g_PurpleColor = "#c9107e1";
local g_BlueColor   = "#c00ccff";
local g_YellowColor = "#cfeff95";
local g_GreenColor	= "#c5bc257";
local g_Stars;		

local g_nUnlockingTimeNeeded = 259200;
local Descinfo_x = {}

function g_GetUnlockingStr ( nUnlockElapsedTime )
	local nLeftTime = g_nUnlockingTimeNeeded - nUnlockElapsedTime;
	local strLeftTime = "";
		
	if( nLeftTime <= 0 ) then
		strLeftTime = "�����ɹ��������µ�¼���л�������ʽ������";
	else
		nLeftTime = math.ceil( nLeftTime/3600 );
		if( nLeftTime >= 24 ) then
			strLeftTime = ""..math.floor(nLeftTime/24).." ��";
			nLeftTime = math.mod(nLeftTime,24);
		end
		if( nLeftTime > 0 ) then 
			strLeftTime = strLeftTime.." "..nLeftTime.." Сʱ";					
		end
		
		strLeftTime = strLeftTime.."����ʽ����";
	end
	
	return strLeftTime;
end

function SuperTooltip_PreLoad()
	this:RegisterEvent("SHOW_SUPERTOOLTIP");
	this:RegisterEvent("UPDATE_SUPERTOOLTIP");
	-- this:RegisterEvent("REFRESH_EQUIP");
end

function SuperTooltip_OnLoad()
	SuperTooltip_StaticPart_Money:SetClippedByParent(0);
	SuperTooltip_StaticPart_Money_JiaoZi:SetClippedByParent(0);
	g_Stars={
				SuperTooltip_StaticPart_Star1,
				SuperTooltip_StaticPart_Star2,
				SuperTooltip_StaticPart_Star3,
				SuperTooltip_StaticPart_Star4,
				SuperTooltip_StaticPart_Star5,
				SuperTooltip_StaticPart_Star6,
				SuperTooltip_StaticPart_Star7,
				SuperTooltip_StaticPart_Star8,
				SuperTooltip_StaticPart_Star9,
		};
	for i=1,9 do
		g_Stars[i]:Hide();
	end;
	Descinfo_x[1] = "����"
	Descinfo_x[2] = "Ь"
	Descinfo_x[3] = "ñ��"
	Descinfo_x[4] = "����"
	Descinfo_x[5] = "�·�"
	Descinfo_x[6] = "����"

	Descinfo_x[21] = "����"
	Descinfo_x[22] = "������"
	Descinfo_x[23] = "˫����"
	Descinfo_x[24] = "������"
	Descinfo_x[25] = "ǹ����"
	Descinfo_x[26] = "����"
	Descinfo_x[27] = "����"
	Descinfo_x[28] = "��ָ"
	Descinfo_x[29] = "����"
	Descinfo_x[30] = "����"
	Descinfo_x[31] = "����"
	Descinfo_x[32] = "����"
	Descinfo_x[33] = "����"
	Descinfo_x[34] = "���"
	Descinfo_x[35] = "������"
	--AxTrace(0, 2, "LoadSuperTooltips");
end										
function SuperTooltip_GetDescLx(typeDesc)
	if not typeDesc or typeDesc == "" then
		return 0,""
	end
	local descpos = 0
	local lxval = ""
	local curdesc = string.sub(typeDesc,9)
	for i,j in Descinfo_x do
		if j == curdesc then
			descpos = i
			if descpos <= 20 then
				lxval = "FC"
			elseif descpos <= 50 then
				lxval = "CC"
			end
			break
		end
	end
	return descpos,lxval;
end
function SuperTooltip_OnEvent(event)

--	SuperTooltip_StaticPart_Money:Hide();
	if(event == "SHOW_SUPERTOOLTIP") then
		if( arg0 == "1" and SuperTooltips:IsPresent()) then
			
			SuperTooltips:SendAskItemInfoMsg();
			if(SuperTooltip_Update()==1) then
				g_pos1, g_pos2 = _SuperTooltip_:PositionSelf(arg2, arg3, arg4, arg5);	
				this:Show();
			end;
			return;
		else
			this:Hide();
			return;

		end
	end
	
	if(event == "UPDATE_SUPERTOOLTIP") then
		if(this:IsVisible() and SuperTooltips:IsPresent()) then
			SuperTooltip_Update();
			_SuperTooltip_:PositionSelf(0, 0, g_pos1, g_pos2);
			return;
		end;
	end
	-- if(event == "REFRESH_EQUIP") then

		-- Equip_RefreshEquip();
		-- return;
	-- end
	
end

function SuperTooltip_Update()
		-- �������ǰ��ʾ������
		SuperTooltip_ClearText();
		
		local typeDesc = SuperTooltips:GetTypeDesc();
		local descpos,Desctype = SuperTooltip_GetDescLx(typeDesc);
		local nGemHoleCounts = SuperTooltips:GetGemHoleCounts();
		local nMoney1, szMoneyDesc1 = SuperTooltips:GetMoney1();
		local nMoney2, szMoneyDesc2 = SuperTooltips:GetMoney2();
		local szPropertys = SuperTooltips:GetPropertys();
		local szAuthor = SuperTooltips:GetAuthorInfo();
		local szExplain = SuperTooltips:GetExplain();
		
		local unLockingElapsedTime	=SuperTooltips:GetPUnlockElapsedTime();
		local IsProtectd	=SuperTooltips:GetDesc5();
		local nYuanbaotrade = SuperTooltips:GetYuanbaoTradeFlag();
		local nGoodsProtect = SuperTooltips:GetGoodsProtect_Goods();

		----------------------------------------------------------------------
		--��ʾ��̬ͷ
		local toDisplay = "";
		
		if(SuperTooltips:GetTitle()~="" and SuperTooltips:GetIconName()~="")then
			toDisplay = toDisplay .."SuperTooltip_PageHeader";
		end
		
		--ʣ�����ʱ��
		if( IsProtectd == "1" and unLockingElapsedTime ~= 0) then
			toDisplay = toDisplay .. ";SuperTooltip_UnlockingTimePart";
		end
		
		
		--������������
		if( typeDesc ~= nil) then 
			toDisplay = toDisplay .. ";SuperTooltip_ShortDesc";
		end
		
		--Ԫ������
		if (nYuanbaotrade == 0) then
			toDisplay = toDisplay .. ";SuperTooltip_StaticPart_Yuanbaojiaoyi";
			SuperTooltip_StaticPart_Yuanbaojiaoyi:SetText("#{YBSC_100111_87}");
		elseif (nYuanbaotrade == 2) then
			toDisplay = toDisplay .. ";SuperTooltip_StaticPart_Yuanbaojiaoyi";
			SuperTooltip_StaticPart_Yuanbaojiaoyi:SetText("#{YBSC_100111_88}");
		end
		
		--��ʯ����
		if( type(nGemHoleCounts) == "number" and nGemHoleCounts>0 ) then 
			toDisplay = toDisplay .. ";SuperTooltip_GemPart";
		end
		--��Ǯ1
		if( nMoney1 ~= nil) then 
			toDisplay = toDisplay .. ";SuperTooltip_MoneyPart";
		end

		--��Ǯ2
		if(nMoney2 ~= nil) then 
			toDisplay = toDisplay .. ";SuperTooltip_MoneyPart_2";
		end
		
		--�߼�����
		if nGoodsProtect == 1 then
			toDisplay = toDisplay .. ";SuperTooltip_Protect_Text";
		end

		--����
		if(szPropertys ~= nil) then 
			toDisplay = toDisplay .. ";SuperTooltip_Property";
		end

		--����
		if(szAuthor ~= nil) then 
			toDisplay = toDisplay .. ";SuperTooltip_Manufacturer_Frame";
		end

		--��ϸ����
		toDisplay = toDisplay .. ";SuperTooltip_Explain";

		--��ʾ�������
		if(toDisplay=="") then
			this:Hide();
			return 0;
		end;
		AxTrace( 8,0,toDisplay );
		_SuperTooltip_:SetProperty("PageElements",  toDisplay);
		
		----------------------------------------------------------------------
		--��ʾ�µ�����
		SuperTooltip_StaticPart_Title:SetText(SuperTooltips:GetTitle());
		SuperTooltip_StaticPart_Item1:SetText(SuperTooltips:GetDesc1());
		SuperTooltip_StaticPart_Item2:SetText(SuperTooltips:GetDesc2());
		SuperTooltip_StaticPart_Item3:SetText(SuperTooltips:GetDesc3());
		--SuperTooltip_StaticPart_Item4:SetText(SuperTooltips:GetDesc4());
		--SuperTooltip_StaticPart_Item5:SetText(SuperTooltips:GetDesc5());
		local qhinfo = SuperTooltips:GetDesc4()

		SuperTooltip_StaticPart_Item4:SetText(qhinfo);
		if qhinfo and qhinfo ~= "" then
			local qhpos = string.find(qhinfo,"+");

			if qhpos then
				qhpos = qhpos + 1
				local qhlv = tonumber(string.sub(qhinfo,qhpos));
				if qhlv and qhlv > 0 and qhlv < 100 and Desctype ~= "" then
					local qhcc = string.format("#{Equip_Cnhance_%s%d}",Desctype,qhlv)
					SuperTooltip_StaticPart_Item6:SetText(qhcc)
				end
			end
		end
		SuperTooltip_StaticPart_Icon:SetImage(SuperTooltips:GetIconName());
		SuperTooltip_ShortDesc_Text:SetText(typeDesc);

		-- ��ʾ����
		local dwIcon = SuperTooltips:GetDiaowenIcon()
		if (dwIcon ~= nil and dwIcon ~= "") then
			SuperTooltip_StaticPart_DW:Show()
			SuperTooltip_StaticPart_DW:SetProperty("Image", dwIcon)
		end
		
		if( T300Func:IsNoDifOpen(0) == 1) then--��ʯ
			SuperTooltip_StaticPart_Gem1BK:Show()
			SuperTooltip_StaticPart_Gem2BK:Show()
			SuperTooltip_StaticPart_Gem3BK:Show()
			SuperTooltip_StaticPart_Gem4BK:Show()
		else
			SuperTooltip_StaticPart_Gem1BK:Hide()
			SuperTooltip_StaticPart_Gem2BK:Hide()
			SuperTooltip_StaticPart_Gem3BK:Hide()
			SuperTooltip_StaticPart_Gem4BK:Hide()
		end

		if( T300Func:IsNoDifOpen(1) == 1) then--����
			SuperTooltip_StaticPart_DWBK:Show()
		else
			SuperTooltip_StaticPart_DWBK:Hide()
		end
		

		if (IsProtectd == "1" and unLockingElapsedTime ~= 0) then		
			local strLeftTime = g_GetUnlockingStr(unLockingElapsedTime);		
			SuperTooltip_UnlockingTimePart:SetText("#b#cFFFF00"..strLeftTime);
			SuperTooltip_StaticPart_Icon_Protected : SetProperty("Image","set:CommonFrame6 image:NewLock");
		else
			SuperTooltip_UnlockingTimePart:SetText("");
			SuperTooltip_StaticPart_Icon_Protected : SetProperty("Image","set:UIIcons image:Icon_Lock");
		end
		
		if nGoodsProtect == 1 then
			SuperTooltip_Protect_Text:SetText("#{GDWPBH_090507_4}")
		else
			SuperTooltip_Protect_Text:SetText("")
		end

		--tongxi modify ��ʾ����
		--AxTrace( 5,0,StrongLevel );
		local qual =SuperTooltips:GetEquipQual();
		if(type(qual) == "number" and tonumber(qual)>0)then
			local starNum	=	tonumber(qual);
			if(starNum<10) then
				for i=1,starNum do
					--AxTrace( 5,0,StrongLevel.."hehe" );
					if starNum <=4 then
						g_Stars[i]:SetProperty("Animate", "Animate_StarNoFlash");
					else
						g_Stars[i]:SetProperty("Animate", "Animate_Star");
					end
					g_Stars[i]:Show();
				end;
				for i=starNum+1, 9 do
					g_Stars[i]:SetProperty("Animate", "Animate_StarDark");
					g_Stars[i]:Show();
				end
			end;
		end;
		if(IsProtectd=="1") then
			SuperTooltip_StaticPart_Icon_Protected:Show();
		end;
		--modify end
		if( type(nGemHoleCounts) == "number" and nGemHoleCounts>0) then
			AxTrace(5,1,"nGemHoleCounts="..nGemHoleCounts)
			if(nGemHoleCounts > 0) then 
				SuperTooltip_StaticPart_Gem1:Show();
			end
			
			if(nGemHoleCounts > 1) then 
				SuperTooltip_StaticPart_Gem2:Show();
			end
			
			if(nGemHoleCounts > 2) then 
				SuperTooltip_StaticPart_Gem3:Show();
			end
			
			if(nGemHoleCounts > 3) then 
				SuperTooltip_StaticPart_Gem4:Show();
			end
			
			
			local gemIcon = SuperTooltips:GetGemIcon1();
			AxTrace(5,5,"gemIcon="..gemIcon)
			if(gemIcon ~= "") then
				SuperTooltip_StaticPart_Gem1:SetProperty("ShortImage", gemIcon);
			end
			
			gemIcon = SuperTooltips:GetGemIcon2();
			AxTrace(5,5,"gemIcon="..gemIcon)
			if(gemIcon ~= "") then
				SuperTooltip_StaticPart_Gem2:SetProperty("ShortImage", gemIcon);
			end
			
			gemIcon = SuperTooltips:GetGemIcon3();
			AxTrace(5,5,"gemIcon="..gemIcon)
			if(gemIcon ~= "") then
				SuperTooltip_StaticPart_Gem3:SetProperty("ShortImage", gemIcon);
			end
			
			gemIcon = SuperTooltips:GetGemIcon4();
			
			AxTrace(5,5,"gemIcon="..gemIcon)
			if(gemIcon ~= "") then
				SuperTooltip_StaticPart_Gem4:SetProperty("ShortImage", gemIcon);
			end
			
		end
		if(nMoney1 ~= nil)  then
			SuperTooltip_StaticPart_Money_Text:SetText(szMoneyDesc1);
			SetupMoneyPart(1,nMoney1);
			
		end		
		if(nMoney2 ~= nil)  then
			SuperTooltip_StaticPart_Money_Text_2:SetText(szMoneyDesc2);
			SetupMoneyPart(2,nMoney2);
		end
		
		if( szPropertys ~= nil) then
			SuperTooltip_Property:SetText(szPropertys);
		end
		
		if(szAuthor ~= nil) then
			SuperTooltip_Manufacturer:SetText(szAuthor);
		end
		
		SuperTooltip_Explain:SetText(szExplain);
		
		AxTrace( 8,0,"Show tooltip  "..szExplain);

		return 1;
		
end

-------------------------------------------------------------------------------------------------------------------------------
--
-- �����ʾ�ı�
--
function SuperTooltip_ClearText()
		SuperTooltip_StaticPart_Title:SetText("");
		SuperTooltip_StaticPart_Item1:SetText("");
		SuperTooltip_StaticPart_Item2:SetText("");
		SuperTooltip_StaticPart_Item3:SetText("");
		SuperTooltip_StaticPart_Item4:SetText("");
		SuperTooltip_StaticPart_Item6:SetText("");

		SuperTooltip_Protect_Text:SetText("");
		SuperTooltip_StaticPart_DW:SetImage("")
		SuperTooltip_StaticPart_DW:Hide()
		local starNum=9
		for i=1,starNum do
			g_Stars[i]:Hide();
		end;
		SuperTooltip_StaticPart_Gem1:SetImage("");
		SuperTooltip_StaticPart_Gem2:SetImage("");
		SuperTooltip_StaticPart_Gem3:SetImage("");
		SuperTooltip_StaticPart_Gem4:SetImage("");
		SuperTooltip_StaticPart_Gem1:Hide();
		SuperTooltip_StaticPart_Gem2:Hide()
		SuperTooltip_StaticPart_Gem3:Hide()
		SuperTooltip_StaticPart_Gem4:Hide()
		SuperTooltip_Explain:SetText("");
		SuperTooltip_Property:SetText("");
		SuperTooltip_Manufacturer:SetText("");
		SuperTooltip_StaticPart_Icon_Protected:Hide();
end

function SetupMoneyPart(type,nPrice)
	local StaticPart_GB_Ctl;
	local StaticPart_Money_Ctl;
		--ʹ��ʲô��Ϊ����
	local nUnit =  SuperTooltips:GetMoney1Type();
	if(type==1)then
		StaticPart_GB_Ctl = SuperTooltip_StaticPart_GB;
		local isShowJiaoZi = SuperTooltips:GetIsShowJiaoZi();
		if ( CU_MONEYJZ == nUnit ) then
			isShowJiaoZi = 1;
		end
		if (isShowJiaoZi == 1) then
			SuperTooltip_StaticPart_Money:Hide();
			StaticPart_Money_Ctl = SuperTooltip_StaticPart_Money_JiaoZi;
		else
			SuperTooltip_StaticPart_Money_JiaoZi:Hide()
			StaticPart_Money_Ctl = SuperTooltip_StaticPart_Money;
		end
	else
		StaticPart_GB_Ctl = SuperTooltip_StaticPart_GB_2;
		StaticPart_Money_Ctl = SuperTooltip_StaticPart_Money_2;
	end

	if(nUnit==nil)then
		nUnit = CU_MONEY;
	end;
	if(CU_MONEY	== nUnit or CU_TICKET == nUnit or CU_MONEYJZ == nUnit)       then      --Ǯ����ƱǮ, ����
			StaticPart_GB_Ctl:Hide()
			StaticPart_Money_Ctl:Show();
			StaticPart_Money_Ctl:SetProperty("MoneyNumber", tostring(nPrice));

	elseif(CU_GOODBAD == nUnit) then			--�ƶ�ֵ
			
			StaticPart_GB_Ctl:Show()
			StaticPart_Money_Ctl:Hide();
			StaticPart_GB_Ctl:SetText("�ƶ�ֵ:" .. tostring(nPrice) .. " ��")


	elseif(CU_MORALPOINT == nUnit)  then	--ʦ�µ�

			StaticPart_GB_Ctl:Show()
			SuperTooltip_StaticPart_Money:Hide();
			StaticPart_GB_Ctl:SetText("ʦ�µ�:" .. tostring(nPrice) .. " ��")

	elseif(CU_BIND_YUANBAO == nUnit) then	--��Ԫ��

			StaticPart_GB_Ctl:Show()
			StaticPart_Money_Ctl:Hide();
			StaticPart_GB_Ctl:SetText("#{BDYB_090714_01}" .. tostring(nPrice))
			
	elseif(CU_GIFTTOKEN == nUnit) then	--��ȯ

			StaticPart_GB_Ctl:Show()
			StaticPart_Money_Ctl:Hide();
			StaticPart_GB_Ctl:SetText("#{YBFQ_XML_1}" .. tostring(nPrice))

	elseif(CU_YUANBAO == nUnit) then	--Ԫ��

			StaticPart_GB_Ctl:Show()
			StaticPart_Money_Ctl:Hide();
			StaticPart_GB_Ctl:SetText("Ԫ����" .. tostring(nPrice))

	elseif(CU_ZENGDIAN == nUnit) then	--����

			StaticPart_GB_Ctl:Show()
			StaticPart_Money_Ctl:Hide();
			StaticPart_GB_Ctl:SetText("����:" .. tostring(nPrice))

	elseif(CU_MENPAI_POINT == nUnit) then	--ʦ�Ź��׶�

			StaticPart_GB_Ctl:Show()
			StaticPart_Money_Ctl:Hide();
			StaticPart_GB_Ctl:SetText("���ɹ��׶�:" .. tostring(nPrice))

	end	
	
end;
