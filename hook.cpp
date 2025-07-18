#include <stdio.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h> 
#include <cstring>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <iostream>
#include <exception> 
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h> 
#include "hook.h"
#include <cstdarg>
#include <ctime>
#include <vector>
#include <array>
#include <algorithm>
#include <chrono>


int lua_State = 0;
typedef unsigned long       DWORD;
typedef unsigned __int16 WORD;
typedef unsigned char BYTE;

playerData globalplayerData;
 
int _ITEM::GetItemCount(int a1) {
    typedef int(*old_ITEM_GetItemCount)(int);
    old_ITEM_GetItemCount funcPtr = reinterpret_cast<old_ITEM_GetItemCount>(0x080AC588);
    return funcPtr(a1);
}
void __assert__(const char* file, int line, const char* func, const char* expr) {
    typedef int (*__assert__)(const char*, int, const char*, const char*);
    __assert__ funcPtr = reinterpret_cast<__assert__>(0x083FD940);
    funcPtr(file, line, func, expr);
}


int Combat_Module::Impact_Module::StdImpact011_T::GetIntAttrRefix(int a1, int a2, int a3, int a4, int* a5) {
    typedef int(*GetIntAttrRefix)(int, int, int, int, int*);
    GetIntAttrRefix funcPtr = reinterpret_cast<GetIntAttrRefix>(0x083CC1DC);
    int ret = funcPtr(a1, a2, a3, a4, a5);
    if (ret == 1) {
        int m_pScene = *(DWORD*)(a3 + 36);
        if (m_pScene > 0) {
            int LuaInterface_0 = *(DWORD*)(m_pScene + 2704);
            if (LuaInterface_0 > 0) {
                if (a4 == 21 || a4 == 24 || a4 == 27 || a4 == 30 ) {
                    int retValue = LuaInterface::ExeScript_DDDDDD(LuaInterface_0, 768990, (int)"So_BackStdImpact011", *(signed __int16*)(m_pScene + 18), *(DWORD*)(a3 + 4), *(DWORD*)(a2 + 0x0c), *(WORD*)(a2 + 4), a4, *a5);
                    *a5 = retValue;
                }
            }
        }
    }
    return ret;
}
int Combat_Module::Impact_Module::StdImpact013_T::GetIntAttrRefix(int a1, int a2, int a3, int a4, int* a5) {
    typedef int(*GetIntAttrRefix)(int, int, int, int, int*);
    GetIntAttrRefix funcPtr = reinterpret_cast<GetIntAttrRefix>(0x083CD2A4);
    int ret = funcPtr(a1, a2, a3, a4, a5);
    if (ret == 1) {
        int m_pScene = *(DWORD*)(a3 + 36);
        if (m_pScene > 0) {
            int LuaInterface_0 = *(DWORD*)(m_pScene + 2704);
            if (LuaInterface_0 > 0) {
                int retValue = LuaInterface::ExeScript_DDDDDD(LuaInterface_0, 768990, (int)"So_BackStdImpact013", *(signed __int16*)(m_pScene + 18), *(DWORD*)(a3 + 4), *(DWORD*)(a2 + 0x0c), *(WORD*)(a2 + 4), a4, *a5);
                *a5 = retValue;
            }
        }
    }
    return ret;
}

