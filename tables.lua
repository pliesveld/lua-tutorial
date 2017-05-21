--[[
 - <description of tables>
--]]

local mytable = {}
local key = 'section'
print("mytable ", mytable, "has type", type(mytable))

mytable[1] = 'Lua'
mytable[key] = 'Tutorial'

local tableref = mytable
tableref[key] = 'Table Tutorial'

assert(mytable[key] == tableref[key])
-- second variable tableref points to the same memory as mytable


--[[

 #table

 The length operator is denoted by the unary operator #. The length of a string is its number of bytes (that is,
  the usual meaning of string length when each character is one byte).

 The length of a table t is defined to be any integer index n such that t[n] is not nil and t[n+1] is nil; moreover,
  if t[1] is nil, n can be zero. For a regular array, with non-nil values from 1 to a given n, its length is
  exactly that n, the index of its last value. If the array has "holes" (that is, nil values between
  other non-nil values), then #t can be any of the indices that directly precedes a nil value (that is, it may
  consider any such nil value as the end of the array).


--]]

assert(#mytable == 1)

tableref[2] = 'is'
tableref[3] = 'fun'

assert(#mytable == #tableref)

mytable[5] = 'use'
assert(#mytable == 3) -- there is a hole, index 4 is not set

mytable[4] = 'to' -- after filling in the hole, the length of the table becomes 5
assert(#mytable == 5)

-- standard library

--[[ ipairs (t)
     This functions fetches the indices and values of tables.  It uses array-based index scanning and stops
     when a numerical index n+1 is nil.
--]]

mytable[7] = 'does not print'

assert(mytable['invalid'] == nil)
assert(mytable[key] ~= nil)
assert(type(mytable[key]) == type('string'))

for key, value in ipairs(mytable)
do
    print('mytable[',key,']=',value)
end


--[[ next (table [, index])
     Allows a program to traverse all fields of a table. Its first argument is a
     table and its second argument is an index in this table. next returns the
     next index of the table and its associated value.
--]]
local index
repeat
    index, value = next(mytable, index)
    print('mytable[',index,']=',value)
until(index == nil)

tableref = nil
mytable = nil

--[[ The following table operations only work on array-based tables.  Keys in array-based tables are numeric and
  start at 1.
--]]

-- print(table.unpack(mytable)) -- causes error because table has associative keys

--          1      2     3      4     5
mytable = {"Lua", "is", "fun", "to", "use"}


--[[ table.unpack (list [, i [, j] ])
 Returns the elements from the given table. This function is equivalent to

     return list[i], list[i+1], ···, list[j]

 By default, i is 1 and j is #list.
--]]

print('unpack:', table.unpack(mytable,1,1))
print('unpack:', table.unpack(mytable,2))

-- table.concat (list [, sep [, i [, j]]])
--[[
 Given a list where all elements are strings or numbers, returns the string list[i]..sep..list[i+1] ··· sep..list[j].
  The default value for sep is the empty string, the default for i is 1, and the default for j is #list. If i is
   greater than j, returns the empty string.
--]]
print('concat:', table.concat(mytable, '*',1,3))

--[[ table.insert (list, [pos,] value)
 Inserts element value at position pos in list, shifting up the elements list[pos], list[pos+1], ···, list[#list].
  The default value for pos is #list+1, so that a call table.insert(t,x) inserts x at the end of list t.
 ]]

print('before insert:', table.concat(mytable,' '))
table.insert(mytable, 4, 'and')
table.insert(mytable, 5, 'fast')
print('after insert:', table.concat(mytable,' '))


--[[ table.remove (list [, pos])
 Removes from list the element at position pos, returning the value of the removed element. When pos is
  an integer between 1 and #list, it shifts down the elements list[pos+1], list[pos+2], ···, list[#list]
  and erases element list[#list]; The index pos can also be 0 when #list is 0, or #list + 1; in those cases,
  the function erases the element list[pos].

 The default value for pos is #list, so that a call table.remove(t) removes the last element of list t.
--]]
table.remove(mytable,2)
table.remove(mytable)
print('after remove:', table.concat(mytable,' '))

--[[ table.pack (···)
 Returns a new table with all parameters stored into keys 1, 2, etc. and with
  a field "n" with the total number of parameters. Note that the resulting table may not be a sequence.
--]]
print("args = table.pack('Lua', 'is', 'fun', 'and', 'fast', 'to', 'use')")
args = table.pack('Lua', 'is', 'fun', 'and', 'fast', 'to', 'use')
assert(type(args) == 'table')
print(table.concat(args,'^'))


--[[ table.sort (list [, comp])

 Sorts list elements in a given order, in-place, from list[1] to list[#list]. If comp is given, then
  it must be a function that receives two list elements and returns true when the first element must
  come before the second in the final order (so that not comp(list[i+1],list[i]) will be true after the sort).
  If comp is not given, then the standard Lua operator < is used instead.

 The sort algorithm is not stable; that is, elements considered equal by the given order may have their
  relative positions changed by the sort.

--]]

print('before sort:', table.concat(args,' '))
table.sort(args)
print('after sort:', table.concat(args,' '))

print('before sort:', table.concat(mytable,' '))
local mycomp = function(lhs, rhs)
    return string.lower(lhs) < string.lower(rhs)
end
table.sort(mytable, mycomp)
print('after sort:', table.concat(mytable,' '))


--[[ rawget (table, index) / rawset (table, index, value)
     This functions fetches the indices and values of tables.
--]]