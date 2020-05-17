--[[
    setmetatable(table,metatable) − This method is used to set metatable for a table.
--]]

local serpent = require('vendor/serpent')


local mytable = {} -- table
local mymetatable = {} -- metatable
setmetatable(mytable, mymetatable)
-- print(serpent.dump(mytable))
-- print(serpent.dump(mymetatable))

local mytable = setmetatable({},{}) -- same as above
-- print(serpent.dump(mytable))


--[[ 
    When looking up a key in a table, and that key does not exist, then
    the metatable __index can override behavior.

    __index can be a function, or a table 
]]

print('__index')

mytable = setmetatable({key1 = "value1"}, {
   __index = function(mytable, key)
	
      if key == "key2" then
         return "metatablevalue"
      else
--         return mytable[key] -- causes overflow if accessing key
         return rawget(mytable, key) 
      end
   end
})

print('mytable:', serpent.line(mytable))
print(mytable.key1, mytable.key2)

mytable2 = setmetatable({key1 = "value1"}, 
   { __index = { key2 = "metatablevalue" } })

print('mytable2:', serpent.line(mytable2))
print(mytable2.key1, mytable2.key2) -- key1 is looked-up and found in mytable, while key2 is looked-up and found in the metatable of mytable


-- accessing element that does not exist causes overflow with function but not table
print(mytable.key1, mytable.key2, mytable['key3']) -- causes overflow without rawget
print(mytable2.key1, mytable2.key2, mytable2['key3'])


print('__newindex')

metatable = { __newindex = function(mytable, key, value) rawset(mytable, key, "\""..value.."\"") end }
mytable = setmetatable({key1 = 'value1'}, metatable)

print("before: ", serpent.line(mytable))

mytable.key1 = 'new value' -- assignment updates key in table mytable
mytable.key2 = 4 -- assignment is handled by metatable due to __newindex
-- rawset(mytable, key3, 'rawset') -- error: table index is nil

print("after: ", serpent.line(mytable))





-- metatables can be chained:

local Metatable = {
    make = 'Default',
    __index = { model = 'Default' }
}

setmetatable(Metatable,Metatable) -- try commenting this line out

local Car = {
    __class = 'Car',
    __index = Metatable
}

setmetatable(Car,Car)

print('make: ', Car['make'])
print('model: ', Car['model'])




