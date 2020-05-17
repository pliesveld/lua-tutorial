--[[
-- Tables are used for everything in lua, including Arrays
--
-- Arrays in lua are (generally) indexed starting at 1 and not 0
--]]


workdays = {"monday", "tuesday", "wednesday", "thursday", "friday"}

assert(workdays[1] == "monday", "arrays in lua start at index 1")

print('iterating through array: ')
for k,v in ipairs(workdays) do
    print(v)
end

print('iterators: ')
-- 0
-- 1
-- 2
for i = 0, 2 do 
    print(i)
end

print('iterating through with above iterators: ')
-- nil
-- monday
-- tuesday
for i = 0, 2 do 
    print(workdays[i])
end
-- note workdays[0] -- accessing element an index not present returns nil 


workdays = {"monday", "tuesday", "wednesday", "thursday", "friday"}

print('iterating through array with removal:: ')
repeat
    for k,v in ipairs(workdays) do
        print(v)
    end

    print('taking ', table.remove(workdays,1), 'off')
until #workdays == 0

print('****')

serpent = require('vendor/serpent')
workdays = {"monday", "tuesday", "wednesday", "thursday", "friday"}
print(serpent.line(workdays))
table.insert(workdays, #workdays + 1, 'SATURDAY')
table.insert(workdays, #workdays + 1, 'SUNDAY')
print(serpent.line(workdays))

print('****')



