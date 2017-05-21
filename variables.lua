local astring = 'astring';

print(astring)

local bstring = astring;

print(astring)
print(bstring)

print('assigning astring to something else')

astring = 'something else'

print(astring)
print(bstring)

-- swapping variables

astring, bstring = bstring, astring

print(astring)
print(bstring)

f = 70.0/3.0
print("value of f", f)


--[[lua has the following types]]--

-- nil
local var = nil
print("var ", var, "has type", type(var))
-- boolean
local var = true
print("var ", var, "has type", type(var))
-- number
local var = 0
print("var ", var, "has type", type(var))
-- string
local var = 'astring'
print("var ", var, "has type", type(var))
-- function
local var = print
print("var ", var, "has type", type(var))
-- table
local var = {}
var[1] = 'test'
var['assosciative'] = 'test'
print("var ", var, "has type", type(var))


-- userdata
--local var = array.new(1000)
--print("var ", var, "has type", type(var))

-- thread

