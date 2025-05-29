LUA_LINGYU_CACHE = {}
function LuaFnReInitLingYuData(sceneId, selfId)
    local nPlayerTag = LuaFnGetGUID(sceneId, selfId)
    LUA_LINGYU_CACHE[nPlayerTag] = { equip = {}, attr = {} }
    LuaFnGetLingYuData(sceneId, selfId, 1)
end
function LuaFnGetOtherLingYuData(sceneId, nPlayerTag, index)
    if LUA_LINGYU_CACHE[nPlayerTag] and LUA_LINGYU_CACHE[nPlayerTag].equip then
        if LUA_LINGYU_CACHE[nPlayerTag].equip[index] and LUA_LINGYU_CACHE[nPlayerTag].equip[index].id ~= nil and LUA_LINGYU_CACHE[nPlayerTag].equip[index].attr ~= nil then
            return LUA_LINGYU_CACHE[nPlayerTag].equip[index].id, LUA_LINGYU_CACHE[nPlayerTag].equip[index].attr
        end
    end
    return 0, ""
end
function LuaFnGetLingYuData(sceneId, selfId, index)
    local nPlayerTag = LuaFnGetGUID(sceneId, selfId)
    if LUA_LINGYU_CACHE[nPlayerTag] and LUA_LINGYU_CACHE[nPlayerTag].equip then
        if LUA_LINGYU_CACHE[nPlayerTag].equip[index] and LUA_LINGYU_CACHE[nPlayerTag].equip[index].id ~= nil and LUA_LINGYU_CACHE[nPlayerTag].equip[index].attr ~= nil then
            return LUA_LINGYU_CACHE[nPlayerTag].equip[index].id, LUA_LINGYU_CACHE[nPlayerTag].equip[index].attr
        end
    else
        LUA_LINGYU_CACHE[nPlayerTag] = { equip = {}, attr = {} }
    end
    local data = LuaFnReadLingYuData(sceneId, selfId)
    LUA_LINGYU_CACHE[nPlayerTag].equip = data
    return data[index].id, data[index].attr
end
function LuaFnReadLingYuData(sceneId, selfId)
	local dif = 50
	local eqidEx = 999
	local eqstrEx = "999999999999999999"	
    local data = {
        { id = 0, attr = "&LY" },
        { id = 0, attr = "&LY" },
        { id = 0, attr = "&LY" },
        { id = 0, attr = "&LY" },
        { id = 0, attr = "&LY" },
        { id = 0, attr = "&LY" },
    }
    local dataEx = {
        { id = 999, attr = "999999999999999999" },
        { id = 999, attr = "999999999999999999" },
        { id = 999, attr = "999999999999999999" },
        { id = 999, attr = "999999999999999999" },
        { id = 999, attr = "999999999999999999" },
        { id = 999, attr = "999999999999999999" },
    }		
	local eqid2 = LuaXhz_GetMParam(sceneId, selfId, 1, 0, 0) + dif
	local eqid3 = LuaXhz_GetMParam(sceneId, selfId, 1, 1, 0) + dif
	local eqid5 = LuaXhz_GetMParam(sceneId, selfId, 1, 2, 0) + dif
	local eqid6 = LuaXhz_GetMParam(sceneId, selfId, 1, 3, 0) + dif	

	if eqid2 then
		dataEx[2].id = eqid2
	end
	if eqid3 then
		dataEx[3].id = eqid3
	end	
	if eqid5 then
		dataEx[5].id = eqid5
	end	
	if eqid6 then
		dataEx[6].id = eqid6
	end	
	local str1 = LuaXhz_GetMStr(sceneId, selfId, 1) 
	local str2 = LuaXhz_GetMStr(sceneId, selfId, 2) 
	local strw = "(%w%w%w)(%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w)(%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w)(%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w)"
	local nStartPos1, nEndPos1, eqid1, eqstr1, eqstr2, eqstr3 = strfind(str1, strw)
	local nStartPos2, nEndPos2, eqid4, eqstr4, eqstr5, eqstr6 = strfind(str2, strw)	
	if eqid1 then
		dataEx[1].id = eqid1
	end	
	if eqid4 then
		dataEx[4].id = eqid4
	end		
	if eqstr1 then
		dataEx[1].attr = eqstr1
	end		
	if eqstr2 then
		dataEx[2].attr = eqstr2
	end		
	if eqstr3 then
		dataEx[3].attr = eqstr3
	end	
	if eqstr4 then
		dataEx[4].attr = eqstr4
	end	
	if eqstr5 then
		dataEx[5].attr = eqstr5
	end	
	if eqstr6 then
		dataEx[6].attr = eqstr6
	end	
	
    for i = 1, 6 do
		local eqid = dataEx[i].id
		local eqstr = dataEx[i].attr
		if tostring(eqidEx) ~= tostring(eqid) and tostring(eqstrEx) ~= tostring(eqstr) then
			eqid = 10157000 + tonumber(eqid) 
			eqstr = "&LY"..eqstr
			data[i].id = tonumber(eqid)
			data[i].attr = tostring(eqstr)			
		end
    end	
    return data
