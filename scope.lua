--[[ Visibility Rules
    Lua is a lexically scoped language. The scope of variables begins at the first statement after
their declaration and lasts until the end of the innermost block that includes the declaration.
--]]

x = 10                  -- global variable
do                      -- new block
    local x = x         -- new ‘x’, with value 10
    print(x)            --> 10
    x = x+1
    do                  -- another block
        local x = x+1   -- another ‘x’
        print(x)        --> 12
    end
    print(x)            --> 11
end
print(x)                --> 10 (the global one)

--[[
 Because of the lexical scoping rules, local variables can be freely accessed by functions defined
  inside their scope.
]]

local counter = 0
function inc (x)
    counter = counter + x
    return counter
end

print(counter)          --> 0
inc(1)
print(counter)          --> 1
inc(10)
print(counter)          --> 11

--[[
 A local variable used by an inner function is called an upvalue, or external local variable, inside the
  inner function.

 Notice that each execution of a local statement defines new local variables.
 ]]

a = {}
local x = 20
for i=1,10 do
    local y = 0
    a[i] = function () y=y+1; return x+y end
end

--[[
 The loop creates ten closures (that is, ten instances of the anonymous function). Each of these
  closures uses a different y variable, while all of them share the same x.
]]
