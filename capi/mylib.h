
extern int luaopen_mylib(lua_State *L);

#define LUA_EXTRALIBS { "mylib", luaopen_mylib },