end
function LuaFnSaveLingYuData(sceneId, selfId, lingyuData)
	local str1 = ""
	local str2 = ""
	local dif = 50
    for i = 1, 6 do
		local eqid = 999 
		local eqstr = "999999999999999999"
		if lingyuData[i].id and strlen(lingyuData[i].id) == 8 then
			eqid = strsub(lingyuData[i].id, -3)
		end
		local nLingYuAttrStr = gsub(lingyuData[i].attr, "&SX%w%w%w%w%w%w", "")
		if lingyuData[i].attr and strlen(nLingYuAttrStr) == 21 then
			eqstr = strsub(nLingYuAttrStr, 4)
		end			
		if i == 1 then
			str1 = str1..eqid..eqstr
		end
		if i == 2 then
			str1 = str1..eqstr
			LuaXhz_SetMParam(sceneId, selfId, 1, 0, 0, tonumber(eqid)-dif ) 
		end		
		if i == 3 then
			str1 = str1..eqstr
			LuaXhz_SetMParam(sceneId, selfId, 1, 1, 0, tonumber(eqid)-dif ) 
		end
		if i == 4 then
			str2 = str2..eqid..eqstr
		end
		if i == 5 then
			str2 = str2..eqstr
			LuaXhz_SetMParam(sceneId, selfId, 1, 2, 0, tonumber(eqid)-dif ) 
		end		
		if i == 6 then
			str2 = str2..eqstr
			LuaXhz_SetMParam(sceneId, selfId, 1, 3, 0, tonumber(eqid)-dif ) 
		end	
    end
	LuaXhz_SetMStr(sceneId, selfId, 1, str1) 
	LuaXhz_SetMStr(sceneId, selfId, 2, str2) 
	local nPlayerTag = LuaFnGetGUID(sceneId, selfId)
	if not LUA_LINGYU_CACHE[nPlayerTag] or not LUA_LINGYU_CACHE[nPlayerTag].equip then
		LUA_LINGYU_CACHE[nPlayerTag] = { equip = lingyuData, attr = {} }
	end
	LUA_LINGYU_CACHE[nPlayerTag].equip = lingyuData
end
function LuaFnSetLingYuData(sceneId, selfId, index, new_id, new_attr)
    local nPlayerTag = LuaFnGetGUID(sceneId, selfId)
    local data = LuaFnReadLingYuData(sceneId, selfId)
    data[index].id = new_id
    data[index].attr = new_attr
    LuaFnSaveLingYuData(sceneId, selfId, data)
end
function XHZ_Client_9999_StrInTxt(nName,Data)
	local nTime = date("%Y-%m-%d %H:%M:%S", LuaFnGetCurrentTime())
	local Myfile = openfile("./ServerBD/" .. "Debug.txt", "a")
	write(Myfile, nTime .. " => "..tostring(nName).." ="..tostring(Data).."\n")
	closefile(Myfile)		
end					
--xhz==============================================================================================================================================================
MIdList = {}
MIdList[1 ] = 49999990
MIdList[2 ] = 49999991
MIdList[3 ] = 49999992
MIdList[4 ] = 49999993
MIdList[5 ] = 49999994
MIdList[6 ] = 49999995
MIdList[7 ] = 49999996
MIdList[8 ] = 49999997
MIdList[9 ] = 49999998
MIdList[10] = 49999999
function LuaXhz_GetMPos(sceneId, selfId, MId) 
	for i=200,219 do
		local tempid = LuaFnGetItemTableIndexByIndex(sceneId,selfId,i)
		if tempid == MIdList[MId] then
			return i
		end
	end
end
function LuaXhz_GetMStr(sceneId, selfId, MId) 
	local curPos = 200
	for i=200,219 do
		local tempid = LuaFnGetItemTableIndexByIndex(sceneId,selfId,i)
		if tempid == MIdList[MId] then
			curPos = i
			break
		end
	end
	local _,str = LuaFnGetItemCreator(sceneId,selfId,curPos)
	if str == nil then
		str = ""
	end
	return str
