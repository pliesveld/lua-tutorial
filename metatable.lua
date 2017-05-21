
--[[
    A table can be assigned a pointer to another table, called a metatable.  The metatable plays a role when performing
    operations on a table, such as: arithmetic operations, logical operations, index quering and assignment, invocation,
    and garbage collection.
 ]]

local mytable = {y = 'Y', z = 'Z'}
local mymetatable = {}

local RETURN = 'RETURN'

local function print_event(name, ...)
    local args = {...}
    args = args[1] -- unpack
    print('event', name, '#args', #args)

    if args then
        for key, val in pairs(args) do
            print('arg[',key,'] = (', type(val), ') ', val)
        end
    end
    return RETURN
end

mymetatable.__add = function(...) return print_event('add', {...}) end
mymetatable.__sub = function(...) return print_event('sub', {...}) end
mymetatable.__mul = function(...) return print_event('mul', {...}) end
mymetatable.__div = function(...) return print_event('div', {...}) end
mymetatable.__pow = function(...) return print_event('pow', {...}) end
mymetatable.__unm = function(...) return print_event('unm', {...}) end

mymetatable.__concat = function(...) return print_event('concat', {...}) end

mymetatable.__eq = function(...) return print_event('eq', {...}) end
mymetatable.__lt = function(...) return print_event('lt', {...}) end
mymetatable.__le = function(...) return print_event('le', {...}) end

mymetatable.__index = function(...) return print_event('index', {...}) end
mymetatable.__newindex = function(...) return print_event('newindex', {...}) end

mymetatable.__call = function(...) return print_event('call', {...}) end

--mymetatable.__tostring = function(...) return print_event('tostring', {...}) end
mymetatable.__tonumber = function(...) return print_event('tonumber', {...}) end

--mymetatable.__gc = function(...) print('gc') end
--mymetatable.__mode = 'v' or 'k'

setmetatable(mytable,mymetatable)
assert(getmetatable(mytable) == mymetatable)

local mytable_cnt = 0
for key,val in pairs(mytable) do
    print(key, val)
    mytable_cnt = mytable_cnt + 1
end

local mymetatable_cnt = 0
for key,val in pairs(mymetatable) do
    print(key, val)
    mymetatable_cnt = mymetatable_cnt + 1
end

print('mytable:    ', mytable)
print('mymetatable:', mymetatable)
print('#mytable:    ', #mytable)
print('#mymetatable:', #mymetatable)
print('key count', mytable_cnt, mymetatable_cnt)

x = mytable + 1
x = 1 - mytable
x = mytable.x
mytable.x = 1
print(mytable.x)
rawset(mytable, 'x', 'X')
print(mytable.x)

print(mytable.y)
mytable.y = nil
print(mytable.y)

mytable()
mytable(1,2,3,4,5)
mytable(mytable.x, mytable.y, mytable.z)

mytable(mytable)
mytable(mytable(mytable))

