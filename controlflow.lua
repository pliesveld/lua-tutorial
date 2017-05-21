
--[[ Keywords in lua:

and	break	do	else
elseif	end	false	for
function	if	in	local
nil	not	or	repeat
return	then	true	until
while

]]--


-- conditional
local var = 'hotdog'

if var == 'hotdog' then
    print 'hotdog'
else
    print 'not hotdog'
end

var = 'hog'
if var == 'hotdog' then
    print 'hotdog'
elseif string.sub(var,0,1) == 'h' then
    print 'starts with h'
else
    print 'not hotdog'
end

-- loops

a = 10

while (a > 0) do
    print('Value of a:', a)
    a = a - 1
end


--[[
     for initial, max/min, increment
     do
        statements
    end
  ]]

for a=10,0,-1 do
    print('Value of a:', a)
end

-- repeat until loop ( do-while )

a = 10
repeat
    print('Value of a:', a)
    a = a - 1
until(a <= 0)