int LuaInterface::ExeScript_DDDDDD(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9) {
    typedef int(*ExeScript_DDDDDD)(int, int, int, int, int, int, int, int, int);
    ExeScript_DDDDDD funcPtr = reinterpret_cast<ExeScript_DDDDDD>(0x08331DC8);
    return funcPtr(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

int LuaInterface::ExeScript_DDDDDDD(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10) {
    typedef int(*ExeScript_DDDDDDD)(int, int, int, int, int, int, int, int, int, int);
    ExeScript_DDDDDDD funcPtr = reinterpret_cast<ExeScript_DDDDDDD>(0x08331960);
    return funcPtr(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

void LuaCFuncRegister::RegisterCFunction(DWORD* lua_state) {
    lua_State = *(DWORD*)((*lua_state) + 112);
    //原始函数注册
    typedef void(*old_RegisterCFunction)(DWORD*);
    old_RegisterCFunction funcPtr = reinterpret_cast<old_RegisterCFunction>(0x0832D0DC);
    funcPtr(lua_state);
    //新函数注册
    typedef void(*FoxLuaScript_RegisterFunction)(int, void*, int);
    FoxLuaScript_RegisterFunction RegisterFunction_funcPtr = reinterpret_cast<FoxLuaScript_RegisterFunction>(0x08407C90);
    // RegisterFunction_funcPtr(*lua_state, (void*)"Lua_SetItemPacketTemporary", (int)&Lua_SetItemPacketTemporary);//天机写入道具
    // RegisterFunction_funcPtr(*lua_state, (void*)"Lua_GetItemPacketTemporary", (int)&Lua_GetItemPacketTemporary);//天机读取道具
    // RegisterFunction_funcPtr(*lua_state, (void*)"Lua_GetItemTileMax", (int)&Lua_GetItemTileMax);//物品最大叠加数
    // RegisterFunction_funcPtr(*lua_state, (void*)"Lua_DelItemByPosCount", (int)&Lua_DelItemByPosCount);
}




long double lua_tonumber(int a1, int a2)
{
    typedef long double(*old_lua_tonumber)(int, int);
    old_lua_tonumber funcPtr = reinterpret_cast<old_lua_tonumber>(0x08408CBC);
    return funcPtr(a1, a2);
}
void lua_pushnumber(int a1, double a2)
{
    typedef void(*old_lua_pushnumber)(int, double);
    old_lua_pushnumber funcPtr = reinterpret_cast<old_lua_pushnumber>(0x08408E44);
    funcPtr(a1, a2);
}
const char* lua_tostring(int L, int nIndex)
{
    typedef const char* (*old_lua_tostring)(int, int);
    old_lua_tostring funcPtr = reinterpret_cast<old_lua_tostring>(0x08408CF8);
    return funcPtr(L, nIndex);
}

const char* lua_dostring(int L, const char* a2)
{
    typedef int(*old_lua_dostring)(int, const char*);
    old_lua_dostring funcPtr = reinterpret_cast<old_lua_dostring>(0x0840A1F4);
    funcPtr(L, a2);
    return lua_tostring(L, -1);
}

int call_GetMissionData(int a1, int a2)
{
    typedef int(*old_GetMissionData)(int, int);
    old_GetMissionData funcPtr = reinterpret_cast<old_GetMissionData>(0x081050C4);
    int ret = funcPtr(a1, a2);
    if (a2 == 202 && ret == 0) {
        auto now = std::chrono::duration_cast<std::chrono::seconds>(std::chrono::system_clock::now().time_since_epoch()).count();
        ret = now * 1000 + Obj_Human::GetGUID(a1) % 100000;
        call_SetMissionData(a1, 202, ret);
    }
    return ret;
}
void call_SetMissionData(int a1, int a2, int a3)
{
    typedef int(*old_SetMissionData)(int, int, int);
    old_SetMissionData funcPtr = reinterpret_cast<old_SetMissionData>(0x0810F870);
    funcPtr(a1, a2, a3);
}
int SceneManager::GetScene(int a1)
{
    int SceneManager = *(int*)0x0CA16FEC;
    int result = 0; // eax
    if (a1 <= 1023)
        result = *(DWORD*)(SceneManager + 4 * (signed __int16)a1);
    return result;
}
int Obj_Human::GetGUID(int a1)
{
    return *(DWORD*)(*(DWORD*)(a1 + 1940) + 68);
}
void LogDebug(int logid, const char* msg, ...) {
    if (logid <= 28) {
        char szBuff[4096];
        memset(szBuff, 0, 4096);
        va_list args;
        va_start(args, msg);
        vsnprintf(szBuff, 3967, msg, args);
        char szTime[128];
        memset(szTime, 0, 128u);
        int v13 = ThreadValueManager::GetCurrentThreadID();
        std::time_t now = std::time(nullptr);
        std::tm* timeinfo = std::localtime(&now); // 获取本地时间
        snprintf(szTime, 127, " (%d)(T0=%d-%d-%d_%d:%d:%d)\n", v13, timeinfo->tm_year + 1900, timeinfo->tm_mon + 1, timeinfo->tm_mday, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
        size_t current_length = strlen(szBuff);
        if (current_length < sizeof(szBuff) - 1) {
            strncat(szBuff, szTime, sizeof(szBuff) - 1 - current_length);
        }
        if (*(int*)0x08697858) {
            Log::CacheLog(*(int*)0x08697858, logid, szBuff);
        }
        va_end(args);
    }
}

void Update_PacketTemporaryData(int nIndex, int HumanPtr, const void* iteminfo)
{
    int GUID = Obj_Human::GetGUID(HumanPtr);
    //缓存内存数据
    int uIndex = Obj_Human::GetPlayerDataIndex(GUID);
    memcpy(globalplayerData.m_temporary[uIndex][nIndex], iteminfo, 176);
    char* currentItem = globalplayerData.m_temporary[uIndex][nIndex];
    int* currentItemId = (int*)(currentItem + 8);
    int currentItemCount = *(unsigned __int8*)(currentItem + 88);
    //更新界面指定数据
    Send_PacketTemporaryData_Client(HumanPtr, currentItem, nIndex, 180);
}
void Send_PacketTemporaryData_Client(int a1, void* src, int pos, int type)//发送物品信息给客户端
{
    char SC[455];
    *(DWORD*)SC = (int)0x084404C8;
    *(WORD*)(SC + 0x10E) = type;
    *(WORD*)(SC + 0x110) = pos + 10;
    memcpy((char*)SC + 0x112, src, 176);
    (*(int(**)(DWORD, char*))(**(DWORD**)(a1 + 97316) + 12))(*(DWORD*)(a1 + 97316), (char*)SC);
}
void Save_PacketTemporaryData(int a1)    //开始存储数据
{
    int GUID = Obj_Human::GetGUID(a1);
    int HumanID = call_GetMissionData(a1, 202);
    char filename[260];
    sprintf(filename, "%s%X-2.db", "./UsersDB/", HumanID);
    FILE* file = fopen(filename, "wb");
    if (file) {
        char data[63360] = { 0 };
        int uIndex = Obj_Human::GetPlayerDataIndex(GUID);
        for (int j = 0; j < 360; ++j) {
            char* temp = globalplayerData.m_temporary[uIndex][j];
            if (temp[0] == 0) {
                char* newTemp[176] = { 0 };
                memcpy(data + j * 176, newTemp, 176);
            }
            else {
                memcpy(data + j * 176, temp, 176);
            }
        }
        fwrite(data, sizeof(char), sizeof(data), file);
        fclose(file);
    }
}
void Send_UICOMMON_Client(int a1, int a2)//发送UI信息给客户端 
{
    int SC[157] = { 0 };
    SC[0] = (int)0x8425BA8;
    SC[156] = a2;
    (*(void(**)(DWORD, DWORD*))(**(DWORD**)(a1 + 97316) + 12))(*(DWORD*)(a1 + 97316), (DWORD*)SC);
}

void Log::CacheLog(int a1, int a2, void* src) {
    typedef int(*CacheLog)(int a1, int a2, void* src);
    CacheLog funcPtr = reinterpret_cast<CacheLog>(0x0815E930);
    funcPtr(a1, a2, src);
}

void Scene::OnScenePlayerLogin(int a1, int a2) {
    //原始函数注册
    typedef void(*old_OnScenePlayerLogin)(int, int);
    old_OnScenePlayerLogin funcPtr = reinterpret_cast<old_OnScenePlayerLogin>(0x083B5270);
    funcPtr(a1, a2);
    // int GUID = Obj_Human::GetGUID(a2);
    // if (GUID != -1) {
        // Obj_Human::InitHumanPacketTemporary(a2);
    // }  
}
 
int ThreadValueManager::GetCurrentThreadID() {  
    typedef int(*old_GetCurrentThreadID)();
    old_GetCurrentThreadID funcPtr = reinterpret_cast<old_GetCurrentThreadID>(0x083FFA04);
    return funcPtr();
}
void Obj_Human::UpdateMyBagList(int a1) {
    typedef void(*old_UpdateMyBagList)(int);
    old_UpdateMyBagList funcPtr = reinterpret_cast<old_UpdateMyBagList>(0x08114F28);
    return funcPtr(a1);
} 
int Obj_Human::GetPlayerDataIndex(int a1) {
    for (int i = 0; i < 2999; ++i) {
        if (globalplayerData.m_guid[i] == a1) {
            return i;
        }
    }
    for (int i = 0; i < 2999; ++i) {
        if (globalplayerData.m_guid[i] == 0) {
            globalplayerData.m_guid[i] = a1;
            return i;
        }
    }
    return -1;
}
void Obj_Human::SendNoticeAndChatMsg(int a1, const char* a2)
{
    typedef void(*old_SendNoticeAndChatMsg)(int, const char*);
    old_SendNoticeAndChatMsg funcPtr = reinterpret_cast<old_SendNoticeAndChatMsg>(0x0810F99C);
    return funcPtr(a1, a2);
}
struct SwapTemporaryItem {
    int id;
    char data[176];
};


int Scene::GetSpecificObjByID(int a1, int a2) {
    typedef int(*GetSpecificObjByID)(int, int);
    GetSpecificObjByID funcPtr = reinterpret_cast<GetSpecificObjByID>(0x083AA2F8);
    return funcPtr(a1, a2);
}
int Combat_Module::Impact_Module::Impact_GetMutexID(int a1) {
    typedef int(*Impact_GetMutexID)(int);
    Impact_GetMutexID funcPtr = reinterpret_cast<Impact_GetMutexID>(0x083C30D8);
    return funcPtr(a1);
}
void Obj_Character::RefixImpact(int a1, int a2, int a3, int a4, int a5) // nSender  rImp  this  nReceiver  nSkillID
{
    if (a1 && a3 && a4) {
        if (*(DWORD*)(a1 + 4) >= 15000 && *(DWORD*)(a1 + 4) <= 23999) {
            int pTarget = Scene::GetSpecificObjByID(*(DWORD*)(a3 + 32), a4);//(a1, t_pObj, a2, a5); //my ,tar,imp,nskillid
            int ImpactID = *(WORD*)(a2 + 4);
            int pMutexID = Combat_Module::Impact_Module::Impact_GetMutexID(a2);
            if (pMutexID == 21 || pMutexID == 17 || pMutexID == 13 || pMutexID == 14|| pMutexID == 8888) {
                int pScene = *(DWORD*)(a1 + 36);
                if (pScene) {
                    int LuaInterface_0 = *(DWORD*)(pScene + 2704);
                    if (LuaInterface_0 > 0) {
                        int retValue = LuaInterface::ExeScript_DDDDDDD(LuaInterface_0, 768990, (int)"So_RefixImpactTime", *(signed __int16*)(pScene + 18), *(DWORD*)(a1 + 4), *(DWORD*)(pTarget + 4), a5, pMutexID, ImpactID, *(DWORD*)(a2 + 0x18));
                        *(DWORD*)(a2 + 0x18) = retValue;
                    }
                }
            }
        }
    }
    //原始函数call
    if (a5 != -1) {
        typedef void(*RefixImpact)(int, int);
        RefixImpact funcPtr = reinterpret_cast<RefixImpact>(0x080ED6C8);
        funcPtr(a1, a2);
    }
}
