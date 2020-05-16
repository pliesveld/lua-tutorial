--[[
    functions can reference outside of their scope
--]]

var = 'outside'
function scopecheck()
    var = 'inside'  -- var is global, and is scoped outside of the function
    print("inside scopecheck: var=", var)
end

print("before scopecheck: var==", var)
scopecheck()
print("after scopecheck: var==", var)

var2 = 'outside'
function scopecheck2()
    local var2 = 'inside'  -- var2 is local to the function scope
    print("inside scopecheck: var2=", var2)
end

print("before scopecheck2: var2==", var2)
scopecheck2()
print("after scopecheck2: var2==", var2)


-- parameters behave like other local variables inside the function.
-- They are created upon function entry and destroyed upon exit.
var3 = 'outside'
function scopecheck3(var3_arg)
    var3_arg = 'inside'
    print("inside scopecheck: var3_arg=", var3_arg)
end

print("before scopecheck3: var3==", var3)
scopecheck(var3)
print("after scopecheck3: var3==", var3)

-- globals assigned from inside a function are visible outside
function scopecheck4()
    var4 = 'var_inside_only' -- global
    print("inside scopecheck: var4=", var4)
end

print("before scopecheck4: var4==", var4)
scopecheck4()
print("after scopecheck4: var4==", var4)


function f(a, b) end          -- When a function is called, the list of arguments is adjusted to the length of the list of paramters.
function r() return 1,2,3 end -- functions can return multiple values
function g(a, b, ...) end     -- A vararg function does not adjust its argument list; instead, it collects all
                                -- extra arguments into an implicit parameter, called arg, with type table.
-- CALL         -- PARAMETERS
f(3)            -- a=3, b=nil
f(3, 4)         -- a=3, b=4
f(3, 4, 5)      -- a=3, b=4
f(r(), 10)      -- a=1, b=10
f(r())          -- a=1, b=2
g(3)            -- a=3, b=nil, arg={n=0}
g(3, 4)         -- a=3, b=4, arg={n=0}
g(3, 4, 5, 8)   -- a=3, b=4, arg={5, 8; n=2}
g(5, r())       -- a=5, b=1, arg={2, 3; n=2}

-- Because a function can return any number of results, the number of results must
--  be adjusted before they are used.

--function h() return 1, 2, 3, 4  end

--h()             -- adjusted to 0 results
--g(h(), x)       -- h() is adjusted to 1 result
--g(x, h())       -- g gets x plus all values returned by h()
--a,b,c = h(), x  -- f() is adjusted to 1 result (and c gets nil)
--a,b,c = x, h()  -- f() is adjusted to 2 results
--a,b,c = h()     -- f() is adjusted to 3 results

--[[
return f()      -- returns all values returned by f()
return x,y,f()  -- returns x, y, and all values returned by f()
--]]

--{h()}           -- creates a list with all values returned by r()
--{f(), nil}      -- f() is adjusted to 1 result

-- enclosing function call in parentheses (f())
--return x,y,(f())-- returns x, y, and the first value from f()
--    {(f())}     -- creates a table with exactly one element



