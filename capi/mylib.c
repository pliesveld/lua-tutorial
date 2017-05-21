#include <stdio.h>

#define LUA_LIB

//#define LUA_COMPAT_MODULE // lua < 5.2

#include <lua.h>
#include <lauxlib.h>
#include "mylib.h"

static int foo(lua_State *L) {
    printf("Hello, World!\n");
    return 0;
}

static const struct luaL_Reg myLib[] = {
	{"foo", foo},
	{NULL, NULL}
};

int luaopen_mylib(lua_State *L) {
//	luaL_register(L, "mylib", mylib); // lua < 5.2
//  http://stackoverflow.com/questions/19041215/lual-openlib-replacement-for-lua-5-2
    lua_newtable(L);
    luaL_setfuncs(L, myLib, 0);
	return 1;
}
