--掉落通知系统重写，by皮皮904214790，2025.06.24

x929561_g_scriptId = 929561

-- 物品ID映射表 (地图ID -> {物品ID -> 广播类型ID列表})
x929561_filename = "/home/tlbb/Public/Config/PiPi_DropNotify.txt"
x929561_g_itemMap = {
    [229] = {
        [10510017] = {0}, [10510047] = {0}, [10510077] = {0}, [10511007] = {0}, 
        [10511037] = {0}, [10511067] = {0}, [10512017] = {0}, [10512047] = {0}, 
        [10512077] = {0}, [10514007] = {0}, [10514017] = {0}, [10514037] = {0}, 
        [10514047] = {0}, [10514067] = {0}, [10514077] = {0}, [10515027] = {0}, 
        [10515057] = {0}, [10515087] = {0}, [10520027] = {0}, [30103065] = {0},
		[30103066] = {0}, [30402087] = {0},
        [10404005] = {3}, [10404006] = {3}, [10404007] = {3}, [10404008] = {3}
    },
    [5] = {
        [30505802] = {4, 30}, [20600002] = {4}, [20600003] = {4}, [20600004] = {4}
    },
    [231] = {
        [30402087] = {8}, [30402088] = {8}, [30402089] = {8}, [30402090] = {8}, 
        [30402026] = {8}, [30402046] = {8}, [30402092] = {8},
        [30503017] = {7}, [30503018] = {7}, [30503019] = {8}, [30503020] = {8}
    },
    [112] = {
        [30402005] = {9}, [30402006] = {9}, [30402007] = {9}, [30402008] = {9}, 
        [30402009] = {9}, [30402010] = {9}, [30402011] = {9}, [30402013] = {9}, 
        [30402015] = {9}, [30402017] = {9}, [30402019] = {9}, [30402071] = {9},
        [30505804] = {14}, [38000354] = {14}, [30900015] = {14}, [30900006] = {14},
        [30308059] = {15}, [30402025] = {15}, [30402029] = {15}, [30402030] = {15}, 
        [30402095] = {15}, [20310115] = {74}, [30505802] = {14}, [30103066] = {14}
    },
    [32] = {
        [30900006] = {11}, [38000354] = {11}, [30900015] = {11},
        [30308067] = {69}, [30308071] = {69}
    },
    [20] = {
        [38000354] = {12}, [30900015] = {12}, [30900006] = {12}, [30505804] = {12},
        [30308060] = {68}, [30308070] = {68}
    },
    [25] = {
        [38000354] = {13}, [30900015] = {13}, [30900006] = {13},
        [30308069] = {70}
    },
    [236] = {
        [20310113] = {18}, [30308055] = {18}, [30309034] = {35}
    },
    [80] = {
        [30505800] = {19}, [30505801] = {19}, [30505802] = {19}, [30505803] = {19}, 
        [30505804] = {19}, [30505805] = {19}, [30505806] = {19}, [20310167] = {83}
    },
    [193] = {[30505800] = {20}},
    [183] = {[30505800] = {21}},
    [188] = {[30505800] = {22}},
    [184] = {[30505800] = {23}},
    [182] = {[30505801] = {24}},
    [189] = {[30505802] = {25}},
    [190] = {[30505803] = {26}},
    [185] = {[30505804] = {27}},
    [187] = {[30505805] = {28}},
    [186] = {[30505806] = {29}},
    [170] = {
        [30900015] = {32}, [30008053] = {59}, [20310115] = {77}
    },
    [201] = {
        [30402087] = {33}, [30402088] = {33}, [30402089] = {33}, [30402090] = {33}, 
        [30402026] = {33}, [30402046] = {33}, [30402092] = {33}, [30309033] = {34},
        [30308059] = {65}, [30402025] = {65}, [30402029] = {65}, [30402030] = {65}, 
        [30402095] = {65}
    },
    [243] = {
        [30501151] = {36}, [30501152] = {37}, [30501153] = {38}
    },
    [22] = {
        [10404009] = {39}, [10404010] = {39}, [10404011] = {39}, [10404012] = {39}
    },
    [261] = {
        [30900015] = {42}, [38000354] = {42}, [30900028] = {42}, [20502000] = {42}, 
        [20501000] = {42}, [20500000] = {42}, [20310110] = {44}, [30505706] = {43},
        [10141153] = {81}, [10141157] = {81}, [10141161] = {81}, [10141165] = {81}, 
        [10141169] = {81}, [10141173] = {81}, [10141177] = {81}, [10141181] = {81}, 
        [10141185] = {81}, [10141195] = {81}
    },
    [262] = {
        [10400074] = {47}, [10402074] = {47}, [10404071] = {47}, [10405070] = {47}
    },
    [263] = {
        [10400074] = {48}, [10402074] = {48}, [10404071] = {48}, [10405070] = {48}
    },
    [264] = {
        [10400075] = {49}, [10402075] = {49}, [10404072] = {49}, [10405071] = {49}
    },
    [265] = {
        [20600005] = {50}, [20600006] = {50}, [20600007] = {50}, [20600008] = {50}
    },
    [266] = {
        [20600005] = {51}, [20600006] = {51}, [20600007] = {51}, [20600008] = {51}
    },
    [267] = {
        [30505806] = {52}, [20310167] = {84}
    },
    [204] = {
        [10401002] = {61}, [10403002] = {61}, [10405001] = {61}, [10404002] = {61}
    },
    [207] = {
        [10401003] = {62}, [10403003] = {62}, [10405002] = {62}, [10404003] = {62}
    },
    [210] = {
        [10401004] = {63}, [10403004] = {63}, [10405003] = {63}, [10404004] = {63}
    },
    [269] = {
        [30700240] = {64}, [30501361] = {64}
    },
    [272] = {
        [30308075] = {72}, [30308076] = {72}, [30308087] = {72}, [30308088] = {72}, 
        [30308089] = {72}, [30308090] = {72}, [30308091] = {72}, [30308092] = {72}, 
        [30308093] = {72}, [30120066] = {82}, [30120067] = {82}, [30120068] = {82}, 
        [30120069] = {82}, [30120035] = {82}, [30120036] = {82}, [30120037] = {82}, 
        [30120038] = {82}, [30120014] = {82}, [30120015] = {82}, [30120016] = {82}, 
        [30120017] = {82}, [30120023] = {82}, [30120008] = {82}, [30120010] = {82}, 
        [30120028] = {82}, [30120041] = {82}, [30120042] = {82}, [30120050] = {82}
    },
    [281] = {
        [10156002] = {73, 80}, [10156004] = {73, 80}, [10156001] = {73, 80}, 
        [10156003] = {73, 80}, [30900057] = {80}
    },
    [79] = {
        [10156002] = {78}, [10156004] = {78}, [10156001] = {78}, [10156003] = {78}
    },
    [81] = {
        [10156002] = {78}, [10156004] = {78}, [10156001] = {78}, [10156003] = {78}
    },
    [546] = {
        [30501361] = {85}, [20800001] = {85}, [20800003] = {85}, [20800005] = {85}, 
        [20800007] = {85}, [20800009] = {85}, [20800011] = {85}, [20301007] = {85}, 
        [20301009] = {85}
    },
    [579] = {[38002515] = {90}},
    [292] = {}
}


