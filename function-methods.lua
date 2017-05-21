--[[
  Functions can be invoked with a table as an arugment.  If the function always invoked with the same table instance
  and only performs operations on it's table parameter, then the function can be considered bound to state.
 ]]

foo = {sum = 0}

--[[
    A function definition of the form:
        function t.a.b.c.f () ... end
    translates to:
        t.a.b.c.f = function () ... end
]]

function foo.method1(self, arg)
    arg = tonumber(arg) or 0
    self.sum = self.sum + arg
end

foo.method1(foo, 3)
foo:method1(3) -- A call v:name(...) is syntactic sugar for v.name(v,...), except that v is evaluated only once.

-- The colon syntax is used for defining methods, that is, functions that have an implicit extra parameter self.
function foo:method2(arg)
    arg = tonumber(arg) or 0
    self.sum = self.sum + arg
end

foo:method2(5)
foo.method2(foo, 5)

assert(foo.sum == 16)

for key,val in pairs(foo) do
    print(foo, "has", key, '=', val)
end
