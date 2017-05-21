--[[
    Functions are first-class citizens.  They may be assigned to variables and passed in as arguments.
 ]]

function foo(arg)
    assert(type(arg) == 'function', "Argument must be a function")
end

assert(type(foo) == 'function')

bar = function() end
assert(type(bar) == 'function')

foo(bar)


--[[
    Functions may take a variable number of arguments.
 ]]
function average(...)
    result = 0
    local arg={...}
    for i,v in ipairs(arg) do
        result = result + v
    end
    return result/#arg
end

print("The average is",average(10,5,3,4,5,6))

