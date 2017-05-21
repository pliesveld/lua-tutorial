local function fib(c)
    if c == 0 then
        return 0
    end
    if c == 1 then
        return 1
    end

    return fib(c-1) + fib(c-2)
end

for arg=1,10 do
    print('The fibonacci of ', arg, 'is', fib(arg))
end