-- 掉落通知映射表
x929561_g_dropNotifyMap = {}

function x929561_LoadDropNotifyData()
     x929561_g_dropNotifyMap = {}
    
    local PP_file = openfile(x929561_filename, "r")
    if not PP_file then
        return nil
    end
    
    local PP_firstLine = read(PP_file)
    
    local PP_line
    while 1 do
        PP_line = read(PP_file)
        if not PP_line then break end
        
        local PP_tabPos1 = strfind(PP_line, "\t")
        if PP_tabPos1 then
            local PP_mapId = tonumber(strsub(PP_line, 1, PP_tabPos1 - 1))
            
            local PP_remaining = strsub(PP_line, PP_tabPos1 + 1)
            local PP_tabPos2 = strfind(PP_remaining, "\t")
            
            if PP_tabPos2 then
                local PP_broadcastId = tonumber(strsub(PP_remaining, 1, PP_tabPos2 - 1))
                local PP_message = strsub(PP_remaining, PP_tabPos2 + 1)
                
                if PP_mapId and PP_broadcastId and PP_message and strlen(PP_message) > 0 then
                    local PP_key = PP_mapId .. "_" .. PP_broadcastId
                    
                    -- 如果已存在相同key，存储为数组
                    if x929561_g_dropNotifyMap[PP_key] then
                        if type(x929561_g_dropNotifyMap[PP_key]) == "string" then
                            local PP_oldMessage = x929561_g_dropNotifyMap[PP_key]
                            x929561_g_dropNotifyMap[PP_key] = {PP_oldMessage, PP_message}
                        else
                            local PP_arraySize = getn(x929561_g_dropNotifyMap[PP_key])
                            x929561_g_dropNotifyMap[PP_key][PP_arraySize + 1] = PP_message
                        end
                    else
                        x929561_g_dropNotifyMap[PP_key] = PP_message
                    end
                end
            end
        end
    end
    
    closefile(PP_file)
    return 1