end
function LuaXhz_SetMStr(sceneId, selfId, MId, str) 
	local curPos = 200
	for i=200,219 do
		local tempid = LuaFnGetItemTableIndexByIndex(sceneId,selfId,i)
		if tempid == MIdList[MId] then
			curPos = i
			break
		end
	end
	LuaFnSetItemCreator(sceneId, selfId, curPos, str)
end
function LuaXhz_GetMParam(sceneId, selfId, MId, PmId, P) 
	local Px
	local curPos = 200
	for i=200,219 do
		local tempid = LuaFnGetItemTableIndexByIndex(sceneId,selfId,i)
		if tempid == MIdList[MId] then
			curPos = i
			break
		end
	end
	if PmId >= 0 and PmId <= 8 and P == 2 then
		Px = GetBagItemParam( sceneId, selfId, curPos, PmId, 2 )
	end
	if PmId >= 0 and PmId <= 10 and P == 1 then
		Px = GetBagItemParam( sceneId, selfId, curPos, PmId, 1 )
	end
	if PmId >= 0 and PmId <= 11 and P == 0 then
		Px = GetBagItemParam( sceneId, selfId, curPos, PmId, 0 )
	end	
	return Px
end
function LuaXhz_SetMParam(sceneId, selfId, MId, PmId, P, Px) 
	local curPos = 200
	for i=200,219 do
		local tempid = LuaFnGetItemTableIndexByIndex(sceneId,selfId,i)
		if tempid == MIdList[MId] then
			curPos = i
			break
		end
	end
	if PmId >= 0 and PmId <= 8 and P == 2 then
		SetBagItemParam( sceneId, selfId, curPos, PmId, 2, Px )--Px:2147483647   PmId:0-8
	end
	if PmId >= 0 and PmId <= 10 and P == 1 then
		SetBagItemParam( sceneId, selfId, curPos, PmId, 1, Px )--Px:32767		 PmId:0-8,9-10
	end
	if PmId >= 0 and PmId <= 11 and P == 0 then
		SetBagItemParam( sceneId, selfId, curPos, PmId, 0, Px )--Px:127			 PmId:0-8,9-10,11
	end		
end
LUA_CACHE_DATA = {}
function LuaFnSetGlobalPlayerCacheData(sceneId, selfId, nAppName, nKey, nValue) 
    local nPlayerTag = LuaFnGetGUID(sceneId, selfId)
    if LUA_CACHE_DATA[nPlayerTag] == nil then
        LUA_CACHE_DATA[nPlayerTag] = {}
    end
    if LUA_CACHE_DATA[nPlayerTag][nAppName] == nil then
        LUA_CACHE_DATA[nPlayerTag][nAppName] = {}
    end
    LUA_CACHE_DATA[nPlayerTag][nAppName][nKey] = nValue
end
function LuaFnGetGlobalPlayerCacheData(sceneId, selfId, nAppName, nKey, nDefault)
    local nPlayerTag = LuaFnGetGUID(sceneId, selfId)
    if nDefault == nil then
        nDefault = -1
    end
    if LUA_CACHE_DATA[nPlayerTag] == nil then
        LUA_CACHE_DATA[nPlayerTag] = {}
    end
    if LUA_CACHE_DATA[nPlayerTag][nAppName] == nil then
        LUA_CACHE_DATA[nPlayerTag][nAppName] = {}
        return nDefault
    end
    local ret = LUA_CACHE_DATA[nPlayerTag][nAppName][nKey]
    if ret == nil then
        return nDefault
    end
    return ret
end
function LuaFnIntegerDivide(dividend, divisor)
    return floor(dividend / divisor)
end
function LuaFnModulo(dividend, divisor)
    return dividend - LuaFnIntegerDivide(dividend, divisor) * divisor
end
function LuaFnBase32Encode(num)
    local base = 32
    local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUV"
    local result = ""

    while num > 0 do
        local remainder = LuaFnModulo(num, base)
        result = strsub(digits, remainder + 1, remainder + 1) .. result
        num = LuaFnIntegerDivide(num, base)
    end

    return result
end
function LuaFnBase32Decode(str)
    local base = 32
    local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUV"
    local result = 0
    local factor = 1
    local num = strlen(str)
    for i = num, 1, -1 do
        local digit = strsub(str, i, i)
        local value = strfind(digits, digit) - 1
        result = result + value * factor
        factor = factor * base
    end
    return result
end