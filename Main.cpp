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
#include <dlfcn.h>
#include <stdlib.h>     // for system()

#define RED     "\033[31m"
#define GREEN   "\033[32m"
#define YELLOW  "\033[33m"
#define BLUE    "\033[34m"
#define MAGENTA "\033[35m"
#define CYAN    "\033[36m"
#define WHITE   "\033[37m"
#define RESET   "\033[0m"

typedef int(*STRCMP)(const char*, const char*); 
int asas = 0;
unsigned char HexJmp[5] = { 0xE9 ,0x00,0x00, 0x00, 0x00 };
unsigned char HexCall[5] = { 0xE8 ,0x00,0x00, 0x00, 0x00 };

bool ReplaceMemoryFunction(uintptr_t targetAddress, void* newFunction) {
    // 获取当前内存页的起始地址和大小
    uintptr_t pageStart = targetAddress & ~(sysconf(_SC_PAGESIZE) - 1);
    size_t pageSize = sysconf(_SC_PAGESIZE);

    // 修改内存页的权限为可读可写
    if (mprotect(reinterpret_cast<void*>(pageStart), pageSize, PROT_READ | PROT_WRITE) != 0) {
        return false;
    }

    // 计算目标地址处函数指针的实际地址
    uintptr_t functionAddress = reinterpret_cast<uintptr_t>(newFunction);

    // 修改目标地址的内容为函数的地址
    *reinterpret_cast<uintptr_t*>(targetAddress) = functionAddress;

    // 恢复内存页的原始权限（如果需要）
    if (mprotect(reinterpret_cast<void*>(pageStart), pageSize, PROT_READ) != 0) {
        return false;
    }

    return true;
}
void modifyMemory(unsigned char* address, unsigned char* callInstruction, uint32_t newFunctionAddress) {
    const size_t instructionSize = 5;
    uint32_t offset = newFunctionAddress - (reinterpret_cast<uint32_t>(address) + instructionSize);
    memcpy(&callInstruction[1], &offset, sizeof(offset));

    size_t page_size = sysconf(_SC_PAGESIZE);
    void* aligned_address = (void*)((uintptr_t)address & ~(page_size - 1));
    mprotect(aligned_address, page_size, PROT_READ | PROT_WRITE | PROT_EXEC);

    memcpy(address, callInstruction, instructionSize);
    mprotect(aligned_address, page_size, PROT_READ | PROT_EXEC);
}
// 修改指定内存地址的数据
void modifyMemory_Hex(void* address, const void* newData, size_t size) {
    // 计算页大小
    size_t page_size = sysconf(_SC_PAGESIZE);
    // 计算对齐地址  
    void* aligned_address = (void*)((uintptr_t)address & ~(page_size - 1));
    // 修改内存页的保护属性为可读写
    mprotect(aligned_address, page_size, PROT_READ | PROT_WRITE | PROT_EXEC);

    // 拷贝新数据到指定地址
    memcpy(address, newData, size);

    // 恢复内存页的保护属性为可读可执行
    mprotect(aligned_address, page_size, PROT_READ | PROT_EXEC);
}

void createDirectoryIfNotExists(const std::string& dirPath) {
    struct stat info;
    if (stat(dirPath.c_str(), &info) != 0) {
        mkdir(dirPath.c_str(), 0777);
    }
}
int strcmp(const char* s1, const char* s2) {
    static void* handle = NULL;
    static STRCMP old_strcmp = NULL;
    if (!handle)
    {
        handle = dlopen("libc.so.6", RTLD_LAZY);
        old_strcmp = (STRCMP)dlsym(handle, "strcmp");
    }
    if (asas == 0) {
        asas = 1;
        BYTE mjdsadw[] = { 0x89,0x47,0x14,0x83,0xec,0x08,0xff,0x75,0x1c,0xff,0x75,0x0c,0xff,0x75,0x08,0x57,0x51,0xe8,0xc4,0xcd,0xd4,0xff,0x83,0xc4,0x10,0x90 };
        modifyMemory_Hex(reinterpret_cast<unsigned char*>(0x083A08EE), mjdsadw, sizeof(mjdsadw));

        ReplaceMemoryFunction(0x0854A6B0, reinterpret_cast<void*>(&Combat_Module::Impact_Module::StdImpact011_T::GetIntAttrRefix));
        ReplaceMemoryFunction(0x0854AF30, reinterpret_cast<void*>(&Combat_Module::Impact_Module::StdImpact013_T::GetIntAttrRefix));
        modifyMemory(reinterpret_cast<unsigned char*>(0x08333F9F), HexCall, reinterpret_cast<uint32_t>(&LuaCFuncRegister::RegisterCFunction));
        modifyMemory(reinterpret_cast<unsigned char*>(0x0810D202), HexCall, reinterpret_cast<uint32_t>(&Scene::OnScenePlayerLogin));



        modifyMemory(reinterpret_cast<unsigned char*>(0x083A08FF), HexCall, reinterpret_cast<uint32_t>(&Obj_Character::RefixImpact));





        // modifyMemory(reinterpret_cast<unsigned char*>(0x0819B2AC), HexJmp, reinterpret_cast<uint32_t>(&Packets::CGCommandHandler::Execute));

        uintptr_t address = 0x08664598;
        int* ptr = reinterpret_cast<int*>(address);
        //*ptr = 0;

    }
    return old_strcmp(s1, s2);
}

__attribute__((constructor))
void FoxtEngine() {
    // 清屏
    system("clear");

    // 最终显示并停留2秒
    printf("\033[2J\033[H");  // 清屏并回到顶部
    printf(CYAN "========================================\n" RESET);
    printf(YELLOW "           🚀 FoxEngine.so 已加载！  \n" RESET);
    printf(MAGENTA "           鲸落 Q1292366050          \n" RESET);
    printf(CYAN "========================================\n" RESET);

    usleep(1000000);  
    printf("\n" GREEN ">>> 正在启动引擎...\n" RESET);
    printf("\n" GREEN ">>> 正在启动引擎...\n" RESET);
    printf("\n" GREEN ">>> 正在启动引擎...\n" RESET);
    usleep(1000000);  
}