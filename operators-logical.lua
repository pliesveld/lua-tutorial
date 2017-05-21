-- Logical operators: and or not

-- all logical operators consider the literals `nil` and `false` as false, and anything else as true.

-- The conjunction operator and returns its first argument if this value is false or nil; otherwise,
--  and returns its second argument.

-- The disjunction operator or returns its first argument if this
--  value is different from nil and false; otherwise, or returns its second argument.

-- Both and and or use short-cut evaluation, that is, the second operand is evaluated only if necessary

print(10 or error())       --> 10
print(nil or "a")          --> "a"
print(nil and 10)          --> nil
print(false and error())   --> false
print(false and nil)       --> false
print(false or nil)        --> nil
print(10 and 20)           --> 20
print(20 and 10)           --> 10
print(1 or 2)              --> 1
print(4 and 5 or 3)        --> 5
