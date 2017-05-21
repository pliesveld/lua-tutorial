workdays = {}

-- add elements to set
workdays.monday = true
workdays.tuesday = true
workdays.wednesday = true

-- iterate over the elements in the set
for k,v in pairs(workdays) do
    print(k)
end

-- remove element from set
workdays.monday = nil

if workdays.monday ~= nil then
    print("Don't stay up late...")
end
