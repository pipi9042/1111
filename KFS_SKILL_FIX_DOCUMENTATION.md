# LuaFnAskWashKfsSkillPiPiFix Function Implementation

## Overview
This document describes the implementation and fixes for the `LuaFnAskWashKfsSkillPiPiFix` function based on disassembly analysis.

## Issues Fixed

### 1. Skill ID Retrieval (Double Dereference Issue)
**Problem**: The original code used single pointer dereference to get skill IDs:
```cpp
int newSkillId = *(int*)((char*)currentIter + 0x28);  // WRONG
```

**Fix**: Based on assembly analysis at `loc_8F80AF: mov rax, [rdi+28h]; mov r14d, [rax]`, the correct approach uses double dereference:
```cpp
int** skillIdPtr = (int**)((char*)currentIter + 0x28);
int newSkillId = **skillIdPtr;  // CORRECT - Double dereference
```

**Assembly Evidence**:
- `mov rax, [rdi+28h]` - First dereference to get pointer
- `mov r14d, [rax]` - Second dereference to get actual skill ID

### 2. Skill Duplicate Checking Logic
**Problem**: The original code checked against original item skills instead of already set skills:
```cpp
for (int k = 0; k < 3; k++) {
    int existingSkillData = Item_GetKfsSkillData(item, (uint16_t)k);  // WRONG
    if (existingSkillData == newSkillId) {
        // Duplicate check logic
    }
}
```

**Fix**: Check against already set skills on the player:
```cpp
for (int k = 0; k < currentSkillIndex; k++) {
    int existingSkillId = Kfs_GetSkillID(player, k);  // CORRECT
    if (existingSkillId == newSkillId) {
        canUseSkill = false;
        break;
    }
}
```

### 3. Loop Control Logic
**Problem**: The original loop control didn't follow the assembly logic from `loc_8F8157`.

**Fix**: Implemented proper loop control that:
- Only increments `currentSkillIndex` on successful skill setting
- Advances the iterator pointer by 0x30 bytes after successful setting
- Includes safety limits to prevent infinite loops
- Properly handles failed skill setting attempts

### 4. Exception Handling
**Problem**: Missing comprehensive exception handling.

**Fix**: Added comprehensive exception handling with:
```cpp
try {
    // Main function logic
} catch (const std::exception& e) {
    LogDebug(1, "LuaFnAskWashKfsSkillPiPiFix: Exception caught: %s", e.what());
    return -1;
} catch (...) {
    LogDebug(1, "LuaFnAskWashKfsSkillPiPiFix: Unknown exception caught");
    return -1;
}
```

## Function Signature
```cpp
int LuaFnAskWashKfsSkillPiPiFix(int player, int item);
```

**Parameters**:
- `player`: Player object pointer/identifier
- `item`: Item object pointer/identifier containing skill data

**Returns**:
- Number of skills successfully set (0-3)
- -1 on error or exception

## Safety Features
1. **Null Pointer Checks**: Validates player and item pointers
2. **Iterator Safety**: Checks skill ID pointers before dereferencing
3. **Loop Limits**: Maximum iteration limit to prevent infinite loops
4. **Skill ID Validation**: Skips invalid skill IDs (≤ 0)
5. **Comprehensive Logging**: Debug logs for all major operations

## Integration
The function is automatically registered in the Lua environment through:
```cpp
RegisterFunction_funcPtr(*lua_state, (void*)"LuaFnAskWashKfsSkillPiPiFix", (int)&LuaFnAskWashKfsSkillPiPiFix);
```

## Testing
The implementation has been tested with mock data to verify:
- ✅ Correct skill setting for unique skills
- ✅ Proper duplicate detection and skipping
- ✅ Maximum skill limit enforcement
- ✅ Exception handling framework

## Assembly Analysis Reference
Key assembly locations analyzed:
- `loc_8F80AF`: Double dereference pattern for skill ID retrieval
- `loc_8F8157`: Main loop control logic
- Iterator advancement pattern: 0x30 byte offsets

## Constants
- `MAX_KFS_SKILLS = 3`: Maximum number of KFS skills that can be set
- `MAX_ITERATION_ATTEMPTS = 10`: Safety limit for loop iterations
- `0x28`: Offset for skill ID pointer in item structure
- `0x30`: Size of skill entry structure for iterator advancement