end

--初始化加载
x929561_LoadDropNotifyData()

function x929561_GetRandomMessage(sceneId, selfId, messages)
    if type(messages) == "string" then
        return messages
    elseif type(messages) == "table" then
        local PP_count = getn(messages)
        if PP_count > 0 then
            local PP_rnd = random(PP_count)
            return messages[PP_rnd]
        end
    end
    return nil
end

function x929561_GetDropNotification(sceneId, selfId, mapId, itemId)
    -- 检查地图ID是否存在
    if not x929561_g_itemMap[mapId] then
        return nil
    end
    
    -- 检查物品ID是否存在  
    if not x929561_g_itemMap[mapId][itemId] then
        return nil
    end
    
    -- 获取广播类型ID列表
    local PP_broadcastIds = x929561_g_itemMap[mapId][itemId]
    local PP_broadcastId = nil
    
    -- 随机选择一个广播类型ID
    local PP_broadcastCount = getn(PP_broadcastIds)
    if PP_broadcastCount > 1 then
        local PP_rnd = random(PP_broadcastCount)
        PP_broadcastId = PP_broadcastIds[PP_rnd]
    else
        PP_broadcastId = PP_broadcastIds[1]
    end
    
    -- 构建查询key
    local PP_key = mapId .. "_" .. PP_broadcastId
    
    -- 获取消息
    local PP_messages = x929561_g_dropNotifyMap[PP_key]
    if PP_messages then
        return x929561_GetRandomMessage(sceneId, selfId, PP_messages)
    else
        return nil
    end
end


function x929561_DropNotify(sceneId, selfId, itemId, bagidx)

	local PP_mapid = GetMissionData(sceneId, selfId, MD_HUMAN_TEMP_MAPID)
    if not x929561_g_itemMap[PP_mapid] or not x929561_g_itemMap[PP_mapid][itemId] then
        return 0
    end
    local PP_notifyMsg = x929561_GetDropNotification(sceneId, selfId, PP_mapid, itemId)
    if not PP_notifyMsg then
        return 0
    end
    local PP_playerName = GetName(sceneId, selfId)
    local PP_sceneName = GetSceneNameById(PP_mapid)
    local PP_itemTransfer = GetBagItemTransfer(sceneId, selfId, bagidx)
    local PP_msg = PP_notifyMsg
    PP_msg = gsub(PP_msg, "&S", PP_sceneName)
    PP_msg = gsub(PP_msg, "&U", "#{_INFOUSR" .. PP_playerName .. "}")
    PP_msg = gsub(PP_msg, "&I", "#{_INFOMSG" .. PP_itemTransfer .. "}") 
    -- 发送广播消息
    BroadMsgByChatPipe(sceneId, selfId, PP_msg, 4)
	return 1
end


function x929561_UpdateScenId(sceneId, selfId, mapid)
	-- AddGlobalCountNews( sceneId, "mapid:"..tostring(mapid) )
    if mapid == nil or mapid == -1 then
        return
    end
	if mapid >=0 and mapid <= 35 then
		if mapid ~= sceneId then
			return
		end
	end
    SetMissionData(sceneId, selfId, MD_HUMAN_TEMP_MAPID, mapid)
end