#pragma once
#ifndef HOOK_CODE_H
#define HOOK_CODE_H
typedef unsigned long       DWORD;
typedef unsigned char BYTE;
#define __int16 short
#define __int8 char

int Lua_DelItemByPosCount(int a1);
int Lua_SetItemPacketTemporary(int a1);
int Lua_GetItemPacketTemporary(int a1);
int Lua_GetItemTileMax(int a1);
long double lua_tonumber(int a1, int a2);
void ServerNotifyEquipAttr(int a1, int a2, int a3);
void lua_pushnumber(int a1, double a2);
void Update_PacketTemporaryData(int nIndex, int HumanPtr, const void* iteminfo);
void Save_PacketTemporaryData(int a1);
void Send_UICOMMON_Client(int a1, int a2);
void call_SetMissionData(int a1, int a2, int a3);
void Send_PacketTemporaryData_Client(int a1, void* src, int pos, int type);


//新玩家数据
struct playerData {
	int m_guid[2999];   
	int m_missiondata[2999][4096];
	char m_temporary[2999][360][176];
	int m_damage[2999][6];
	char m_equip[2999][1][176]; 
	int m_missinit[2999];
};  

class Combat_Module
{
public:
	Combat_Module() {};
	~Combat_Module() {};

	class Impact_Module {

	public:
		Impact_Module() {};
		~Impact_Module() {};

		class StdImpact011_T {

		public:
			StdImpact011_T() {};
			~StdImpact011_T() {};

			static int GetIntAttrRefix(int a1, int a2, int a3, int a4, int* a5);
		};

		class StdImpact013_T {

		public:
			StdImpact013_T() {};
			~StdImpact013_T() {};

			static int GetIntAttrRefix(int a1, int a2, int a3, int a4, int* a5);
		};
		static int Impact_GetMutexID(int a1);
	};
};

class LuaInterface
{
public:
	LuaInterface() {};
	~LuaInterface() {};
public:
	static int ExeScript_DDDDDD(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9);
	static int ExeScript_DDDDDDD(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10);
};

class LuaCFuncRegister
{
public:
	LuaCFuncRegister() {};
	~LuaCFuncRegister() {};
public:
	static void RegisterCFunction(DWORD* lua_state);
};

class SceneManager
{

public:
	SceneManager() {};
	~SceneManager() {};
public:
	static int GetScene(int a1);
};

class Obj_Human
{

public:
	Obj_Human() {};
	~Obj_Human() {};
public:
	static int GetGUID(int a1);
	static int GetPlayerDataIndex(int a1);
	static void UpdateMyBagList(int a1);
	static void SendNoticeAndChatMsg(int a1, const char* a2);
};

class _ITEM
{

public:
	_ITEM() {};
	~_ITEM() {};
public:
	static int GetItemTileMax(int a1);
	static int GetItemCount(int a1);
};


class Scene
{

public:
	Scene() {};
	~Scene() {};
public:
	static void OnScenePlayerLogin(int a1, int a2);
	static int GetSpecificObjByID(int a1, int a2);
};

class ThreadValueManager
{

public:
	ThreadValueManager() {};
	~ThreadValueManager() {};
public:
	static int GetCurrentThreadID();
};


class Obj_Character
{

public:
	Obj_Character() {};
	~Obj_Character() {};
public:
	static void RefixImpact(int a1, int a2, int a3, int a4, int a5);
};


class Log
{
public:
	Log() {};
	~Log() {};
public:
	static void CacheLog(int a1, int a2, void* src);
};


#endif // HOOK_CODE_H

